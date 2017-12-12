CREATE VIEW [dbo].[Task3f]
	AS SELECT f.Name
	FROM Females f
	JOIN City c
	ON f.City = c.id
	JOIN County co
	ON c.County = co.id
	GROUP BY f.Name
	HAVING COUNT(DISTINCT co.id) = (SELECT COUNT(county.id) FROM County county)