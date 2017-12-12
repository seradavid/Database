﻿CREATE PROCEDURE [dbo].[Task4f]
AS

DECLARE @startyear DATE = DATEFROMPARTS(1950, 01, 01)
DECLARE @stopyear DATE = DATEFROMPARTS(1959, 12, 31)

WHILE (@startyear < DATEFROMPARTS(2020, 01, 01))
BEGIN
    SELECT TOP 10 f.Name
	FROM Females f
	WHERE dob BETWEEN @startyear AND @stopyear
	GROUP BY f.Name
	ORDER BY COUNT(f.Name) DESC

    SET @startyear = DATEADD(YEAR, 10, @startyear)
	SET @stopyear = DATEADD(YEAR, 10, @stopyear)
END