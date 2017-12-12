CREATE PROCEDURE [dbo].[Task5m]
AS

DECLARE @startyear DATE = DATEFROMPARTS(1950, 01, 01)
DECLARE @stopyear DATE = DATEFROMPARTS(1959, 12, 31)

WHILE (@startyear < DATEFROMPARTS(2020, 01, 01))
BEGIN
    SELECT TOP 10 m11.Name, m11.Nr1 - m22.Nr2 AS "Difference"
	FROM 
	(SELECT m1.Name, COUNT(m1.Name) AS "Nr1"
	FROM Males m1
	WHERE m1.dob BETWEEN @startyear AND @stopyear
	GROUP BY m1.Name) m11
	JOIN
	(SELECT m2.Name, COUNT(m2.Name) AS "Nr2"
	FROM Males m2
	WHERE m2.dob BETWEEN DATEADD(YEAR, 10, @startyear) AND DATEADD(YEAR, 10, @stopyear)
	GROUP BY m2.Name) m22
	ON m11.Name = m22.Name
	GROUP BY m11.Name, m11.Nr1, m22.Nr2
	ORDER BY ABS(m11.Nr1 - m22.Nr2) DESC

    SET @startyear = DATEADD(YEAR, 10, @startyear)
	SET @stopyear = DATEADD(YEAR, 10, @stopyear)
END