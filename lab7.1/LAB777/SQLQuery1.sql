CREATE TABLE Table_uch1 (
    ID INT PRIMARY KEY,
    fio NVARCHAR(255) NOT NULL,
    predmet NVARCHAR(50) NOT NULL,
    ush NVARCHAR(50) NOT NULL,
    ball DECIMAL(5, 2) NOT NULL
);

INSERT INTO Table_uch1 (ID, fio, predmet, ush, ball)
VALUES
(1, 'Иванова', 'Математика', 'Лицей', 98.5),
(2, 'Петров', 'Физика', 'Лицей', 99),
(3, 'Сидоров', 'Математика', 'Лицей', 88),
(4, 'Полухина', 'Физика', 'Гимназия', 78),
(5, 'Матвеева', 'Химия', 'Лицей', 92),
(6, 'Касимов', 'Химия', 'Гимназия', 68),
(7, 'Нурулин', 'Математика', 'Гимназия', 81),
(8, 'Авдеев', 'Физика', 'Лицей', 87),
(9, 'Никитина', 'Химия', 'Лицей', 94),
(10, 'Барышева', 'Химия', 'Лицей', 88);

--1
DECLARE @a INT, @b INT, @c INT
SET @a = 5
SET @b = 10
SET @c = @a + @b
PRINT @c

--2
DECLARE @licey FLOAT, @gimn FLOAT, @diff FLOAT
SET @licey = (SELECT MAX(ball) FROM Table_uch1
WHERE ush = 'Лицей')
SET @gimn = (SELECT MAX(ball) FROM Table_uch1
WHERE ush = 'Гимназия')
SET @diff = ABS(@licey - @gimn)
PRINT @diff

--3
DECLARE @maxp FLOAT, @minp FLOAT, @diff FLOAT
SELECT
@maxp = MAX(ball),
@minp = MIN(ball)
FROM Table_uch1
SET @diff = @maxp - @minp
PRINT @diff

--4
DECLARE @a1 INT, @b1 INT
SET @a1 = RAND() * 100
SET @b1 = SQUARE(@a1)
PRINT @a1
PRINT @b1

--5
DECLARE @a2 INT = RAND() * 100, @b2 INT = RAND() * 100
IF @a2 > @b2
PRINT '@a2 = ' + CAST(@a2 AS VARCHAR(3))
ELSE
PRINT '@b2 = ' + CAST(@b2 AS VARCHAR(3))

--6
DECLARE @a3 INT = RAND() * 100
IF @a3 % 3 = 0
PRINT CAST(@a3 AS VARCHAR(3)) + ' делится на 3'
ELSE
PRINT CAST(@a3 AS VARCHAR(3)) + ' не делится на 3'

--7
DECLARE @a4 INT = RAND() * 1000
WHILE @a4 % 5 = 0
SET @a4 = @a4 / 5
IF @a4 = 1
PRINT 'Да'
ELSE
PRINT 'Нет'

--8
DECLARE @a5 INT = RAND() * 1000, @b5 INT = RAND() * 1000
PRINT '@a = ' + CAST(@a5 AS VARCHAR(4))
PRINT '@b = ' + CAST(@b5 AS VARCHAR(4))
WHILE @a5 != @b5
BEGIN
IF @a5 > @b5
SET @a5 = @a5 - @b5
ELSE
SET @b5 = @b5 - @a5
END
PRINT 'НОД = ' + CAST(@a5 AS VARCHAR(4))

--9
DECLARE @a6 INT = 5, @b6 INT = 10, @s6 INT = 0
WHILE @a6 <= @b6
BEGIN
SET @s6 = @s6 + @a6
SET @a6 = @a6 + 1
END
PRINT 'Сумма = ' + CAST(@s6 AS VARCHAR(5))

--10
DECLARE @N INT = RAND() * 10, @M INT = 1, @S INT = 0
WHILE @M <= 2 * @N - 1
BEGIN
SET @S = @S + @M
PRINT @S
SET @M = @M + 2
END

--11
DECLARE @A7 INT = RAND() * 5, @C7 INT = 1
DECLARE @B7 INT = @A7 + RAND() * 5
PRINT '@A7 = ' + CAST(@A7 AS CHAR(1)) + ', @B7 = ' + CAST(@B7 AS CHAR(1))
WHILE @A7 <= @B7
BEGIN
PRINT REPLICATE(@A7, @C7)
SET @A7 = @A7 + 1
SET @C7 = @C7 + 1
END

--12
DECLARE @A8 INT = 10
WHILE @A8 < 100
BEGIN
IF (@A8 % 4 = 0) AND (@A8 % 6 != 0)
PRINT @A8
SET @A8 = @A8 + 1
END

