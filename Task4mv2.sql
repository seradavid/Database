CREATE PROCEDURE [dbo].[Task4mv2]
	@paramYear int
AS

DECLARE @startyear DATE = DATEFROMPARTS(@paramYear, 01, 01)
DECLARE @stopyear DATE = DATEFROMPARTS(@paramYear + 9, 12, 31)

BEGIN
    SELECT TOP 10 m.Name
	FROM Males m
	WHERE dob BETWEEN @startyear AND @stopyear
	GROUP BY m.Name
	ORDER BY COUNT(m.Name) DESC
END
