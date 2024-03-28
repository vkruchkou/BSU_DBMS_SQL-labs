SELECT Kontinent
FROM Tabl_Kontinent$
GROUP BY Kontinent
HAVING MAX(PL) / MIN(PL) <= 10000;