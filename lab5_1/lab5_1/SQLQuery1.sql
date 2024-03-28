--5.1

--1
SELECT predmet,  ush, COUNT(fio) as kol
FROM Table_uch1
GROUP BY predmet, ush;

--2
SELECT ush, predmet, COUNT(*) as kol
FROM Table_uch1
GROUP BY ush, predmet WITH ROLLUP;

--3
SELECT ush, predmet, COUNT(*) as kol
FROM Table_uch1
GROUP BY ush, predmet;

--4
SELECT predmet,  ush, COUNT(fio) as kol
FROM Table_uch1
GROUP BY predmet, ush WITH CUBE;


--5
SELECT predmet,  ush, COUNT(fio) as kol
FROM Table_uch1
GROUP BY GROUPING SETS (predmet, ush);

--6
SELECT 
    COALESCE(predmet, '�����') AS predmet,
    COALESCE(ush, '�����') AS ush,
    COUNT(*) AS kol
FROM Table_uch1
GROUP BY ROLLUP(predmet, ush);

--7
SELECT 
    IIF (GROUPING(predmet) = 1 ,'�����', predmet) as predmet,
	IIF (GROUPING(ush) = 1 ,'�����', ush) as ush,
    COUNT(*) as kol
FROM Table_uch1
GROUP BY  CUBE(predmet, ush);


--8
SELECT CASE GROUPING_ID (predmet, ush)
	WHEN 1 THEN '����� �� ���������'
	WHEN 3 THEN '�����'
	ELSE ''
	END AS �����,
	ISNULL(predmet, '') AS predmet,
    ISNULL(ush, '') AS ush,
    COUNT(*) AS kol
FROM Table_uch1
GROUP BY ROLLUP(predmet, ush);


--9
SELECT 
    predmet,
    ush,
    MAX(ball) AS MaxBall
FROM Table_uch1
GROUP BY ROLLUP(predmet, ush);


--10
SELECT 
    predmet,
    ush,
    MIN(ball) AS MinBall
FROM Table_uch1
GROUP BY CUBE(predmet, ush);

--11
SELECT 
    predmet,
    ush,
    AVG(ball) AS AvgBall
FROM Table_uch1
GROUP BY GROUPING SETS (predmet, ush);

--12
SELECT 
    COALESCE(predmet, '�����') as predmet,
    COALESCE(ush, '�����') as ush,
    COUNT(*) AS TotalStudents
FROM Table_uch1
GROUP BY CUBE(predmet, ush);


--13
SELECT CASE GROUPING_ID (ush, predmet)
	WHEN 1 THEN '����� �� ������'
	WHEN 2 THEN '����� �� ���������'
	WHEN 3 THEN '�����'
	ELSE ''
	END AS �����,
	ISNULL(ush, '') AS ush,
	ISNULL(predmet, '') AS predmet,
    SUM(ball) AS TotalBall
FROM Table_uch1
GROUP BY CUBE(ush, predmet);

--14
SELECT CASE GROUPING_ID (ush, predmet)
	WHEN 1 THEN '����� �� ������'
	WHEN 3 THEN '�����'
	ELSE ''
	END AS �����,
	ISNULL(ush, '') AS ush,
	ISNULL(predmet, '') AS predmet,
    MAX(ball) AS MaxBall
FROM Table_uch1
GROUP BY ROLLUP(ush, predmet);


--5.2
--1
SELECT '����������' AS [���������� �������� �� ���������],
		����������,
		������,
		�����
FROM (SELECT predmet, fio
		FROM Table_uch1
) AS SOURCE_TABLE
PIVOT(
	COUNT(fio)
	FOR predmet in(	����������,
		������,
		�����)
) AS PIVOT_TABLE

--2
SELECT ush,
		����������,
		������,
		�����
FROM (SELECT ush, predmet, fio
		FROM Table_uch1
) AS SOURCE_TABLE
PIVOT(
	COUNT(fio)
	FOR predmet in(	����������,
		������,
		�����)
) AS PIVOT_TABLE

