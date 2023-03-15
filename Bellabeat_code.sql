/*
7 of the 18 files have been uploaded to bigquery. The files that have not been uploaded are the spreadsheets that
breakdown the data by minutes. Per the project PDF, the data collected is from 30 users.
*/

#Verifying that there are 30 unique ID entries in the summary CSV spreadsheets
SELECT COUNT(DISTINCT Id)
FROM Bellabeat.daily_activity AS daily_activity #33 unique IDs
SELECT COUNT(DISTINCT Id)
FROM Bellabeat.daily_calories AS daily_calories #33 unique IDs
SELECT COUNT(DISTINCT Id)
FROM Bellabeat.daily_intensities AS daily_intensities #33 unique IDs
SELECT COUNT(DISTINCT Id)
FROM Bellabeat.daily_steps AS daily_steps #33 unique IDs
SELECT COUNT(DISTINCT Id)
FROM Bellabeat.heartrate_seconds AS heartrate_seconds #14 unique IDs
SELECT COUNT(DISTINCT Id)
FROM Bellabeat.sleep_day AS sleep_day #24 unique IDs
SELECT COUNT(DISTINCT Id)
FROM Bellabeat.weight_log_info AS weight_log_info #8 unique IDs

/*
More user data is not a bad thing, just means I have more data to work with to get better results. It is time to make sure that data across the other spreadsheets is consistent.
--'Calories'from daily_activity and daily_calories should be the same
--'TotalStep'from daily_activity should be the same as 'StepTotal'from daily_steps
--Intensity readings should be the same from daily_activity and daily_intensities

These will be checked one by one. Zero output means data is consistent across spreadsheets.
*/

#Verifying 'Calories'
SELECT
  daily_activity.Id,
  daily_activity.ActivityDate,
  daily_activity.Calories AS DAC,
  daily_calories.calories AS DCC
FROM Bellabeat.daily_activity AS daily_activity
INNER JOIN Bellabeat.daily_calories AS daily_calories
ON
  daily_activity.Calories = daily_calories.Calories
WHERE daily_activity.Calories != daily_calories.Calories #zero output

#Verifying Total Steps
SELECT
  daily_activity.Id,
  daily_activity.ActivityDate,
  daily_activity.TotalSteps,
  daily_steps.StepTotal
FROM Bellabeat.daily_activity AS daily_activity
INNER JOIN Bellabeat.daily_steps AS daily_steps
ON
  daily_activity.TotalSteps = daily_steps.StepTotal
WHERE daily_activity.TotalSteps != daily_steps.StepTotal #zero output

#Verifying Intensities
SELECT *
FROM Bellabeat.daily_activity AS daily_activity
INNER JOIN Bellabeat.daily_intensities AS daily_intensities
ON
  daily_activity.VeryActiveDistance = daily_intensities.VeryActiveDistance
  AND daily_activity.ModeratelyActiveDistance = daily_intensities.ModeratelyActiveDistance
  AND daily_activity.LightActiveDistance = daily_intensities.LightActiveDistance
  AND daily_activity.SedentaryActiveDistance = daily_intensities.SedentaryActiveDistance
  AND daily_activity.VeryActiveMinutes = daily_intensities.VeryActiveMinutes
  AND daily_activity.FairlyActiveMinutes = daily_intensities.FairlyActiveMinutes
  AND daily_activity.LightlyActiveMinutes = daily_intensities.LightlyActiveMinutes
  AND daily_activity.SedentaryMinutes = daily_intensities.SedentaryMinutes
WHERE
  daily_activity.VeryActiveDistance != daily_intensities.VeryActiveDistance
  OR daily_activity.ModeratelyActiveDistance != daily_intensities.ModeratelyActiveDistance
  OR daily_activity.LightActiveDistance != daily_intensities.LightActiveDistance
  OR daily_activity.SedentaryActiveDistance != daily_intensities.SedentaryActiveDistance
  OR daily_activity.VeryActiveMinutes != daily_intensities.VeryActiveMinutes
  OR daily_activity.FairlyActiveMinutes != daily_intensities.FairlyActiveMinutes
  OR daily_activity.LightlyActiveMinutes != daily_intensities.LightlyActiveMinutes
  OR daily_activity.SedentaryMinutes != daily_intensities.SedentaryMinutes #zero output

/*
Data fields are the same. This means that I can with just the daily_activity data. Noticed TotalDistance and TrackerDistance in daily_activity do not match for 15 entries. The entries are made up of two distinct users. In future analysis, I will use TotalDistance, but I will note these as possible user error and present to stakeholders.
*/

#Showing count of errors and respective user IDs
SELECT Id, count(Id) as errors
FROM Bellabeat.daily_activity
WHERE TotalDistance != TrackerDistance
GROUP BY Id

#Creating distance_user_error table
CREATE TABLE Bellabeat.distance_user_error
AS (
  SELECT *
  FROM Bellabeat.daily_activity
  WHERE TotalDistance != TrackerDistance
)

#Create column with activity minutes totals
CREATE OR REPLACE TABLE Bellabeat.daily_activity
AS (
  SELECT
    Id,
    ActivityDate,
    TotalSteps,
    TotalDistance,
    TrackerDistance,
    LoggedActivitiesDistance,
    VeryActiveDistance,
    ModeratelyActiveDistance,
    LightActiveDistance,
    SedentaryActiveDistance,
    (VeryActiveMinutes + FairlyActiveMinutes + LightlyActiveMinutes + SedentaryMinutes) as TotalActivityMinutes,
    VeryActiveMinutes,
    FairlyActiveMinutes,
    LightlyActiveMinutes,
    SedentaryMinutes,
    Calories
  FROM Bellabeat.daily_activity
)