--13
DECLARE @D INT = 31, @M INT = 12
SET @D = CASE
WHEN @M IN (1, 3, 5, 7, 8, 10, 12) AND @D = 31 THEN 1
WHEN @M IN (4, 6, 9, 11) AND @D = 30 THEN 1
WHEN @M = 2 AND @D = 29 THEN 1
ELSE @D + 1
END
SET @M = CASE
WHEN @D = 1 AND @M = 12 THEN 1
WHEN @D = 1 AND @M < 12 THEN @M + 1
ELSE @M
END
PRINT CAST(@D AS VARCHAR(2)) + '/' + CAST(@M AS VARCHAR(2))


--14
DECLARE @L INT, @N1 CHAR(13) = 'Нижневартовск'
SET @L = LEN(@N1)
WHILE @L > 0
BEGIN
PRINT @N1
SET @L = @L - 1
END

--15
DECLARE @L2 INT, @M2 INT, @N2 CHAR(13)
SET @N2 = 'Нижневартовск'
SET @L2 = LEN(@N2)
SET @M2 = @L2
WHILE @L2 > 0
BEGIN
PRINT LEFT(@N2, @L2) + SPACE(2 * (@M2 - @L2)) + RIGHT(REVERSE(@N2), @L2)
SET @L2 = @L2 - 1
END
SET @L2 = 2
WHILE @L2 <= @M2
BEGIN
PRINT LEFT(@N2, @L2) + SPACE(2 * (@M2 - @L2)) + RIGHT(REVERSE(@N2), @L2)
SET @L2 = @L2 + 1
END

--Самостоятельная работа
--1
DECLARE @A INT = 5;
DECLARE @B INT = 7;
SELECT @A * @B AS 'Произведение'

--2
DECLARE @AvgLicey DECIMAL(5, 2)
DECLARE @AvgGimn DECIMAL(5, 2)
SELECT @AvgLicey = AVG(ball) FROM Table_uch1 WHERE ush = N'Лицей'
SELECT @AvgGimn = AVG(ball) FROM Table_uch1 WHERE ush = N'Гимназия'
PRINT 'AvgLicey = ' + CAST(@AvgLicey AS VARCHAR(5))
PRINT 'AvgGimn= ' + CAST(@AvgGimn AS VARCHAR(5))
PRINT 'Разница между баллами = ' + CAST(@AvgLicey - @AvgGimn AS VARCHAR(5))

--3
DECLARE @Count INT
SELECT @Count = COUNT(*) FROM Table_uch1
PRINT 'Четное количество строк: ' + IIF(@Count % 2 = 0, 'Да', 'Нет')

--4
DECLARE @Num INT = 1234, @Sum INT
SET @Sum = (@Num / 1000 % 10 + @Num / 100 % 10 + @Num / 10 % 10 + @Num % 10)
PRINT 'Сумма цифр: ' + CAST(@Sum AS NVARCHAR(3))

--5
DECLARE @a INT = RAND() * 10, @b INT = RAND() * 10, @c INT = RAND() * 10, @MinValue INT
SELECT @MinValue = MIN(val) FROM (VALUES (@a), (@b), (@c)) AS Numbers(val)
PRINT 'Наименьшее число: ' + CAST(@MinValue AS NVARCHAR(2))

--6
DECLARE @Num INT = 33, @Res NVARCHAR(3)
SET @Res = IIF(@Num % 11 = 0, 'Да', 'Нет')
PRINT 'Делится на 11: ' + @Res;


--7
DECLARE @Num INT = RAND() * 1000
PRINT @Num
WHILE @Num % 3 = 0
	SET @Num = @Num / 3
IF @Num = 1
PRINT 'Да'
ELSE
PRINT 'Нет'

--8
DECLARE @a INT = RAND() * 10, @b INT = RAND() * 10, @NOK INT
PRINT @a
PRINT @b
IF @a > @b SET @NOK = @a
ELSE SET @NOK = @b
WHILE @NOK % @a != 0 OR @NOK % @b != 0
    SET @NOK = @NOK + 1
PRINT 'НОК: ' + CAST(@NOK AS NVARCHAR(5))

--9
DECLARE @a INT = 5, @b INT = 10, @s INT = 0
WHILE @a <= @b
BEGIN
SET @s = @s + @a * @a 
SET @a = @a + 1
END
PRINT 'Сумма квадратов = ' + CAST(@s AS VARCHAR(5))


--10
DECLARE @i INT = 1, @Res INT
WHILE @i % 2 != 1 OR @i % 3 != 1 OR @i % 4 != 1 OR @i % 5 != 1 OR @i % 6 != 1 OR @i % 7 != 0
BEGIN
    SET @i = @i + 1
	SET @Res = @i
END
PRINT 'Первое число которое при делении на 2, 3, 4, 5, и 6 дает остаток 1, но делится на 7: ' + CAST(@Res AS NVARCHAR(5))

--11
DECLARE @LastName NVARCHAR(255) = 'Крючков', @i INT = 1;
WHILE @i <= LEN(@LastName)
BEGIN
    PRINT @LastName;
    SET @i = @i + 1;
END;