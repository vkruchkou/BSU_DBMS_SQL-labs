--1
SELECT
Nazvanie, Stolica, PL, KolNas, Kontinent
FROM
Tabl_Kontinent$
WHERE
PL > 1000000
UNION
SELECT
Nazvanie, Stolica, PL, KolNas, Kontinent
FROM
Tabl_Kontinent$
WHERE
KolNas > 100000000

--2	
SELECT
Nazvanie, Stolica, PL, KolNas, Kontinent
FROM
Tabl_Kontinent$
WHERE
PL > 1000000
UNION ALL
SELECT
Nazvanie, Stolica, PL, KolNas, Kontinent
FROM
Tabl_Kontinent$
WHERE
KolNas > 100000000

--3
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM Tabl_Kontinent$
WHERE Kontinent = 'Европа' AND CAST(KolNas AS FLOAT) / PL > 400
UNION
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM Tabl_Kontinent$
WHERE Kontinent = 'Азия' AND CAST(KolNas AS FLOAT) / PL > 300
UNION
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM Tabl_Kontinent$
WHERE Kontinent = 'Африка' AND CAST(KolNas AS FLOAT) / PL > 200
ORDER BY Kontinent

--4
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM
Tabl_Kontinent$
WHERE
PL > 1000000
EXCEPT
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM
Tabl_Kontinent$
WHERE
KolNas > 1000000

--5

SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM
Tabl_Kontinent$
WHERE
PL > 1000000
INTERSECT
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM
Tabl_Kontinent$
WHERE
KolNas > 100000000

--1
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM
Tabl_Kontinent$
WHERE PL < 500 
UNION
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM
Tabl_Kontinent$
WHERE PL > 5000000;

--2
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM
Tabl_Kontinent$
WHERE
PL > 1000000
EXCEPT
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM
Tabl_Kontinent$
WHERE
KolNas < 100000000

--3
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM
Tabl_Kontinent$
WHERE
PL < 50000
INTERSECT
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM
Tabl_Kontinent$
WHERE
KolNas < 1000000