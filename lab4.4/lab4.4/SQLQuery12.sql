SELECT Kontinent
FROM Tabl_Kontinent$
GROUP BY Kontinent
HAVING MAX(KolNas) / MIN(KolNas) <= 1000;