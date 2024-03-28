SELECT 
    Kontinent,
    SUM(FLOOR(KolNas * 1.1)) AS SUm_Nas
FROM Tabl_Kontinent$
GROUP BY Kontinent;