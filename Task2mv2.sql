CREATE PROCEDURE [dbo].[Task2mv2]
	@paramCounty VARCHAR(55)
AS
	SELECT TOP 10 m.Name, co.Name
	FROM Males m
	JOIN City c
	ON m.City = c.id
	JOIN County co
	ON c.County = co.id
	WHERE co.Name = @paramCounty
	GROUP BY m.Name, co.Name
	ORDER BY COUNT(m.Name) DESC
