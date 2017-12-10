CREATE PROCEDURE [dbo].[Task4m]
AS

DECLARE @startyear DATE = '1950-01-01'
DECLARE @stopyear DATE = '1959-12-31'

WHILE (@startyear < '2020-01-01')
BEGIN
    SELECT TOP 10 m.name
	FROM Males m
	WHERE dob BETWEEN @startyear AND @stopyear
	GROUP BY m.name
	ORDER BY COUNT(m.name) DESC

    SET @startyear = DATEADD(YEAR, 10, @startyear)
	SET @stopyear = DATEADD(YEAR, 10, @stopyear)
END