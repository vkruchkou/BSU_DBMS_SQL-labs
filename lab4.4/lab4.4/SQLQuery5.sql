SELECT ROUND(AVG(CAST(KolNas AS FLOAT)), 2) AS SR_KolNas
FROM Tabl_Kontinent$
WHERE Kontinent != 'Европа';