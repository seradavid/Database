CREATE VIEW [dbo].[Task6]
AS
	SELECT count(n.FirstName) AS "Name", co.Name as "County"
	FROM Name n
	JOIN City c
	ON n.City = c.id
	JOIN County co
	ON c.County = co.id
	GROUP BY co.Name