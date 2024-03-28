--1
CREATE PROC PROC1
AS
BEGIN
SELECT
@@Servername AS Сервер,
@@Version AS ВерсияСУБД,
Db_Name() AS БазаДанных,
User AS ПользовательБД,
System_User AS Системныйпользователь
END
EXEC PROC1

--2
go
CREATE PROC PROC2
@Буква AS CHAR(1),
@Количество AS INT OUTPUT
AS
BEGIN
SELECT
@Количество = COUNT(*)
FROM
Tabl_Kontinent$
WHERE
CHARINDEX(@Буква, Nazvanie) > 0
END
DECLARE @К AS INT
DECLARE @Б AS CHAR(1)
SET @Б = 'у'
EXECUTE PROC2 @Б, @К OUTPUT
SELECT
@К AS [Количество стран]

--3
go
CREATE PROC PROC3
@Конт AS VARCHAR(50) = 'Европа'
AS
BEGIN
SELECT TOP 3
Nazvanie
,Stolica
,Pl
,KolNas
,Kontinent
FROM
Tabl_Kontinent$
WHERE
Kontinent = @Конт
ORDER BY
Pl
END
EXECUTE PROC3 DEFAULT

--самостоятельная работа
--1
go
CREATE PROCEDURE Countries
AS
BEGIN
SELECT
Nazvanie,
Stolica,
Pl,
KolNas,
Kontinent
FROM Tabl_Kontinent$
END

EXECUTE Countries
--2
go
CREATE PROCEDURE kolcifr
    @Number INT,
    @Count INT OUTPUT
AS
BEGIN
    SET @Count = LEN(@Number)
END

DECLARE @Number INT = 12345
DECLARE @CountResult INT
EXECUTE kolcifr @Number, @CountResult OUTPUT
SELECT @CountResult AS [Количество цифр]

--3
DROP PROCEDURE  IF EXISTS PROCTable
go
CREATE PROCEDURE PROCTable
AS
BEGIN
DROP TABLE IF EXISTS TestTabl
CREATE TABLE TestTabl
(
CountryName NVARCHAR(50)
)
INSERT INTO TestTabl (CountryName)
SELECT
Nazvanie AS CountryName
FROM
Tabl_Kontinent$
WHERE
LEFT(Nazvanie, 1) = 'К'
END

EXECUTE PROCTable
Select * FROM TestTabl

--2.1
--1
go
CREATE FUNCTION Fun1
(
@A1 AS FLOAT,
@B1 AS FLOAT
)
RETURNS TABLE
AS
RETURN (
SELECT
Nazvanie
,Stolica
,Pl
,KolNas
,Kontinent
FROM
Tabl_Kontinent$
WHERE
PL BETWEEN @A1 AND @B1
)
SELECT
*
FROM
dbo.Fun1(100, 1000)

--2
CREATE FUNCTION fun2
(
@Страна AS VARCHAR(50)
)
RETURNS VARCHAR(50)
AS
BEGIN
DECLARE @S AS VARCHAR(50)
SELECT
@S = Stolica
FROM
Tabl_Kontinent$
WHERE
Nazvanie = @Страна
RETURN @S
END

SELECT dbo.fun2('Австрия')

--3
go
CREATE FUNCTION fun3
(
@Население AS INT,
@Площадь AS FLOAT
)
RETURNS FLOAT
AS
BEGIN
DECLARE @P AS FLOAT
SET @P = ROUND(CAST(@Население AS FLOAT) / @Площадь, 2)
RETURN @P
END
SELECT
Nazvanie
,Stolica
,Pl
,KolNas
,Kontinent,
dbo.fun3(kolnas, Pl) AS Плотность
FROM
Tabl_Kontinent$

--самостоятельная работа
--1
go
CREATE FUNCTION Funs1
(
@A1 AS INT
)
RETURNS TABLE
AS
RETURN (
SELECT
Nazvanie,
Stolica,
Pl,
KolNas,
Kontinent
FROM
Tabl_Kontinent$
WHERE
Pl < @A1
);
SELECT *FROM dbo.Funs1(1000);

--2
go
CREATE FUNCTION Funs2
(
@Страна AS VARCHAR(50)
)
RETURNS TABLE
AS
RETURN (
SELECT
Nazvanie AS Страна,
dbo.fun3(KolNas, Pl) AS Плотность
FROM
Tabl_Kontinent$
WHERE
Nazvanie = @Страна
);

SELECT
Страна,
Плотность
FROM
dbo.Funs2('Австрия');

--3.1
--1
use TestDatabas
go
CREATE TRIGGER trig1 ON Student
FOR INSERT
AS
BEGIN
PRINT 'Запись добавлена'
END

--2
INSERT INTO Student
VALUES ('Олег','2005-03-03','физика', 2023);

--3
go
CREATE TRIGGER trig2 ON Student
INSTEAD OF DELETE
AS
BEGIN
PRINT 'Нельзя удалить данные'
END

--4
DELETE FROM Student WHERE FiO = 'Олег';

--5
CREATE TABLE Студент_Архив1
(	
FIO NVARCHAR(40) NULL,
Data Date NULL,
spez nVARCHAR(20) NULL,
godpost int NULL,
Удалено DATETIME NOT NULL
)
go
CREATE TRIGGER trig33 ON Student
FOR DELETE
AS
BEGIN
INSERT Студент_Архив1
SELECT
FIO,
Data,
spez,
godpost,
GETDATE() AS Удалено
FROM
DELETED
END
--проверка
DELETE FROM Student WHERE FiO = 'Олег';
Select * From Студент_Архив1