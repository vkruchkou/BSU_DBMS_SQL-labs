SELECT COUNT(*) AS Count_Countries_Starts_With_S
FROM Tabl_Kontinent$
WHERE LEFT(Nazvanie, 1) = 'Ñ';