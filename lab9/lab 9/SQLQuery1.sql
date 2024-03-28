--1
CREATE PROC PROC1
AS
BEGIN
SELECT
@@Servername AS ������,
@@Version AS ����������,
Db_Name() AS ����������,
User AS ��������������,
System_User AS ���������������������
END
EXEC PROC1

--2
go
CREATE PROC PROC2
@����� AS CHAR(1),
@���������� AS INT OUTPUT
AS
BEGIN
SELECT
@���������� = COUNT(*)
FROM
Tabl_Kontinent$
WHERE
CHARINDEX(@�����, Nazvanie) > 0
END
DECLARE @� AS INT
DECLARE @� AS CHAR(1)
SET @� = '�'
EXECUTE PROC2 @�, @� OUTPUT
SELECT
@� AS [���������� �����]

--3
go
CREATE PROC PROC3
@���� AS VARCHAR(50) = '������'
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
Kontinent = @����
ORDER BY
Pl
END
EXECUTE PROC3 DEFAULT

--��������������� ������
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
SELECT @CountResult AS [���������� ����]

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
LEFT(Nazvanie, 1) = '�'
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
@������ AS VARCHAR(50)
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
Nazvanie = @������
RETURN @S
END

SELECT dbo.fun2('�������')

--3
go
CREATE FUNCTION fun3
(
@��������� AS INT,
@������� AS FLOAT
)
RETURNS FLOAT
AS
BEGIN
DECLARE @P AS FLOAT
SET @P = ROUND(CAST(@��������� AS FLOAT) / @�������, 2)
RETURN @P
END
SELECT
Nazvanie
,Stolica
,Pl
,KolNas
,Kontinent,
dbo.fun3(kolnas, Pl) AS ���������
FROM
Tabl_Kontinent$

--��������������� ������
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
@������ AS VARCHAR(50)
)
RETURNS TABLE
AS
RETURN (
SELECT
Nazvanie AS ������,
dbo.fun3(KolNas, Pl) AS ���������
FROM
Tabl_Kontinent$
WHERE
Nazvanie = @������
);

SELECT
������,
���������
FROM
dbo.Funs2('�������');

--3.1
--1
use TestDatabas
go
CREATE TRIGGER trig1 ON Student
FOR INSERT
AS
BEGIN
PRINT '������ ���������'
END

--2
INSERT INTO Student
VALUES ('����','2005-03-03','������', 2023);

--3
go
CREATE TRIGGER trig2 ON Student
INSTEAD OF DELETE
AS
BEGIN
PRINT '������ ������� ������'
END

--4
DELETE FROM Student WHERE FiO = '����';

--5
CREATE TABLE �������_�����1
(	
FIO NVARCHAR(40) NULL,
Data Date NULL,
spez nVARCHAR(20) NULL,
godpost int NULL,
������� DATETIME NOT NULL
)
go
CREATE TRIGGER trig33 ON Student
FOR DELETE
AS
BEGIN
INSERT �������_�����1
SELECT
FIO,
Data,
spez,
godpost,
GETDATE() AS �������
FROM
DELETED
END
--��������
DELETE FROM Student WHERE FiO = '����';
Select * From �������_�����1