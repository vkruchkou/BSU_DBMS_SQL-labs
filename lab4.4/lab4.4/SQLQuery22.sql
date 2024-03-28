SELECT Kontinent, COUNT(*) AS Count_Countries
FROM Tabl_Kontinent$
WHERE KolNas > 100000000
GROUP BY Kontinent
ORDER BY Count_Countries;