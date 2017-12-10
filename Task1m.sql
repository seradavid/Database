CREATE VIEW [dbo].[Task1m]
	AS SELECT TOP 10 name, COUNT(name) AS Frequency
	FROM Males
	GROUP BY name
	ORDER BY Frequency DESC
	