/*
Pulled two spreadsheets from Kaggle. Both can be found here: https://www.kaggle.com/code/divyanshikapoor05/pandemic-analysis/data
-Covid Worldwide
-Covid Data (data from the Mexican Government)

Questions I am answering:
-Which country had the highest infection/death/recovery rate?
-What is the average age of people that got infected?
-What are the top 3 most common pre-existing condition of the tested population?
-What is the average age of death?
-Taking the data from Mexico, what would be the estimated percentages for other countries?
-What can patients do to increase their chances of survival?
*/

#Starting with covid_data. Reminder: This is data from the Mexican Government
#Find total row counts and distinct values in spreadsheet
SELECT
  count(usmr)
FROM `covidworlddata.covid_data` #1,048,575 unique rows. Per Kaggle, this dataset is on all unique patients, no repeats

#Average age of infection
SELECT
  ROUND(avg(age)) as avg_age_of_infection
FROM `covidworlddata.covid_data`
WHERE classification < 4 --avg age is 45

#Average age of death
SELECT
  ROUND(avg(age)) as avg_age_of_death
FROM `covidworlddata.covid_data`
WHERE date_died != '9999-99-99' --avg age is 61

#Top 3 most common pre-existing condition
SELECT
  sum(CASE WHEN pneumonia = 1 THEN 1 ELSE 0 END) as count_pneumonia,
  sum(CASE WHEN diabetes = 1 THEN 1 ELSE 0 END) as count_diabetes,
  sum(CASE WHEN copd = 1 THEN 1 ELSE 0 END) as count_copd,
  sum(CASE WHEN asthma = 1 THEN 1 ELSE 0 END) as count_asthma,
  sum(CASE WHEN inmsupr = 1 THEN 1 ELSE 0 END) as count_inmsupr,
  sum(CASE WHEN hypertension = 1 THEN 1 ELSE 0 END) as count_hypertension,
  sum(CASE WHEN other_disease = 1 THEN 1 ELSE 0 END) as count_other_disease,
  sum(CASE WHEN cardiovascular = 1 THEN 1 ELSE 0 END) as count_cardiovascular,
  sum(CASE WHEN obesity = 1 THEN 1 ELSE 0 END) as count_obesity,
  sum(CASE WHEN renal_chronic = 1 THEN 1 ELSE 0 END) as count_renal_chronic
FROM `covidworlddata.covid_data`
/*
1) hypertension with 162,729
2) obesity with 159,816
3) pneumonia with 140,038
*/

#What percentage of those who died had hypertension, were obese, or had pneumonia? Where they admitted to ICU and intubated?
SELECT
  CONCAT(ROUND(100 * sum(CASE WHEN hypertension = 1 THEN 1 ELSE 0 END) / count(hypertension), 2), ' %') as percent_hypertension,
  (SELECT
      CONCAT(ROUND(100 * sum(CASE WHEN icu = 1 THEN 1 ELSE 0 END) / count(icu), 2), ' %')
    FROM `covidworlddata.covid_data`
    WHERE date_died != '9999-99-99' AND hypertension = 1) as percent_hypertension_admitted,
  (SELECT
      CONCAT(ROUND(100 * sum(CASE WHEN intubed = 1 THEN 1 ELSE 0 END) / count(intubed), 2), ' %')
    FROM `covidworlddata.covid_data`
    WHERE date_died != '9999-99-99' AND hypertension = 1 AND icu = 1) as percent_hypertension_admitted_intubed,
FROM `covidworlddata.covid_data`
WHERE date_died != '9999-99-99'

SELECT
  CONCAT(ROUND(100 * sum(CASE WHEN obesity = 1 THEN 1 ELSE 0 END) / count(obesity), 2), ' %') as percent_obese,
  (SELECT
      CONCAT(ROUND(100 * sum(CASE WHEN icu = 1 THEN 1 ELSE 0 END) / count(icu), 2), ' %')
    FROM `covidworlddata.covid_data`
    WHERE date_died != '9999-99-99' AND obesity = 1) as percent_obese_admitted,
  (SELECT
      CONCAT(ROUND(100 * sum(CASE WHEN intubed = 1 THEN 1 ELSE 0 END) / count(intubed), 2), ' %')
    FROM `covidworlddata.covid_data`
    WHERE date_died != '9999-99-99' AND obesity = 1 AND icu = 1) as percent_obese_admitted_intubed,
FROM `covidworlddata.covid_data`
WHERE date_died != '9999-99-99'

