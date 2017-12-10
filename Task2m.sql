CREATE PROCEDURE [dbo].[Task2m]
AS
DECLARE c CURSOR READ_ONLY FAST_FORWARD FOR
    SELECT id
    FROM County

DECLARE @id Int

OPEN c

FETCH NEXT FROM c INTO @id
WHILE (@@FETCH_STATUS = 0)
BEGIN
    SELECT TOP 10 m.name, co.Name
	FROM Males m
	JOIN City c
	ON m.city = c.id
	JOIN County co
	ON c.County = co.id
	WHERE co.id = @id
	GROUP BY m.name, co.Name
	ORDER BY COUNT(m.name) DESC

    FETCH NEXT FROM c INTO @id
END

CLOSE c
DEALLOCATE c