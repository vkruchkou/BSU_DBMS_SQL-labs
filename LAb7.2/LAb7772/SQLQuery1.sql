CREATE TABLE Student (
  fio NVARCHAR(40) NOT NULL,
  data DATE NOT NULL,
  spez NVARCHAR(20) NOT NULL,
  godpost INT NOT NULL
);
INSERT INTO Student (fio, data, spez, godpost) VALUES
('����������� ������� ����������', '2000-01-01', '������', 2018),
('�������� ������� ������������', '2001-05-02', '����������', 2019),
('������������ ������ ��������', '2004-10-21', '�����������', 2022),
('������ ���� ��������', '2004-07-17', '������', 2022),
('�������� ������� ��������', '2005-12-09', '����������', 2023),
('��������� �������� ������������', '1998-12-09', '�����������', 2016),
('��������� �������� ��������', '2001-12-09', '�����������', 2019),
('���������� ����� ����������', '2003-12-09', '�����', 2021),
('������ �������� ����������', '1999-12-09', '�����������', 2018),
('���������� �������� ����������', '1998-12-09', '�����', 2017);

--1
SELECT FIO, LEN(FIO) as ����������_��������
FROM Student

--2
SELECT TRIM(FIO) as ���, data, spez, godpost
FROM Student

--3
SELECT FIO, CHARINDEX('�', FIO) as �������_�
FROM Student

--4
SELECT FIO, LEFT(spez, 3) as ����_3
FROM Student

--6
SELECT FIO, data, REPLACE(spez,'����������','��������� ����������') AS ����, godpost
FROM Student

--7
SELECT FIO, data, UPPER(spez) AS ����, godpost
FROM Student

--8
SELECT FIO, REVERSE(FIO) as ���_���
FROM Student

--9
SELECT DISTINCT
REPLICATE(spez, 4) AS ����_4
FROM Student

--10
SELECT ABS(COS(PI())) as �������_��,
ABS(SIN(PI())) as �����_��,
ABS(TAN(PI())) as �������_��,
ABS(COT(PI())) as ���������_��

--11
SELECT
ROUND(123.456, 3) AS ���3
,ROUND(123.456, 2) AS ���2
,ROUND(123.456, 1) AS ���1
,ROUND(123.456, 0) AS ���0
,ROUND(123.456, -1) AS ���_1
,ROUND(123.456, -2) AS ���_2
,ROUND(123.456, -3) AS ���_3

--12
SELECT
CEILING(123.456) AS ������
,FLOOR(123.456) AS ������

--13
SELECT
SQRT(25) AS ������
,SQUARE(25) AS �������
,POWER(25, 3) AS ���

--14
SELECT
GETDATE() AS ������

--15
SELECT
DAY(GETDATE()) AS ����
,MONTH(GETDATE()) AS �����
,YEAR(GETDATE()) AS ���
,DATEPART(HOUR, GETDATE()) AS ���
,DATEPART(MINUTE, GETDATE()) AS ������
,DATEPART(SECOND, GETDATE()) AS �������
,DATEPART(QUARTER, GETDATE()) AS �������
,DATEPART(WEEK, GETDATE()) AS ������
,DATEPART(DAYOFYEAR, GETDATE()) AS ����_����
,DATEPART(WEEKDAY, GETDATE()) AS ����_������

--16
SELECT
DATEADD(DAY, -100, GETDATE()) AS ����_100_�����

--17
SELECT
DATEDIFF(DAY, '18950708', '19710412') AS ����������_��������_����

--18
SELECT FIO,
CASE MONTH(data)
WHEN 3 THEN '�����'
WHEN 4 THEN '�����'
WHEN 5 THEN '�����'
WHEN 6 THEN '����'
WHEN 7 THEN '����'
WHEN 8 THEN '����'
WHEN 9 THEN '�����'
WHEN 10 THEN '�����'
WHEN 11 THEN '�����'
ELSE '����'
END AS �������_����
FROM Student

--19
SELECT FIO, data, spez, godpost, IIF(godpost - Year(data) <= 18, '�������','������')
AS �������_���_����������
FROM Student

--20
SELECT
FIO, data, CASE
WHEN (MONTH(data)=3 AND DAY(data) >= 21)
OR (MONTH(data)=4 AND DAY(data) <= 20) THEN '����'
WHEN (MONTH(data)=4 AND DAY(data) >= 21)
OR (MONTH(data)=5 AND DAY(data) <= 21) THEN '�����'
WHEN (MONTH(data)=5 AND DAY(data) >= 22)
OR (MONTH(data)=6 AND DAY(data) <= 21) THEN '��������'
WHEN (MONTH(data)=6 AND DAY(data) >= 22)
OR (MONTH(data)=7 AND DAY(data) <= 22) THEN '���'
WHEN (MONTH(data)=7 AND DAY(data) >= 23)
OR (MONTH(data)=8 AND DAY(data) <= 21) THEN '���'
WHEN (MONTH(data)=8 AND DAY(data) >= 22)
OR (MONTH(data)=9 AND DAY(data) <= 23) THEN '����'
WHEN (MONTH(data)=9 AND DAY(data) >= 24)
OR (MONTH(data)=10 AND DAY(data) <= 23) THEN '����'
WHEN (MONTH(data)=10 AND DAY(data) >= 24)
OR (MONTH(data)=11 AND DAY(data) <= 22) THEN '��������'
WHEN (MONTH(data)=11 AND DAY(data) >= 23)
OR (MONTH(data)=12 AND DAY(data) <= 22) THEN '�������'
WHEN (MONTH(data)=12 AND DAY(data) >= 23)
OR (MONTH(data)=1 AND DAY(data) <= 20) THEN '�������'
WHEN (MONTH(data)=1 AND DAY(data) >= 21)
OR (MONTH(data)=2 AND DAY(data) <= 19) THEN '�������'
WHEN (MONTH(data)=2 AND DAY(data) >= 20)
OR (MONTH(data)=3 AND DAY(data) <= 20) THEN '����'
END AS ����_�������
FROM Student

--��������������� ������
--1
SELECT FIO
FROM Student
ORDER BY LEN(FIO);

--2
SELECT TRIM(FIO) AS ���, data, spez, godpost
FROM Student;

--3
SELECT FIO, CHARINDEX('��', FIO) AS �������_��
FROM Student;

--4
SELECT FIO, RIGHT(spez, 2) AS ���������_�����_�������������
FROM Student;

--5
SELECT CONCAT(LEFT(FIO, CHARINDEX(' ', FIO)), ' ', SUBSTRING(FIO, CHARINDEX(' ', FIO) + 1, 1), '. ', 
SUBSTRING(FIO, CHARINDEX(' ', FIO, CHARINDEX(' ', FIO) + 1) + 1, 1), '.') AS �������_��������
FROM Student;

--6
SELECT DISTINCT spez, REVERSE(spez) AS ��������_�������������
FROM Student;

--7
DECLARE @vozrast INT = 21;
SELECT REPLICATE('�������', @vozrast) AS �������_�����������;

--8
SELECT
  ROUND(ABS(POWER(SIN(PI()/2),2)-COS(3 *PI()/2)),2) AS ���_����

--9
SELECT DATEDIFF(DAY, GETDATE(), '20231231') as ����_��_�����_��������;

--10
SELECT DATEDIFF(MONTH, '20021019', GETDATE()) as �������_��_��������;

--12
SELECT DISTINCT 
spez as �������������, 
CASE 
WHEN LEN(spez) > 10 THEN '�������' 
ELSE '��������' 
END AS ���_�������������
FROM Student;