SELECT LEN(Nazvanie) AS ��_��������, COUNT(*) AS Count_Countries
FROM Tabl_Kontinent$
GROUP BY LEN(Nazvanie)
ORDER BY LEN(Nazvanie) DESC;