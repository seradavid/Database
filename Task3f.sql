CREATE VIEW [dbo].[Task3f]
	AS SELECT f.name
	FROM Females f
	JOIN City c
	ON f.city = c.id
	JOIN County co
	ON c.County = co.id
	GROUP BY f.name
	HAVING COUNT(DISTINCT co.id) = (SELECT COUNT(county.id) FROM County county)