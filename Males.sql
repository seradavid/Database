CREATE VIEW [dbo].[Males]
	AS SELECT "name", city, CASE WHEN Firstname LIKE '%' + "name" + '%' THEN dob ELSE dobparent END AS dob
	FROM (
		SELECT city, Firstname, dob, dobparent, Pos4, Pos5, Pos6, CASE WHEN sex = 'M' THEN Pos1 END AS Pos1, CASE WHEN sex = 'M' THEN Pos2 END AS Pos2, CASE WHEN sex = 'M' THEN Pos3 END AS Pos3
		FROM names
	) n
	UNPIVOT(
		"name"
		FOR col IN (Pos1, Pos2, Pos3, Pos4, Pos5, Pos6)
	) un