SELECT
  CONCAT(ROUND(100 * sum(CASE WHEN pneumonia = 1 THEN 1 ELSE 0 END) / count(pneumonia), 2), ' %') as percent_pneumonia,
  (SELECT
      CONCAT(ROUND(100 * sum(CASE WHEN icu = 1 THEN 1 ELSE 0 END) / count(icu), 2), ' %')
    FROM `covidworlddata.covid_data`
    WHERE date_died != '9999-99-99' AND pneumonia = 1) as percent_pneumonia_admitted,
  (SELECT
      CONCAT(ROUND(100 * sum(CASE WHEN intubed = 1 THEN 1 ELSE 0 END) / count(intubed), 2), ' %')
    FROM `covidworlddata.covid_data`
    WHERE date_died != '9999-99-99' AND pneumonia = 1 AND icu = 1) as percent_pneumonia_admitted_intubed,
FROM `covidworlddata.covid_data`
WHERE date_died != '9999-99-99'

#Conditions that affect the pulmonary system: asthma, pneumonia, copd, cardiovascular, tobacco
SELECT
  CONCAT(ROUND(100 * sum(CASE WHEN asthma = 1 THEN 1 ELSE 0 END) / count(asthma), 2), '%') as percent_asthmatic,
  CONCAT(ROUND(100 * sum(CASE WHEN pneumonia = 1 THEN 1 ELSE 0 END) / count(pneumonia), 2), '%') as percent_w_pneumonia,
  CONCAT(ROUND(100 * sum(CASE WHEN copd = 1 THEN 1 ELSE 0 END) / count(copd), 2), '%') as percent_w_copd,
  CONCAT(ROUND(100 * sum(CASE WHEN cardiovascular = 1 THEN 1 ELSE 0 END) / count(cardiovascular), 2), '%') as percent_w_cardiovascular,
  CONCAT(ROUND(100 * sum(CASE WHEN tobacco = 1 THEN 1 ELSE 0 END) / count(tobacco), 2), '%') as percent_tobacco_users
FROM `covidworlddata.covid_data`
WHERE date_died != '9999-99-99' --of the patients who died, 70% had pneumonia

#Immunosuppressed vs classification
SELECT
  CASE
    WHEN classification = 1 THEN '1'
    WHEN classification = 2 THEN '2'
    WHEN classification = 3 THEN '3'
    ELSE '4+'
    END classification,
  sum(CASE WHEN inmsupr = 1 THEN 1 ELSE 0 END) as immunosuppressed,
  sum(CASE WHEN inmsupr = 2 THEN 1 ELSE 0 END) as not_immunosppresed,
  sum(CASE WHEN inmsupr > 2 THEN 1 ELSE 0 END) as not_provided
FROM `covidworlddata.covid_data`
GROUP BY classification
ORDER BY classification ASC
/*
The highest counts were in either grade 3 or 4+. This means that regardless of whether a person is immunosupressed or not, COVID hit at a higher degree.
*/

#Predictive analysis will be applied to the covid_worldwide dataset, but let's review this first
#Find total row counts and distinct values in the spreadsheet
SELECT
  count(serial_number)
FROM `covidworlddata.covid_worldwide` #231 rows
SELECT
  count(distinct serial_number)
FROM `covidworlddata.covid_worldwide` #231 unique rows, which means no repeat countries

#Exploring the world data. It appears that total cases = total deaths + total recovered + active cases.
SELECT
  serial_number,
  total_cases,
  total_deaths + total_recovered + active_cases as sum
FROM `covidworlddata.covid_worldwide`
ORDER BY serial_number ASC --sum of these columns is equal to total_cases

SELECT
  country,
  total_cases,
  total_deaths,
  total_recovered,
  active_cases
FROM `covidworlddata.covid_worldwide`
WHERE total_deaths + total_recovered + active_cases is null --there were no countries where sum did not equal total cases
ORDER BY serial_number ASC

#Top 5 highest death rates
SELECT
  serial_number,
  country,
  CONCAT(ROUND(total_deaths / total_cases * 100, 2), ' %') as death_rate
FROM `covidworlddata.covid_worldwide`
ORDER BY (total_deaths / population) DESC
LIMIT 5

#Top 5 highest recovery rates
SELECT
  serial_number,
  country,
  CONCAT(ROUND(total_recovered / total_cases * 100, 3), ' %') as recovery_rate
FROM `covidworlddata.covid_worldwide`
ORDER BY total_recovered / total_cases DESC
LIMIT 5 --rounding decimals to 3 points out as DPRK came out to 100%, though query below shows 74 deaths

SELECT *
FROM `covidworlddata.covid_worldwide`
WHERE country IN ('Vatican City', 'Falkland Islands', 'DPRK')

#Top 5 highest infection rate
SELECT
  serial_number,
  country,
  CONCAT(ROUND(total_cases / population * 100, 2), ' %') as infection_rate
FROM `covidworlddata.covid_worldwide`
ORDER BY total_cases / population DESC
LIMIT 5

