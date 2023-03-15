/*
This dataset was pulled from Kaggle: https://www.kaggle.com/code/phalgunsanthapuri/anime-ratings/data?select=MALratings.csv

My goal for this analysis is to find out what an anime should have in order to increase it's chances of success.
*/

#Check for title duplicates
SELECT
  count(title) as row_count,
  count(distinct title) as title_count
FROM
  animeratings.ratings #row count is 20343, title count is 20342

#Find the duplicate
SELECT
  title,
  count(title) as count
FROM animeratings.ratings
GROUP BY title
ORDER BY count DESC

#Dakaretai Movie is the duplicate. Will compare the rows to make sure they are actually duplicated rows
SELECT *
FROM animeratings.ratings
WHERE title LIKE "Dakaretai%Movie%" #duplicate rows

#Creating new table to work on and clean. Got error changing some data types, so that will be done at a later point
CREATE TABLE animeratings.anime_list
AS
(
SELECT
  distinct title,
  genres,
  rank,
  popularity,
  score,
  episodes,
  episode_length,
  release_date
FROM animeratings.ratings
ORDER BY title ASC
)

#check for null values on all other columns
SELECT count(genres) as genres
FROM animeratings.anime_list #10015 non null values

SELECT count(rank) as rank
FROM animeratings.anime_list #no null values

SELECT count(popularity) as popularity
FROM animeratings.anime_list #no null values

SELECT count(score) as score
FROM animeratings.anime_list #no null values

SELECT count(episodes) as episodes
FROM animeratings.anime_list #no null values

SELECT count(episode_length) as episode_length
FROM animeratings.anime_list #no null values

SELECT count(release_date)as release_date
FROM animeratings.anime_list #5087 non null values

/*
Over half the genres are NULL. This will affect the final output. Noticed that there some 'N/A', '/A', or 'Unknown' values in some columns. This is noted for analysis.
*/

#Averages

#Average Episodes
SELECT
  avg(cast(episodes as int64)) as avg_episode_count
FROM `animeratings.anime_list`
WHERE episodes != 'Unknown' #12.56 episodes, we'll say about 13

#Average score
SELECT
  avg(cast(score as float64)) as avg_score
FROM `animeratings.anime_list`
WHERE score != 'N/A' #6.45

#Average popularity
SELECT
  avg(popularity) as avg_popularity
FROM `animeratings.anime_list` #10,174.79 subscribers, we'll say 10,175

#Distribution of release dates by season and by year
SELECT
  split(release_date, ' ') [ordinal(1)] as release_date_season,
  count(release_date) as distribution
FROM `animeratings.anime_list`
GROUP BY release_date_season
ORDER BY distribution DESC #more anime came out in the spring

SELECT
  split(release_date, ' ') [ordinal(2)] as release_date_year,
  count(release_date) as distribution
FROM `animeratings.anime_list`
GROUP BY release_date_year
ORDER BY distribution DESC #more anime came out in 2016

SELECT
  release_date,
  count(release_date) as count
FROM `animeratings.anime_list`
WHERE release_date = 'Spring 2016'
GROUP BY release_date #76 anime came out in Spring 2016

#Compare this to just a normal max count of the release_date
SELECT
  release_date,
  count(release_date) as count
FROM `animeratings.anime_list`
GROUP BY release_date
ORDER BY count DESC #Spring 2017 had the most anime releases with 85. Would be interesting to see genres and average ratings between this and Spring 2016 when we get rid of all incomplete data

SELECT
  release_date,
  count(release_date) as anime_released,
  avg(cast(rank as int64)) as avg_rank,
  avg(popularity) as avg_popularity,
  avg(cast(score as float64)) as avg_score,
  avg(cast(episodes as int64)) as avg_episodes
FROM `animeratings.anime_list`
WHERE
  (release_date = 'Spring 2016' OR release_date = 'Spring 2017') AND
  rank != '/A' AND
  score != 'N/A' AND
  episodes != 'Unknown'
GROUP BY release_date

/*
averages are relatively the same. Popularity is the only thing that has a larger difference: 5649 in 2017 and 5188 in 2016. Ultimately, Spring seems to be when most animes are released
*/

#Top 5 animes based on rank
SELECT
  title,
  genres,
  cast(rank as int64) as rank,
  popularity,
  score,
  episodes,
  episode_length,
  release_date
FROM `animeratings.anime_list`
WHERE rank != '/A'
ORDER BY rank ASC
LIMIT 5

#Episode count distribution. There were 515 'Unknown', hence why I could not convert to INT64 type
SELECT
  episodes,
  count(episodes) as episode_distribution
FROM `animeratings.anime_list`
GROUP BY episodes
ORDER BY episodes DESC #515 are unknown

