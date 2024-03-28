SELECT Kontinent, COUNT(*) AS Count_Countries
FROM Tabl_Kontinent$
GROUP BY Kontinent
ORDER BY Count_Countries DESC;