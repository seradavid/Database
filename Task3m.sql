CREATE VIEW [dbo].[Task3m]
	AS SELECT m.Name
	FROM Males m
	JOIN City c
	ON m.City = c.id
	JOIN County co
	ON c.County = co.id
	GROUP BY m.Name
	HAVING COUNT(DISTINCT co.id) = (SELECT COUNT(county.id) FROM County county)
	
