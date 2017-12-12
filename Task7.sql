CREATE VIEW [dbo].[Task7]
	AS SELECT COUNT(FirstName) AS nrstud, c.NIV
	FROM Name n
	JOIN City c
	ON n.City = c.id
	GROUP BY c.NIV
    