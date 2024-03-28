--1
go
CREATE VIEW PR1
AS
SELECT
nazvanie,
stolica,
Pl,
kolnas,
kontinent
FROM
Tabl_Kontinent$
WHERE
kolnas < 5000000
AND
Pl > 100000
go
SELECT
nazvanie,
stolica,
Pl,
kolnas,
kontinent
FROM
PR1

--2
go
CREATE VIEW PR2
(
kontinent,
Pl,
kolnas
)
AS
SELECT
kontinent,
SUM(PL),
SUM(KolNas)
FROM
Tabl_Kontinent$
Group by Kontinent
go
SELECT
kontinent,
Pl,
kolnas
FROM
PR2

--3
go
CREATE VIEW PR3
(
Фамилия
,Должность
,Звание
,Степень
,Кафедра
,Зарплата
)
AS
SELECT
FIO
,Dolgn
,Zvanie
,Stepen
,nkaf
,Zarplata
FROM
Sotrudnik C
INNER JOIN Prepodavatel P ON C.TabNom = P.TabNom_Pr
INNER JOIN Kafedra K ON C.ShifrKaf_Sotr = K.shifrkaf
go
SELECT
Фамилия
,Должность
,Звание
,Степень
,Кафедра
,Зарплата
FROM
PR3

--4
DECLARE @Pr4 TABLE
(
[Номер недели] INT,
[Дата начала] DATE,
[Дата конца] DATE
)
DECLARE @T AS DATE, @N INT = 1
SET @T = CAST(YEAR(GETDATE()) AS CHAR(4)) + '0101'
WHILE DATEPART(WEEKDAY, @T) > 1
SET @T = DATEADD(DAY, -1, @T)
PRINT DATEPART(WEEK, @T)
WHILE YEAR(@T) < YEAR(DATEADD(YEAR, 1, GETDATE()))
BEGIN
INSERT
@Pr4
VALUES
(@N, @T, DATEADD(DAY, 6, @T))
SET @T = DATEADD(DAY, 7, @T)
SET @N = @N + 1
END
SELECT
[Номер недели]
,[Дата начала]
,[Дата конца]
FROM
@Pr4

--5
DECLARE @Pr5 TABLE
(
    Название VARCHAR(50),
    Столица VARCHAR(50),
    Площадь FLOAT,
    Население BIGINT,
    Континент VARCHAR(50)
)
INSERT INTO @Pr5
SELECT
 nazvanie,
stolica,
Pl,
kolnas,
kontinent
FROM
Tabl_Kontinent$
WHERE
    CAST(Pl AS FLOAT) * 1000 < (SELECT AVG(CAST(Pl AS FLOAT)) FROM Tabl_Kontinent$)

SELECT
Название,
Столица,
Площадь,
Население,
Континент
FROM
@Pr5

--6
SELECT
DATENAME(MONTH, Data) AS [Название месяца]
, COUNT(DISTINCT Kod) AS [Количество экзаменов]
, COUNT(DISTINCT ReGNom) AS [Количество студентов]
INTO
#Pr6
FROM
Ozenka
GROUP BY
DATENAME(MONTH, Data)
SELECT * FROM #Pr6

--7
CREATE TABLE ##Pr7
(
Название VARCHAR(50),
Плотность FLOAT
)
INSERT INTO
##Pr7
(Название, Плотность)
SELECT
Nazvanie, ROUND(KolNas / PL, 0) AS Плотность
FROM
Tabl_Kontinent$
SELECT * FROM ##Pr7

--8
;WITH СЗК AS
(
SELECT
K.nkaf AS Кафедра
,K.shifrkaf
,AVG(Zarplata) AS [Средняя зарплата по кафедре]
FROM
Sotrudnik C
INNER JOIN Kafedra K ON C.ShifrKaf_Sotr = K.shifrkaf
GROUP BY
K.nkaf, K.shifrkaf
)
SELECT

C.FIO
,C.Zarplata
,З.Кафедра
,З.[Средняя зарплата по кафедре]
FROM
Sotrudnik C
INNER JOIN СЗК З ON C.ShifrKaf_Sotr = З.shifrkaf
WHERE
C.Zarplata < З.[Средняя зарплата по кафедре]