--3
SELECT fio,
		[������� ��� �����]
FROM Table_uch1
UNPIVOT(
[������� ��� �����] FOR �������� IN (ush, predmet)
) AS unpvt


--4
SELECT '������� ����' AS [������� ����],
		��������, �����
FROM (SELECT ush, ball
		FROM Table_uch1
) AS SOURCE_TABLE
PIVOT(
	AVG(ball)
	FOR ush in(	��������, �����)
) AS PIVOT_TABLE


--5
SELECT predmet,
		��������, �����
FROM (SELECT ush, predmet, ball
		FROM Table_uch1
) AS SOURCE_TABLE
PIVOT(
	AVG(ball)
	FOR ush in(	��������, �����)
) AS PIVOT_TABLE


--6
SELECT predmet,
       [������� ��� �����]
FROM (
    SELECT predmet, 
           CAST(fio AS NVARCHAR(255)) AS fio, 
           CAST(ush AS NVARCHAR(255)) AS ush
    FROM Table_uch1
) AS SourceTable
UNPIVOT (
    [������� ��� �����] FOR �������� IN (fio, ush)
) AS unpvt;


--7
CREATE TABLE test_table_pivot(
fio varchar(50) NULL,
god int NULL,
summa float NULL
)


--8
SELECT fio, [2011], [2012], [2013], [2014], [2015]
FROM test_table_pivot
PIVOT(sum(summa) for god in ([2011], [2012], [2013], [2014], [2015])) as test_pivot

--5.3

CREATE TABLE Table_Otdels (
  id INT NOT NULL,
  manager VARCHAR(255),
  otdel VARCHAR(255),
  god INT,
  summa DECIMAL(10,2)
);

INSERT INTO Table_Otdels (id, manager, otdel, god, summa)
VALUES (1, '��������� 1', '�����������', 2014, 200.00),
(2, '��������� 2', '�����������', 2014, 300.00),
(3, '��������� 3', '����� �������', 2014, 150.00),
(4, '��������� 4', '����� �������', 2014, 200.00),
(5, '��������� 5', '����� ����������', 2014, 250.00),
(6, '��������� 6', '����� ����������', 2014, 300.00),
(7, '��������� 7', '����� ����������', 2014, 300.00),
(8, '��������� 1', '�����������', 2015, 230.00),
(9, '��������� 2', '�����������', 2015, 200.00),
(10, '��������� 3', '����� �������', 2015, 200.00),
(11, '��������� 4', '����� �������', 2015, 200.00),
(12, '��������� 5', '����� ����������', 2015, 300.00),
(13, '��������� 6', '����� ����������', 2015, 250.00),
(14, '��������� 7', '����� ����������', 2015, 350.00);

--1
SELECT otdel, god, SUM(summa) AS summa
FROM Table_Otdels
GROUP BY otdel, god;


--2
SELECT otdel, god, SUM(summa) AS summa
FROM Table_Otdels
GROUP BY ROLLUP(otdel, god);


--3
SELECT otdel, SUM(summa) AS summa
FROM Table_Otdels
GROUP BY ROLLUP(otdel);


--4
SELECT god, SUM(summa) AS summa
FROM Table_Otdels
GROUP BY ROLLUP(god);


--5
SELECT otdel, god, SUM(summa) AS summa
FROM Table_Otdels
GROUP BY CUBE(otdel, god);


--6
SELECT otdel, god, SUM(summa) AS summa
FROM Table_Otdels
GROUP BY GROUPING SETS(otdel, god);

--7
SELECT otdel,
	ISNULL(cast(god as varchar(30)),
		case when GROUPING (god)=1 and GROUPING(otdel)=0 then '������������� ����' else '����� ����' end) as god,
	SUM(summa) as itog,
	GROUPING (otdel) as grouping_otdel,
	GROUPING (god) as grouping_god
	FROM Table_Otdels
GROUP BY
rollup (otdel, god)