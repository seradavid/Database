CREATE PROCEDURE [dbo].[Task5f]
AS

DECLARE @startyear DATE = DATEFROMPARTS(1950, 01, 01)
DECLARE @stopyear DATE = DATEFROMPARTS(1959, 12, 31)

WHILE (@startyear < DATEFROMPARTS(2020, 01, 01))
BEGIN
    SELECT TOP 10 f11.Name, f11.Nr1 - f22.Nr2 AS "Difference"
	FROM 
	(SELECT f1.Name, COUNT(f1.Name) AS "Nr1"
	FROM Females f1
	WHERE f1.dob BETWEEN @startyear AND @stopyear
	GROUP BY f1.Name) f11
	JOIN
	(SELECT f2.Name, COUNT(f2.Name) AS "Nr2"
	FROM Females f2
	WHERE f2.dob BETWEEN DATEADD(YEAR, 10, @startyear) AND DATEADD(YEAR, 10, @stopyear)
	GROUP BY f2.Name) f22
	ON f11.Name = f22.Name
	GROUP BY f11.Name, f11.Nr1, f22.Nr2
	ORDER BY ABS(f11.Nr1 - f22.Nr2) DESC

    SET @startyear = DATEADD(YEAR, 10, @startyear)
	SET @stopyear = DATEADD(YEAR, 10, @stopyear)
END