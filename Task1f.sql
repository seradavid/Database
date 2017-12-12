CREATE VIEW [dbo].[Task1f]
	AS SELECT TOP 10 Name, COUNT(Name) AS Frequency
	FROM Females
	GROUP BY Name
	ORDER BY Frequency DESC
	