SELECT 
    MAX(LEN(Nazvanie)) AS Дл_Название,
    MIN(LEN(Nazvanie)) AS Кр_Название,
    MAX(LEN(Stolica)) AS Дл_Столица,
    MIN(LEN(Stolica)) AS Кр_Столица
FROM Tabl_Kontinent$;