/*
The last 3 spreadsheets will be reviewed and cleaned
*/

#In heartrate_seconds table, change Value column to BPM
CREATE OR REPLACE TABLE Bellabeat.heartrate_seconds
AS (
  SELECT
    Id,
    Time,
    Value AS BPM
  FROM Bellabeat.heartrate_seconds
)

#In sleep_day, check to see if time portions of the date string are different
SELECT *
FROM Bellabeat.sleep_day
WHERE SleepDay NOT LIKE "%12:00:00%" #zero output, so time will be removed

CREATE OR REPLACE TABLE Bellabeat.sleep_day
AS (
  SELECT
    Id,
    split(SleepDay, " ") [ordinal(1)] AS SleepDate,
    TotalSleepRecords,
    TotalMinutesAsleep,
    TotalTimeInBed
  FROM Bellabeat.sleep_day
)

#Only two rows have values in Fat column, so column will not be used in analysis
SELECT *
FROM Bellabeat.weight_log_info
WHERE Fat IS NOT NULL

/*
Now that clean up has been completed, it is time to find some trends, such as
--Average total steps, total distance, active distance, active minutes, calories
--Average daily BPMs
--Average minutes asleep, average time in bed
--Average weight in Kg and lbs, average BMI
--Heartrate versus activity levels and calories
--Sleep versus activity levels
*/

#Created view of averages from the daily_activity spreadsheet. Dates are not important here
CREATE VIEW Bellabeat.daily_avgs
AS (
SELECT
  Id,
  avg(TotalSteps) as avg_total_steps,
  avg(TotalDistance) as avg_dist,
  avg(VeryActiveDistance) as avg_very_active_dist,
  avg(ModeratelyActiveDistance) as avg_mod_active_dist,
  avg(LightActiveDistance) as avg_light_activ_dist,
  avg(SedentaryActiveDistance) as avg_sedentary_dist,
  avg(TotalActivityMinutes) as avg_activity_mins,
  avg(VeryActiveMinutes) as avg_very_active_time,
  avg(FairlyActiveMinutes) as avg_fairly_active_time,
  avg(LightlyActiveMinutes) as avg_light_active_time,
  avg(SedentaryMinutes) as avg_sedentary_time,
  avg(Calories) as avg_calories
FROM Bellabeat.daily_activity
GROUP BY Id
)

#Created view for the average heartrates. Dates are not important here
CREATE VIEW Bellabeat.heartrate_avgs
AS (
SELECT
  Id,
  avg(BPM) as avg_bpm
FROM Bellabeat.heartrate_seconds
GROUP BY Id
)

#Created view of sleep averages. Dates are not important here
CREATE VIEW Bellabeat.sleep_avgs
AS(
SELECT
  Id,
  avg(TotalMinutesAsleep) as avg_time_sleeping,
  avg(TotalTimeInBed) as avg_bed_time
FROM Bellabeat.sleep_day
GROUP BY Id
)

#Created view of weight averages. Dates are not important here
CREATE VIEW Bellabeat.weight_avgs
AS(
SELECT
  Id,
  avg(WeightKg) as avg_kg,
  avg(WeightPounds) as avg_lbs,
  avg(BMI) as avg_BMI
FROM Bellabeat.weight_log_info
GROUP BY Id
)

#Compare weight, calories, and activity time
SELECT
  D.Id,
  D.avg_activity_mins,
  D.avg_calories,
  W.avg_lbs,
  W.avg_BMI
FROM Bellabeat.weight_avgs as W
INNER JOIN Bellabeat.daily_avgs as D
  ON D.Id = W.Id
ORDER BY D.avg_activity_mins DESC #on average, the longer the activity minutes, the lower the BMI

#Compare heartrates to calories and weight
Select
  H.Id,
  H.avg_bpm,
  D.avg_calories,
  W.avg_kg,
  W.avg_lbs,
  W.avg_BMI
FROM Bellabeat.heartrate_avgs as H
INNER JOIN Bellabeat.daily_avgs as D
  ON H.Id = D.Id
INNER JOIN Bellabeat.weight_avgs as W
  ON H.Id = W.Id
ORDER BY H.avg_bpm DESC #not enough data to come to a conclusion

#Look into time in bed vs sleeping time
SELECT avg(avg_bed_time - avg_time_sleeping) as avg_time_awake
FROM Bellabeat.sleep_avgs #average time awake in bed is about 42 mins

#Compare sleep to activity time
SELECT
  S.Id,
  S.avg_time_sleeping,
  (S.avg_time_sleeping/S.avg_bed_time) as sleeping_ratio,
  D.avg_activity_mins
FROM Bellabeat.sleep_avgs as S
INNER JOIN Bellabeat.daily_avgs as D
  ON S.Id = D.Id
GROUP BY
  S.Id,
  S.avg_time_sleeping,
  S.avg_bed_time,
  D.avg_activity_mins
ORDER BY sleeping_ratio DESC #on average, more sleep means more activity time

/*
Looking at the averages, there are some points worth noting.
1) There isn't nearly enough data for heartrate and weight comparisons. There were only 4 users
2) Average time spent in bed awake is about 42 minutes
4) More sleep appears to lead to longer activity times
3) When high calories are combined with high intensity, weight is lower. There are only 8 entries in the weight averages
*/