#Compare testing rate to death rate and recovery rate
#Higher testing rate
SELECT
  serial_number,
  country,
  CONCAT(ROUND(total_test / population * 100, 2), ' %') as testing_rate, --compared to population as testing did not mean infection
  CONCAT(ROUND(total_deaths / total_cases * 100, 2), ' %') as death_rate,
  CONCAT(ROUND(total_recovered / total_cases * 100, 3), ' %') as recovery_rate
FROM `covidworlddata.covid_worldwide`
ORDER BY total_test / population DESC
LIMIT 5 --higher testing rates show higher recovery rates and lower death rates

SELECT
  CONCAT(ROUND(avg(death_rate) * 100, 2), ' %') as avg_death_rate
FROM
  (SELECT
    serial_number,
    country,
    total_test / population as testing_rate,
    total_deaths / total_cases as death_rate,
    total_recovered / total_cases as recovery_rate
  FROM `covidworlddata.covid_worldwide`
  ORDER BY total_test / population DESC
  LIMIT 5) as top_five_testing --Average death rate is 0.45%

#Lower testing rate
SELECT
  serial_number,
  country,
  CONCAT(ROUND(total_test / population * 100, 2), ' %') as testing_rate,
  CONCAT(ROUND(total_deaths / total_cases * 100, 2), ' %') as death_rate,
  CONCAT(ROUND(total_recovered / total_cases * 100, 3), ' %') as recovery_rate
FROM `covidworlddata.covid_worldwide`
WHERE total_test / population IS NOT NULL --some countries had null testing values
ORDER BY total_test / population ASC
LIMIT 5 --lower testing rates show a higher death rate

SELECT
  CONCAT(ROUND(avg(death_rate) * 100, 2), ' %') as avg_death_rate
FROM
  (SELECT
    serial_number,
    country,
    total_test / population as testing_rate,
    total_deaths / total_cases as death_rate,
    total_recovered / total_cases as recovery_rate
  FROM `covidworlddata.covid_worldwide`
  WHERE total_test / population IS NOT NULL
  ORDER BY total_test / population ASC
  LIMIT 5) as bottom_five_testing --Average death rate is 2.75%, six times higher than with more testing

#Predictive analysis (%) in order to apply predictive trends to the 'total_cases' country data (only for those confirmed with COVID)
#Create a view where COVID is actually confirmed
CREATE VIEW covidworlddata.covid_data_confirmed
AS (
  SELECT *
  FROM `covidworlddata.covid_data`
  WHERE classification < 4
)

#Starting point for predictive analysis
CREATE TABLE covidworlddata.worldwide_predictive
AS (
  SELECT
    country,
    population,
    total_cases,
    total_deaths,
    total_recovered,
    active_cases,
    total_test,
  FROM `covidworlddata.covid_worldwide`
)

#USMR levels
CREATE OR REPLACE TABLE covidworlddata.worldwide_predictive
AS (
  SELECT
    *,
    cast(total_cases *
    (select
      count(usmr)/(select count(usmr) from `covidworlddata.covid_data_confirmed`)
    from `covidworlddata.covid_data_confirmed` where usmr = 1) as int64) as usmr_1,
    cast(total_cases *
    (select
      count(usmr)/(select count(usmr) from `covidworlddata.covid_data_confirmed`)
    from `covidworlddata.covid_data_confirmed` where usmr = 2) as int64) as usmr_2,
  FROM `covidworlddata.worldwide_predictive`
)

#Classifications
CREATE OR REPLACE TABLE `covidworlddata.worldwide_predictive`
AS (
  SELECT
    *,
    cast(total_cases *
    (select
      count(classification)/(select count(classification) from `covidworlddata.covid_data_confirmed`)
    from `covidworlddata.covid_data_confirmed` where classification = 1) as int64) as class_1,
    cast(total_cases *
    (select
      count(classification)/(select count(classification) from `covidworlddata.covid_data_confirmed`)
    from `covidworlddata.covid_data_confirmed` where classification = 2) as int64) as class_2,
    cast(total_cases *
    (select
      count(classification)/(select count(classification) from `covidworlddata.covid_data_confirmed`)
    from `covidworlddata.covid_data_confirmed` where classification = 3) as int64) as class_3
  FROM `covidworlddata.worldwide_predictive`
)

#Gender and Sent Home vs Hospitalized
CREATE OR REPLACE TABLE `covidworlddata.worldwide_predictive`
AS (
  SELECT
    *,
    cast(total_cases *
    (select
      count(sex)/(select count(sex) from `covidworlddata.covid_data_confirmed`)
    from `covidworlddata.covid_data_confirmed` where sex = 1) as int64) as female,
  cast(total_cases *
    (select
      count(sex)/(select count(sex) from `covidworlddata.covid_data_confirmed`)
    from `covidworlddata.covid_data_confirmed` where sex = 2) as int64) as male,
  cast(total_cases *
    (select
      count(patient_type)/(select count(patient_type) from `covidworlddata.covid_data_confirmed`)
    from `covidworlddata.covid_data_confirmed` where patient_type = 1) as int64) as sent_home,
  cast(total_cases *
    (select
      count(patient_type)/(select count(patient_type) from `covidworlddata.covid_data_confirmed`)
    from `covidworlddata.covid_data_confirmed` where patient_type = 2) as int64) as hospitalized
  FROM `covidworlddata.worldwide_predictive`
)