#Episode average per popularity (number of subscribers)
SELECT
  avg(cast(episodes as INT64)) as avg_episodes,
  CASE
    WHEN popularity <= 500 THEN '1 - 500 subs'
    WHEN popularity >= 501 AND popularity <= 1000 THEN '501 - 1,000 subs'
    WHEN popularity >= 1001 AND popularity <= 5000 THEN '1,001 - 5,000 subs'
    WHEN popularity >= 5001 AND popularity <= 10000 THEN '5,000 - 10,000 subs'
    WHEN popularity >= 10001 AND popularity <= 20000 THEN '10,000 - 20,000 subs'
    ELSE 'More than 20,000 subs'
    END popularity
FROM `animeratings.anime_list`
WHERE episodes != "Unknown"
GROUP BY popularity
ORDER BY avg_episodes DESC

/*
RESULTS
episode count: popularity
30.03: More than 20,000 subs
22.24: 1 - 500 subs
14.51: 501 - 1,000 subs
13.65: 10,000 - 20,000 subs
12.38: 1,001 - 5,000 subs
09.43: 5,000 - 10,000 subs
*/


#Rank count distribution. There were 1880 '/A', hence why I could not convert to INT64 datatype
SELECT
  rank,
  count(rank) as rank_dist
FROM `animeratings.anime_list`
GROUP BY rank
ORDER BY rank_dist DESC

#Genre vs rank average. Top 10 genres.
SELECT
  avg(cast(rank as INT64)) as avg_rank,
  genres
FROM `animeratings.anime_list`
WHERE rank != "/A"
GROUP BY genres
ORDER BY avg_rank ASC
LIMIT 10

/*
RESULTS
Rank: Genre
36.0: Adventure,Award Winning,Supernatural
55.5: Drama,Sci-Fi,Suspense
75.5: Adventure,Fantasy,Mystery,Slice of Life,Supernatural
84.0: Comedy,Mystery,Romance
93.0: Avant Garde,Drama,Sci-Fi
99.0: Action,Drama,Mystery,Romance,Supernatural,Suspense
140.0: Action,Adventure,Comedy,Drama,Mystery
145.5: Action,Drama,Slice of Life,Sports
174.5: Adventure,Drama,Fantasy,Mystery,Sci-Fi
219.0: Drama,Fantasy,Romance,Slice of Life
*/

#Distribution of averages by season
SELECT
  split(release_date, ' ') [ordinal(1)] as release_date_season,
  count(release_date) as anime_released,
  avg(cast(rank as int64)) as avg_rank,
  avg(popularity) as avg_popularity,
  avg(cast(score as float64)) as avg_score,
  avg(cast(episodes as int64)) as avg_episodes
FROM `animeratings.anime_list`
WHERE
  rank != '/A' AND
  score != 'N/A' AND
  episodes != 'Unknown'
GROUP BY release_date_season
ORDER BY avg_rank ASC
/*
Spring had the most anime releases, followed by Fall. The highest ranking anime were released in Fall, followed by Spring. Popularity on average is higher in Spring (not including the NULLs) and second highest in Fall.
*/

#583 unknown episode lengths
SELECT count(episode_length) as count_of_UNK
FROM `animeratings.anime_list`
WHERE episode_length = 'Unknown'

#476 episodes with only seconds as length
SELECT count(episode_length) as only_seconds
FROM `animeratings.anime_list`
WHERE episode_length LIKE '%sec%' AND episode_length NOT LIKE '%hr%' AND episode_length NOT LIKE '%min%' #removing the 'hr' and 'min' conditions also give 476

#Compare score and popularity with episode length
SELECT
  CASE
    WHEN episode_length LIKE '%hr%' THEN 'Greater than 1 hour long'
    WHEN episode_length NOT LIKE '%hr%' AND episode_length != 'Unknown' THEN 'Less than 1 hour long'
    ELSE 'Unknown length'
    END AS duration,
  count(episode_length) as count,
  avg(cast(rank as int64)) as avg_rank,
  avg(popularity) as avg_popularity,
  avg(cast(score as float64)) as avg_score
FROM `animeratings.anime_list`
WHERE
  episode_length NOT LIKE '%sec%'
  AND rank != '/A'
  AND score != 'N/A'
GROUP BY duration
/*
More anime have episodes that are shorter than an hour (10,928) than longer (1,332). Anime with shorter episodes are more popular (7241 to 6196) but are ranked lower than anime with longer episodes (4432 to 6412). The popularity may be due to amount of animes with shorter episodes.

Things that were found:
--Anime with average 30 episodes have more subscribers
--Top average genres were adventure, award winning, and supernatural
--Spring tends to have the most anime releases (and highest popularity), followed by Fall.
--Anime with shorter episodes are more popular, but anime with longer episodes are ranked higher

To increase your chances of creating a successful anime, the anime should aim to have the following:
--Minimum of 30 episodes.
--Fall under adventure, award winning, or supernatural genres.
--Aim for a release in Spring.
--Longer episodes for higher ranking.
*/
