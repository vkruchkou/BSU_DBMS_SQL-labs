--1
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent,
ROUND (CAST(KolNas AS FLOAT) * 100 /(
SELECT SUM(KolNas) FROM Tabl_Kontinent$), 3) AS �������
FROM
Tabl_Kontinent$
ORDER BY ������� DESC

--2
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM
Tabl_Kontinent$
WHERE
KolNas > (SELECT AVG(KolNas) FROM Tabl_Kontinent$)

--3
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM
(SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM
Tabl_Kontinent$
WHERE
Kontinent = '������') AS a
WHERE
KolNas > 50000000

--4
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent,
ROUND(CAST(KolNas AS FLOAT) * 100 /
(SELECT SUM(KolNas) FROM Tabl_Kontinent$ � WHERE �.kontinent = �.kontinent), 3) AS �������
FROM Tabl_Kontinent$ �
ORDER BY ������� DESC

--5
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM Tabl_Kontinent$ �
WHERE KolNas > (SELECT AVG(KolNas) FROM Tabl_Kontinent$ � WHERE �.kontinent = �.kontinent)

--6
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM Tabl_Kontinent$
WHERE Kontinent IN (SELECT Kontinent FROM Tabl_Kontinent$
GROUP BY Kontinent HAVING AVG(KolNas)>  (SELECT AVG(KolNas) FROM Tabl_Kontinent$))

--7
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM Tabl_Kontinent$
WHERE Kontinent = '����' AND KolNas > ALL
(SELECT KolNas
FROM Tabl_Kontinent$
WHERE
Kontinent = '������')

--8
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM Tabl_Kontinent$
WHERE Kontinent = '������' AND KolNas > ANY
(SELECT KolNas
FROM Tabl_Kontinent$
WHERE
Kontinent = '����� �������')

--9
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM Tabl_Kontinent$
WHERE Kontinent = '������' AND EXISTS
(SELECT *
FROM Tabl_Kontinent$
WHERE
Kontinent = '������' AND KolNas > 100000000)

--10
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM Tabl_Kontinent$
WHERE Kontinent = 
(SELECT Kontinent
FROM Tabl_Kontinent$
WHERE
Nazvanie = '������')

--11
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM Tabl_Kontinent$
WHERE KolNas !> 
(SELECT KolNas
FROM Tabl_Kontinent$
WHERE
Nazvanie = '������')

--12
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM Tabl_Kontinent$
WHERE KolNas = 
(SELECT MAX(���_���)
FROM
(SELECT MIN(KolNas) as ���_���
FROM Tabl_Kontinent$
GROUP BY Kontinent)A )

--1
SELECT Nazvanie, (CAST(PL AS FLOAT)/ (SELECT SUM(PL) FROM Tabl_Kontinent$)  * 100) AS �������
FROM Tabl_Kontinent$;

--2
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM Tabl_Kontinent$
WHERE CAST(KolNas AS FLOAT)/PL > (SELECT AVG(CAST(KolNas AS FLOAT)/PL) FROM Tabl_Kontinent$)

--3
SELECT Nazvanie, KolNas
FROM Tabl_Kontinent$
WHERE Kontinent = '������' AND Nazvanie
IN (SELECT Nazvanie FROM Tabl_Kontinent$
WHERE KolNas < 5000000);

--4
SELECT Nazvanie, PL, (CAST(PL AS FLOAT) / (SELECT SUM(PL) FROM Tabl_Kontinent$ A WHERE B.Kontinent = A.Kontinent)) * 100 AS �������
FROM Tabl_Kontinent$ B;

--5
SELECT Nazvanie, PL, Kontinent
FROM Tabl_Kontinent$ A
WHERE PL > (SELECT AVG(CAST(PL AS FLOAT)) FROM Tabl_Kontinent$ B WHERE A.Kontinent = B.Kontinent);

--6
SELECT Nazvanie, KolNas / PL AS Density
FROM Tabl_Kontinent$
WHERE KolNas / PL > (SELECT AVG(CAST(KolNas AS FLOAT) / PL) FROM Tabl_Kontinent$);

--7
SELECT Nazvanie, KolNas, Kontinent
FROM Tabl_Kontinent$
WHERE Kontinent = '����� �������' 
AND KolNas > ALL (SELECT KolNas
FROM Tabl_Kontinent$ 
WHERE Kontinent = '������');

--8
SELECT Nazvanie, KolNas, Kontinent
FROM Tabl_Kontinent$
WHERE Kontinent = '������' AND 
KolNas > ANY (SELECT KolNas
FROM Tabl_Kontinent$ 
WHERE Kontinent = '����� �������');

--9
SELECT Nazvanie, KolNas, Kontinent, PL
FROM Tabl_Kontinent$
WHERE Kontinent = '������' AND EXISTS (SELECT Nazvanie, KolNas, Kontinent
FROM Tabl_Kontinent$
WHERE Kontinent = '������' AND PL >2000000);

--10
SELECT Nazvanie, Kontinent
FROM Tabl_Kontinent$
WHERE Kontinent = (SELECT Kontinent FROM Tabl_Kontinent$ WHERE Nazvanie = '�����');

--11
SELECT Nazvanie, KolNas
FROM Tabl_Kontinent$
WHERE KolNas <= (SELECT KolNas FROM Tabl_Kontinent$ WHERE Nazvanie = '�����');

--12
SELECT Nazvanie, PL, KolNas
FROM Tabl_Kontinent$
WHERE KolNas = 
(SELECT MAX(KolNas)
FROM Tabl_Kontinent$
WHERE Nazvanie IN (SELECT Nazvanie
FROM Tabl_Kontinent$
WHERE PL IN (SELECT MIN(PL) AS MinPL
      FROM Tabl_Kontinent$
      GROUP BY Kontinent)));