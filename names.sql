CREATE VIEW [dbo].[names]
	AS SELECT FirstName, Father, Mother, Sex, City, DOB, dateadd(year, -25, dob) as "dobparent", Pos1, Pos2, Pos3, Pos4, Pos5, Pos6, Pos7, Pos8, Pos9
	FROM Name n
	CROSS APPLY(
		SELECT	Pos1 = xDim.value('/x[1]', 'varchar(max)'),
				Pos2 = xDim.value('/x[2]', 'varchar(max)'),
				Pos3 = xDim.value('/x[3]', 'varchar(max)'),
				Pos4 = xDim.value('/y[1]', 'varchar(max)'),
				Pos5 = xDim.value('/y[2]', 'varchar(max)'),
				Pos6 = xDim.value('/y[3]', 'varchar(max)'),
				Pos7 = xDim.value('/z[1]', 'varchar(max)'),
				Pos8 = xDim.value('/z[2]', 'varchar(max)'),
				Pos9 = xDim.value('/z[3]', 'varchar(max)')
		FROM (SELECT CAST('<x>' + 
						  REPLACE((SELECT REPLACE(REPLACE(REPLACE(FirstName, '-', ' '), '   ', ' '), '  ', ' ') AS [*] FOR XML PATH('')), ' ', '</x><x>') + 
						  '</x><y>' + 
						  REPLACE((SELECT REPLACE(REPLACE(REPLACE(Father, '-', ' '), '   ', ' '), '  ', ' ') AS [*] FOR XML PATH('')), ' ', '</y><y>') + 
						  '</y><z>' + 
						  REPLACE((SELECT REPLACE(REPLACE(REPLACE(Mother, '-', ' '), '   ', ' '), '  ', ' ') AS [*] FOR XML PATH('')), ' ', '</z><z>') + 
						  '</z>' AS XML) AS xDim) as A) B
