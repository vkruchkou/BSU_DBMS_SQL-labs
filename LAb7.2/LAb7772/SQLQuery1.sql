CREATE TABLE Student (
  fio NVARCHAR(40) NOT NULL,
  data DATE NOT NULL,
  spez NVARCHAR(20) NOT NULL,
  godpost INT NOT NULL
);
INSERT INTO Student (fio, data, spez, godpost) VALUES
('Александров Николай Николаевич', '2000-01-01', 'Физика', 2018),
('Бельский Василий Владимирович', '2001-05-02', 'Математика', 2019),
('Белопольский Андрей Иванович', '2004-10-21', 'Информатика', 2022),
('Петров Иван Петрович', '2004-07-17', 'Физика', 2022),
('Михайлов Николай Иванович', '2005-12-09', 'Математика', 2023),
('Мироненко Светлана Владимировна', '1998-12-09', 'Радиофизика', 2016),
('Коваленко Владимир Иванович', '2001-12-09', 'Информатика', 2019),
('Виноградов Павел Гаврилович', '2003-12-09', 'Химия', 2021),
('Иванов Владимир Николаевич', '1999-12-09', 'Радиофизика', 2018),
('Семашкевич Виктория Михайловна', '1998-12-09', 'Химия', 2017);

--1
SELECT FIO, LEN(FIO) as Количество_символов
FROM Student

--2
SELECT TRIM(FIO) as ФИО, data, spez, godpost
FROM Student

--3
SELECT FIO, CHARINDEX('о', FIO) as Позиция_о
FROM Student

--4
SELECT FIO, LEFT(spez, 3) as Спец_3
FROM Student

--6
SELECT FIO, data, REPLACE(spez,'матемитика','пикладная матемитика') AS Спец, godpost
FROM Student

--7
SELECT FIO, data, UPPER(spez) AS Спец, godpost
FROM Student

--8
SELECT FIO, REVERSE(FIO) as ФИО_Обр
FROM Student

--9
SELECT DISTINCT
REPLICATE(spez, 4) AS Спец_4
FROM Student

--10
SELECT ABS(COS(PI())) as Косинус_ПИ,
ABS(SIN(PI())) as Синус_ПИ,
ABS(TAN(PI())) as Тангенс_ПИ,
ABS(COT(PI())) as Котангенс_ПИ

--11
SELECT
ROUND(123.456, 3) AS Окр3
,ROUND(123.456, 2) AS Окр2
,ROUND(123.456, 1) AS Окр1
,ROUND(123.456, 0) AS Окр0
,ROUND(123.456, -1) AS Окр_1
,ROUND(123.456, -2) AS Окр_2
,ROUND(123.456, -3) AS Окр_3

--12
SELECT
CEILING(123.456) AS Больше
,FLOOR(123.456) AS Меньше

--13
SELECT
SQRT(25) AS Корень
,SQUARE(25) AS Квадрат
,POWER(25, 3) AS Куб

--14
SELECT
GETDATE() AS Сейчас

--15
SELECT
DAY(GETDATE()) AS День
,MONTH(GETDATE()) AS Месяц
,YEAR(GETDATE()) AS Год
,DATEPART(HOUR, GETDATE()) AS Час
,DATEPART(MINUTE, GETDATE()) AS Минута
,DATEPART(SECOND, GETDATE()) AS Секунда
,DATEPART(QUARTER, GETDATE()) AS Квартал
,DATEPART(WEEK, GETDATE()) AS Неделя
,DATEPART(DAYOFYEAR, GETDATE()) AS День_года
,DATEPART(WEEKDAY, GETDATE()) AS День_недели

--16
SELECT
DATEADD(DAY, -100, GETDATE()) AS День_100_Назад

--17
SELECT
DATEDIFF(DAY, '18950708', '19710412') AS Количество_прожитых_дней

--18
SELECT FIO,
CASE MONTH(data)
WHEN 3 THEN 'Весна'
WHEN 4 THEN 'Весна'
WHEN 5 THEN 'Весна'
WHEN 6 THEN 'Лето'
WHEN 7 THEN 'Лето'
WHEN 8 THEN 'Лето'
WHEN 9 THEN 'Осень'
WHEN 10 THEN 'Осень'
WHEN 11 THEN 'Осень'
ELSE 'Зима'
END AS Времени_года
FROM Student

