CREATE PROCEDURE [dbo].[Task2f]
AS
DECLARE c CURSOR READ_ONLY FAST_FORWARD FOR
    SELECT id
    FROM County

DECLARE @id Int

OPEN c

FETCH NEXT FROM c INTO @id
WHILE (@@FETCH_STATUS = 0)
BEGIN
    SELECT TOP 10 f.name, co.Name
	FROM Females f
	JOIN City c
	ON f.city = c.id
	JOIN County co
	ON c.County = co.id
	WHERE co.id = @id
	GROUP BY f.name, co.Name
	ORDER BY COUNT(f.name) DESC

    FETCH NEXT FROM c INTO @id
END

CLOSE c
DEALLOCATE c