#For the following, I will only be including the yes responses. Split into 3 sets to prevent overload on system
#First set: Intubated, Pneumonia, Pregnant, Diabetes
CREATE OR REPLACE TABLE `covidworlddata.worldwide_predictive`
AS (
  SELECT
    *,
    cast(total_cases *
      (select
        count(intubed)/(select count(intubed) from `covidworlddata.covid_data_confirmed`)
        from `covidworlddata.covid_data_confirmed` where intubed = 1) as int64) as intubated,
    cast(total_cases *
      (select
        count(pneumonia)/(select count(pneumonia) from `covidworlddata.covid_data_confirmed`)
        from `covidworlddata.covid_data_confirmed` where pneumonia = 1) as int64) as pneumonia,
    cast(total_cases *
      (select
        count(pregnant)/(select count(pregnant) from `covidworlddata.covid_data_confirmed`)
        from `covidworlddata.covid_data_confirmed` where pregnant = 1) as int64) as pregnant,
    cast(total_cases *
        (select
        count(diabetes)/(select count(diabetes) from `covidworlddata.covid_data_confirmed`)
        from `covidworlddata.covid_data_confirmed` where diabetes = 1) as int64) as diabetes
  FROM `covidworlddata.worldwide_predictive`
)

#Second set: COPD, Asthma, Immunosuppressed, Hypertension
CREATE OR REPLACE TABLE `covidworlddata.worldwide_predictive`
AS (
  SELECT
    *,
    cast(total_cases *
      (select
        count(copd)/(select count(copd) from `covidworlddata.covid_data_confirmed`)
        from `covidworlddata.covid_data_confirmed` where copd = 1) as int64) as copd,
    cast(total_cases *
      (select
        count(asthma)/(select count(asthma) from `covidworlddata.covid_data_confirmed`)
        from `covidworlddata.covid_data_confirmed` where asthma = 1) as int64) as asthma,
    cast(total_cases *
      (select
        count(inmsupr)/(select count(inmsupr) from `covidworlddata.covid_data_confirmed`)
        from `covidworlddata.covid_data_confirmed` where inmsupr = 1) as int64) as immunosuppressed,
    cast(total_cases *
        (select
        count(hypertension)/(select count(hypertension) from `covidworlddata.covid_data_confirmed`)
        from `covidworlddata.covid_data_confirmed` where hypertension = 1) as int64) as hypertension
  FROM `covidworlddata.worldwide_predictive`
)

#Third set: Other Disease, Cardiovascular, Renal Chronic, Obesity, Tobacco, ICU admission
CREATE OR REPLACE TABLE `covidworlddata.worldwide_predictive`
AS (
  SELECT
    *,
    cast(total_cases *
      (select
        count(other_disease)/(select count(other_disease) from `covidworlddata.covid_data_confirmed`)
        from `covidworlddata.covid_data_confirmed` where other_disease = 1) as int64) as other_disease,
    cast(total_cases *
      (select
        count(cardiovascular)/(select count(cardiovascular) from `covidworlddata.covid_data_confirmed`)
        from `covidworlddata.covid_data_confirmed` where cardiovascular = 1) as int64) as cardiovascular,
    cast(total_cases *
      (select
        count(renal_chronic)/(select count(renal_chronic) from `covidworlddata.covid_data_confirmed`)
        from `covidworlddata.covid_data_confirmed` where renal_chronic = 1) as int64) as renal_chronic,
    cast(total_cases *
        (select
        count(obesity)/(select count(obesity) from `covidworlddata.covid_data_confirmed`)
        from `covidworlddata.covid_data_confirmed` where obesity = 1) as int64) as obese,
    cast(total_cases *
        (select
        count(tobacco)/(select count(tobacco) from `covidworlddata.covid_data_confirmed`)
        from `covidworlddata.covid_data_confirmed` where tobacco = 1) as int64) as tobacco,
    cast(total_cases *
        (select
        count(icu)/(select count(icu) from `covidworlddata.covid_data_confirmed`)
        from `covidworlddata.covid_data_confirmed` where icu = 1) as int64) as icu
  FROM `covidworlddata.worldwide_predictive`
)

#New dataset will be downloaded and visualization will be moved to Tableau: https://public.tableau.com/app/profile/juan.vega6160/viz/COVIDWorldwideData/Dashboard1