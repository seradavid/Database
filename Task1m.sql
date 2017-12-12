CREATE VIEW [dbo].[Task1m]
	AS SELECT TOP 10 Name, COUNT(Name) AS Frequency
	FROM Males
	GROUP BY Name
	ORDER BY Frequency DESC
	