SELECT LEN(Nazvanie) AS Дл_Название, COUNT(*) AS Count_Countries
FROM Tabl_Kontinent$
GROUP BY LEN(Nazvanie)
ORDER BY LEN(Nazvanie) DESC;