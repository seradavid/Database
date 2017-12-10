CREATE VIEW [dbo].[Task3m]
	AS SELECT m.name
	FROM Males m
	JOIN City c
	ON m.city = c.id
	JOIN County co
	ON c.County = co.id
	GROUP BY m.name
	HAVING COUNT(DISTINCT co.id) = (SELECT COUNT(county.id) FROM County county)
	
