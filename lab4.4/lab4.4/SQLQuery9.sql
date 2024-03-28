SELECT LEFT(Nazvanie, 1) AS PerV_BV, COUNT(*) AS Count_Countries
FROM Tabl_Kontinent$
GROUP BY LEFT(Nazvanie, 1)
ORDER BY PerV_BV;