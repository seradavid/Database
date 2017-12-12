CREATE PROCEDURE [dbo].[Task2fv2]
	@paramCounty VARCHAR(55)
AS
	SELECT TOP 10 f.Name, co.Name
	FROM Females f
	JOIN City c
	ON f.City = c.id
	JOIN County co
	ON c.County = co.id
	WHERE co.Name = @paramCounty
	GROUP BY f.Name, co.Name
	ORDER BY COUNT(f.Name) DESC
