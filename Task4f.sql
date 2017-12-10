CREATE PROCEDURE [dbo].[Task4f]
AS

DECLARE @startyear DATE = '1950-01-01'
DECLARE @stopyear DATE = '1959-12-31'

WHILE (@startyear < '2020-01-01')
BEGIN
    SELECT TOP 10 f.name
	FROM Females f
	WHERE dob BETWEEN @startyear AND @stopyear
	GROUP BY f.name
	ORDER BY COUNT(f.name) DESC

    SET @startyear = DATEADD(YEAR, 10, @startyear)
	SET @stopyear = DATEADD(YEAR, 10, @stopyear)
END