--Самостоятельная работа:
--1
go
CREATE VIEW AfricanCountries AS
SELECT
nazvanie,
stolica,
Pl,
kolnas,
kontinent
FROM
Tabl_Kontinent$
WHERE
kontinent = 'Африка'
AND kolnas > 10000000
AND Pl > 500000
go
SELECT
nazvanie,
stolica,
Pl,
kolnas,
kontinent
FROM AfricanCountries
--2
go
CREATE VIEW ContinentInfo AS
SELECT
kontinent,
AVG(Pl) AS AvgPL,
AVG(kolnas / Pl) AS AvgKol
FROM
Tabl_Kontinent$
GROUP BY
kontinent
go
SELECT
kontinent,
AvgPL,
AvgKol
FROM
ContinentInfo

--3
go
CREATE VIEW PrepodavatelInfo AS
SELECT
C.FIO,
C.Dolgn,
P.Zvanie,
P.Stepen,
C.ShifrKaf_Sotr AS Kafedra,
COUNT(E.Kod) AS ExamCount
FROM
Sotrudnik C
INNER JOIN Ozenka E ON C.TabNom = E.TabNom
INNER JOIN Prepodavatel P ON P.TabNom_Pr = E.TabNom
GROUP BY C.FIO,C.Dolgn,P.Zvanie,P.Stepen,C.ShifrKaf_Sotr,kod
go
SELECT
FIO,
Dolgn,
Zvanie,
Stepen,
Kafedra,
ExamCount
FROM
PrepodavatelInfo

--4
DECLARE @MonthTable TABLE
(
    [Номер месяца] INT,
    [Название месяца] VARCHAR(20),
    [Количество дней] INT
)
DECLARE @MonthNumber INT = 1
WHILE @MonthNumber <= 12
BEGIN
INSERT INTO @MonthTable
VALUES
(
@MonthNumber,
DATENAME(MONTH, DATEFROMPARTS(YEAR(GETDATE()), @MonthNumber, 1)),
DAY(EOMONTH(DATEFROMPARTS(YEAR(GETDATE()), @MonthNumber, 1)))
)
SET @MonthNumber = @MonthNumber + 1
END
SELECT
[Номер месяца],
[Название месяца],
[Количество дней]
FROM
@MonthTable

--5
DECLARE @SmallPL TABLE
(
Название VARCHAR(50),
Площадь FLOAT
)

INSERT INTO @SmallPL
SELECT
nazvanie,
Pl
FROM
Tabl_Kontinent$ A
WHERE
Pl < (SELECT AVG(Pl) FROM Tabl_Kontinent$ B WHERE A.Kontinent = B.Kontinent) / 100

SELECT
Название,
Площадь
FROM
@SmallPL


--6
SELECT
DATENAME(WEEK, Data) AS [Название недели],
COUNT(DISTINCT Kod) AS [Количество экзаменов],
COUNT(DISTINCT ReGNom) AS [Количество студентов] INTO #Sm6
FROM
Ozenka
GROUP BY
DATENAME(WEEK, Data)

SELECT * FROM #Sm6

--7
CREATE TABLE ##Sm7
(
Название VARCHAR(50),
MaxПлотность FLOAT,
MinПлотность FLOAT
)
INSERT INTO ##Sm7
(
Название,
MaxПлотность,
MinПлотность
)
SELECT
Kontinent,
Max(CAST( kolnas AS float)/ PL) AS MaxПлотность,
Min(CAST( kolnas AS float)/ PL) AS MinПлотность
FROM
Tabl_Kontinent$
Group by Kontinent
SELECT * FROM ##Sm7

--8
;WITH AvgSal AS
(
SELECT
K.shifrkaf,
AVG(C.Zarplata) AS AvgSalary
FROM
Sotrudnik C
INNER JOIN Kafedra K ON C.ShifrKaf_Sotr = K.shifrkaf
GROUP BY
K.shifrkaf
)
SELECT
C.FIO,
C.Zarplata,
K.nkaf AS Кафедра,
A.AvgSalary AS [Средняя зарплата по кафедре]
FROM
Sotrudnik C
INNER JOIN AvgSal A ON C.ShifrKaf_Sotr = A.shifrkaf
INNER JOIN Kafedra K ON C.ShifrKaf_Sotr = K.shifrkaf
WHERE
C.Zarplata < A.AvgSalary

--9
DROP VIEW IF EXISTS AfricanCountries
DROP VIEW IF EXISTS ContinentInfo
DROP VIEW IF EXISTS PrepodavatelInfo