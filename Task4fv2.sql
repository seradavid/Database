CREATE PROCEDURE [dbo].[Task4fv2]
	@paramYear int
AS

DECLARE @startyear DATE = DATEFROMPARTS(@paramYear, 01, 01)
DECLARE @stopyear DATE = DATEFROMPARTS(@paramYear + 9, 12, 31)

BEGIN
    SELECT TOP 10 f.Name
	FROM Females f
	WHERE dob BETWEEN @startyear AND @stopyear
	GROUP BY f.Name
	ORDER BY COUNT(f.Name) DESC
END
