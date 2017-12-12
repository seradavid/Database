CREATE VIEW [dbo].[Females]
	AS SELECT "Name", City, CASE WHEN FirstName LIKE '%' + "Name" + '%' THEN DOB ELSE dobparent END AS dob
	FROM (
		SELECT City, FirstName, DOB, dobparent, Pos7, Pos8, Pos9, CASE WHEN Sex = 'F' THEN Pos1 END AS Pos1, CASE WHEN Sex = 'F' THEN Pos2 END AS Pos2, CASE WHEN Sex = 'F' THEN Pos3 END AS Pos3
		FROM names
	) n
	UNPIVOT(
		"Name"
		FOR col IN (Pos1, Pos2, Pos3, Pos7, Pos8, Pos9)
	) un