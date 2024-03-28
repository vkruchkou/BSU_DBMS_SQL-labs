SELECT Kontinent
FROM Tabl_Kontinent$
WHERE KolNas > 1000000
GROUP BY Kontinent
HAVING AVG(CAST(KolNas AS FLOAT)/PL) > 30;