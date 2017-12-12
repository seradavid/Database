CREATE PROCEDURE [dbo].[Task4m]
AS

DECLARE @startyear DATE = DATEFROMPARTS(1950, 01, 01)
DECLARE @stopyear DATE = DATEFROMPARTS(1959, 12, 31)

WHILE (@startyear < DATEFROMPARTS(2020, 01, 01))
BEGIN
    SELECT TOP 10 m.Name
	FROM Males m
	WHERE dob BETWEEN @startyear AND @stopyear
	GROUP BY m.Name
	ORDER BY COUNT(m.Name) DESC

    SET @startyear = DATEADD(YEAR, 10, @startyear)
	SET @stopyear = DATEADD(YEAR, 10, @stopyear)
END