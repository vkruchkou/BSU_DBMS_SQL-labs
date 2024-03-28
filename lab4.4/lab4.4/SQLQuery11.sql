SELECT 
    Kontinent,
    CASE 
    WHEN Kontinent IN ('������', '����') THEN FLOOR(SUM(KolNas) * 1.2)
    WHEN Kontinent IN ('�������� �������', '������') THEN FLOOR(SUM(KolNas) * 1.5)
    ELSE FLOOR(SUM(KolNas) * 1.7)
    END
    AS SUm_Nas
FROM Tabl_Kontinent$
GROUP BY Kontinent;