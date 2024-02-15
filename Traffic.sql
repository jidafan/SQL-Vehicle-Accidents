-- Check for Nulls
SELECT *
FROM [Portfolio Project]..accidents_2012_to_2014

SELECT * 
FROM [Portfolio Project]..accidents_2012_to_2014
WHERE 1 is NULL or 2 is NULL or 3 is NULL or 4 is NULL or 5 is NULL or 6 is NULL or 7 is NULL or 8 is NULL or 9 is NULL or 10 is NULL or 11 is NULL or 12 is NULL or 13 is NULL or 14 is NULL or 15 is NULL or 16 is NULL or 17 is NULL or 18 is NULL
or 19 is NULL or 20 is NULL or 21 is NULL or 22 is NULL or 23 is NULL or 24 is NULL or 25 is NULL or 26 is NULL or 27 is NULL or 28 is NULL or 29 is NULL or 30 is NULL or 31 is NULL or 32 is NULL or 33 is NULL

-- Question 1 How many accidents have occurred in urban areas vs rural areas

Select Urban_or_Rural_Area AS Area
, CASE WHEN Urban_or_Rural_Area = '1' THEN 'Urban'
	   WHEN Urban_or_Rural_Area = '2' THEN 'Rural'
	   ELSE Urban_or_Rural_Area
	   END

FROM [Portfolio Project]..accidents_2012_to_2014

Update accidents_2012_to_2014
SET Urban_or_Rural_Area = 
CASE WHEN Urban_or_Rural_Area = '1' THEN 'Urban'
	   WHEN Urban_or_Rural_Area = '2' THEN 'Rural'
	   ELSE Urban_or_Rural_Area
	   END
FROM [Portfolio Project]..accidents_2012_to_2014

Select Urban_or_Rural_Area AS Area
, COUNT(Accident_Index) as 'Total Accidents'

FROM [Portfolio Project]..accidents_2012_to_2014

GROUP BY Urban_or_Rural_Area

-- Question 2 Which day of the week has the highest number of accidents

Select Day_of_Week as Day
, CASE WHEN Day_of_Week = '1' THEN 'Sunday'
	   WHEN Day_of_Week = '2' THEN 'Monday'
	   WHEN Day_of_Week = '3' THEN 'Tuesday'
	   WHEN Day_of_Week = '4' THEN 'Wednesday'
	   WHEN Day_of_Week = '5' THEN 'Thursday'
	   WHEN Day_of_Week = '6' THEN 'Friday'
	   WHEN Day_of_Week = '7' THEN 'Saturday'
	   ELSE Day_of_Week
	   END
FROM [Portfolio Project]..accidents_2012_to_2014

Update accidents_2012_to_2014
SET Day_of_Week = 
CASE WHEN Day_of_Week = '1' THEN 'Sunday'
	   WHEN Day_of_Week = '2' THEN 'Monday'
	   WHEN Day_of_Week = '3' THEN 'Tuesday'
	   WHEN Day_of_Week = '4' THEN 'Wednesday'
	   WHEN Day_of_Week = '5' THEN 'Thursday'
	   WHEN Day_of_Week = '6' THEN 'Friday'
	   WHEN Day_of_Week = '7' THEN 'Saturday'
	   ELSE Day_of_Week
	   END

FROM [Portfolio Project]..accidents_2012_to_2014

Select Day_of_Week as Day, COUNT(Accident_Index) as 'Total Accidents'

FROM [Portfolio Project]..accidents_2012_to_2014

GROUP BY Day_of_Week 

ORDER BY 'Total Accidents' DESC

-- Question 3 Average Speed Limit and Road Type 
-- Changing Type of Column

Update accidents_2012_to_2014
SET Speed_limit = CONVERT(Int, Speed_limit)

ALTER TABLE accidents_2012_to_2014
ALTER COLUMN Speed_limit Int;

SELECT Road_Type, COUNT(Accident_Index) as 'Total Accidents', AVG(Speed_limit) as 'Limit'

FROM [Portfolio Project]..accidents_2012_to_2014

GROUP BY Road_Type

ORDER BY 'Total Accidents' DESC

-- Question 4 Can we identify any trends with speed limits
SELECT 
	SpeedLimits,
	COUNT(Accident_Index) as 'Total Accidents',
	AVG(Speed_limit) as 'Average Speed Limit'
FROM(
	SELECT
		Accident_Index,
		Speed_limit,
		CASE
			WHEN Speed_limit BETWEEN 0 AND 30 THEN 'Slow'
			WHEN Speed_limit BETWEEN 31 AND 60 THEN 'Regular'
			ELSE 'Fast'
		END AS 'SpeedLimits'
	FROM [Portfolio Project]..accidents_2012_to_2014
) AS SUBQUERY
GROUP BY SpeedLimits

-- Question 5 Are there any specific weather conditions that contribute to severe accidents

DECLARE @Accident_Severity varchar(100)
SET @Accident_Severity='3'
SELECT Weather_Conditions, Count(Accident_Severity) AS 'Total Accident'

FROM [Portfolio Project]..accidents_2012_to_2014

WHERE Accident_Severity=@Accident_Severity

GROUP BY Weather_Conditions

ORDER BY 'Total Accident' DESC

-- Question 6 Do light conditions heavily impact the frequency of crashes
SELECT Light_Conditions, Count(Accident_Index) as 'Total Accidents'

FROM [Portfolio Project]..accidents_2012_to_2014

GROUP BY Light_Conditions

ORDER BY 'Total Accidents' DESC

-- Question 7 Which year had the most traffic accidents
SELECT Year, Count(Accident_Index) as 'Total Accidents'

FROM [Portfolio Project]..accidents_2012_to_2014

GROUP BY Year

ORDER BY 'Total Accidents' DESC

-- Question 8 Which year had the most casualities from traffic accidents
Update accidents_2012_to_2014
SET Number_of_Casualties = CONVERT(Int, Number_of_Casualties)

ALTER TABLE accidents_2012_to_2014
ALTER COLUMN Number_of_Casualties Int;

Select Year, SUM(Number_of_Casualties) as 'Total Casualties'

FROM [Portfolio Project]..accidents_2012_to_2014

Group By Year

ORDER BY 'Total Casualties' DESC

-- Question 9 Does road class correlate with severity of accident

Select [1st_Road_Class], Count(Accident_Severity) AS 'Severity of Accident'

FROM [Portfolio Project]..accidents_2012_to_2014

Group By [1st_Road_Class]

ORDER BY 'Severity of Accident' DESC

Select [2nd_Road_Class], Count(Accident_Severity) AS 'Severity of Accident'

FROM [Portfolio Project]..accidents_2012_to_2014

Group By [2nd_Road_Class]

ORDER BY 'Severity of Accident' DESC

-- Question 10 Did police arrive more on certain days

SELECT Day_of_Week, COUNT(Did_Police_Officer_Attend_Scene_of_Accident) AS 'Police'

FROM [Portfolio Project]..accidents_2012_to_2014

Group By Day_of_Week

ORDER BY 'Police' DESC