--19
SELECT FIO, data, spez, godpost, IIF(godpost - Year(data) <= 18, 'Молодой','старше')
AS Возраст_при_присвоении
FROM Student

--20
SELECT
FIO, data, CASE
WHEN (MONTH(data)=3 AND DAY(data) >= 21)
OR (MONTH(data)=4 AND DAY(data) <= 20) THEN 'Овен'
WHEN (MONTH(data)=4 AND DAY(data) >= 21)
OR (MONTH(data)=5 AND DAY(data) <= 21) THEN 'Телец'
WHEN (MONTH(data)=5 AND DAY(data) >= 22)
OR (MONTH(data)=6 AND DAY(data) <= 21) THEN 'Близнецы'
WHEN (MONTH(data)=6 AND DAY(data) >= 22)
OR (MONTH(data)=7 AND DAY(data) <= 22) THEN 'Рак'
WHEN (MONTH(data)=7 AND DAY(data) >= 23)
OR (MONTH(data)=8 AND DAY(data) <= 21) THEN 'Лев'
WHEN (MONTH(data)=8 AND DAY(data) >= 22)
OR (MONTH(data)=9 AND DAY(data) <= 23) THEN 'Дева'
WHEN (MONTH(data)=9 AND DAY(data) >= 24)
OR (MONTH(data)=10 AND DAY(data) <= 23) THEN 'Весы'
WHEN (MONTH(data)=10 AND DAY(data) >= 24)
OR (MONTH(data)=11 AND DAY(data) <= 22) THEN 'Скорпион'
WHEN (MONTH(data)=11 AND DAY(data) >= 23)
OR (MONTH(data)=12 AND DAY(data) <= 22) THEN 'Стрелец'
WHEN (MONTH(data)=12 AND DAY(data) >= 23)
OR (MONTH(data)=1 AND DAY(data) <= 20) THEN 'Козерог'
WHEN (MONTH(data)=1 AND DAY(data) >= 21)
OR (MONTH(data)=2 AND DAY(data) <= 19) THEN 'Водолей'
WHEN (MONTH(data)=2 AND DAY(data) >= 20)
OR (MONTH(data)=3 AND DAY(data) <= 20) THEN 'Рыбы'
END AS Знак_зодиака
FROM Student

--Самостоятельная работа
--1
SELECT FIO
FROM Student
ORDER BY LEN(FIO);

--2
SELECT TRIM(FIO) AS ФИО, data, spez, godpost
FROM Student;

--3
SELECT FIO, CHARINDEX('ов', FIO) AS Позиция_ов
FROM Student;

--4
SELECT FIO, RIGHT(spez, 2) AS Последние_буквы_специализации
FROM Student;

--5
SELECT CONCAT(LEFT(FIO, CHARINDEX(' ', FIO)), ' ', SUBSTRING(FIO, CHARINDEX(' ', FIO) + 1, 1), '. ', 
SUBSTRING(FIO, CHARINDEX(' ', FIO, CHARINDEX(' ', FIO) + 1) + 1, 1), '.') AS Фамилия_Инициалы
FROM Student;

--6
SELECT DISTINCT spez, REVERSE(spez) AS Обратная_специализация
FROM Student;

--7
DECLARE @vozrast INT = 21;
SELECT REPLICATE('Крючков', @vozrast) AS Фамилия_Многократно;

--8
SELECT
  ROUND(ABS(POWER(SIN(PI()/2),2)-COS(3 *PI()/2)),2) AS абс_знач

--9
SELECT DATEDIFF(DAY, GETDATE(), '20231231') as Дней_До_Конца_Семестра;

--10
SELECT DATEDIFF(MONTH, '20021019', GETDATE()) as Месяцев_От_Рождения;

--12
SELECT DISTINCT 
spez as Специализация, 
CASE 
WHEN LEN(spez) > 10 THEN 'длинный' 
ELSE 'короткий' 
END AS Тип_Специализации
FROM Student;