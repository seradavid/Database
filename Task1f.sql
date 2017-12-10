CREATE VIEW [dbo].[Task1f]
	AS SELECT TOP 10 name, COUNT(name) AS Frequency
	FROM Females
	GROUP BY name
	ORDER BY Frequency DESC
	