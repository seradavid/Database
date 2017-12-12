CREATE VIEW [dbo].[Males]
	AS SELECT id, "Name", City, CASE WHEN FirstName LIKE '%' + "Name" + '%' THEN DOB ELSE dobparent END AS dob
	FROM (
		SELECT id, City, FirstName, DOB, dobparent, Pos4, Pos5, Pos6, CASE WHEN Sex = 'M' THEN Pos1 END AS Pos1, CASE WHEN Sex = 'M' THEN Pos2 END AS Pos2, CASE WHEN Sex = 'M' THEN Pos3 END AS Pos3
		FROM names
	) n
	UNPIVOT(
		"Name"
		FOR col IN (Pos1, Pos2, Pos3, Pos4, Pos5, Pos6)
	) un
