CREATE PROCEDURE [dbo].[Task6]
as
DECLARE c CURSOR READ_ONLY FAST_FORWARD FOR
    SELECT id
    FROM County

DECLARE @id Int

OPEN c

FETCH NEXT FROM c INTO @id
WHILE (@@FETCH_STATUS = 0)
BEGIN
    SELECT count(n.firstname), co.Name
	FROM Name n
	JOIN City c
	ON n.city = c.id
	JOIN County co
	ON c.County = co.id
	WHERE co.id = @id
	GROUP BY co.Name

    FETCH NEXT FROM c INTO @id
END

CLOSE c
DEALLOCATE c