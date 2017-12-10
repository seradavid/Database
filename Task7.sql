CREATE VIEW [dbo].[Task7]
	AS SELECT COUNT(firstname) AS nrstud, c.niv
	FROM name n
	JOIN City c
	ON n.city = c.id
	GROUP BY c.niv
    