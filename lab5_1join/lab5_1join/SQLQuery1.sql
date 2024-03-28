CREATE TABLE Fakultet (
  ABfak VARCHAR(255) NOT NULL,
  NFak VARCHAR(255) NOT NULL,
);

INSERT INTO Fakultet (ABfak, NFak) VALUES
  ('ГН', 'Гуманитарные науки'),
  ('Ен', 'Естественные науки'),
  ('ИТ', 'Информационные технологии'),
  ('ФМ', 'Физико-математический');

  CREATE TABLE Kafedra (
  shifrkaf VARCHAR(255) NOT NULL,
  nkaf VARCHAR(255) NOT NULL,
  ABfak_kaf VARCHAR(255) NOT NULL,
);

INSERT INTO Kafedra (
  shifrkaf,
  nkaf,
  ABfak_kaf
)
VALUES
('вм','Высшая Математика','ен'),
('ис','Информационные Системы','ит'),
('мм','Математическое Моделирование','фм'),
('оф','Общая Физика','ен'),
('пи','Прикладная Математика','ит'),
('эф','Эксперементальная физика','фм');


CREATE TABLE Sotrudnik (
  TabNom int NOT NULL,  
  ShifrKaf_Sotr VARCHAR(50) NOT NULL,
  FIO VARCHAR(50) NOT NULL,  
  Dolgn VARCHAR(50) NOT NULL,
  Zarplata DECIMAL(10,2) NOT NULL,  
  TabNom_ruk VARCHAR(10) NOT NULL
  );

INSERT INTO Sotrudnik (TabNom, ShifrKaf_Sotr, FIO, Dolgn, Zarplata, TabNom_ruk)
VALUES
(101,'пи', 'Прохоров', 'зав. кафедрой', 3500.00, 101),
(102,'пи', 'Семенов', 'преподаватель', 2500.00, 101),
(105,'пи', 'Петров', 'преподаватель', 2500.00, 101),
(153,'пи', 'Сидорова', 'инженер', 1500.00, 102),
(201,'ис', 'Андреев', 'зав. кафедрой', 3500.00, 201),
(202,'ис', 'Борисов', 'преподаватель', 2500.00, 201),
(241,'ис', 'Глухов', 'инженер', 2000.00, 201),
(242,'ис', 'Чернов', 'инженер', 1500.00, 202),
(301,'мм', 'Басов', 'зав. кафедрой', 3500.00, 301),
(302,'мм', 'Сергеева', 'преподаватель', 2500.00, 301),
(401,'оф', 'Волков', 'зав. кафедрой', 3500.00, 401),
(402,'оф', 'Зайцев', 'преподаватель', 2500.00, 401),
(403,'оф', 'Смирнов', 'преподаватель', 1500.00, 401),
(435,'оф', 'Лисик', 'инженер', 2000.00, 402),
(501,'вм', 'Кузнецов', 'зав. кафедрой', 3500.00, 501),
(502,'вм', 'Романцев', 'преподаватель', 2500.00, 501),
(503,'вм', 'Соловьев', 'преподаватель', 2500.00, 501),
(601,'эф', 'Зверев', 'зав. кафедрой', 3500.00, 601),
(602,'эф', 'Сорокина', 'преподаватель', 2500.00, 601),
(614,'эф', 'Григорьев', 'инженер', 2000.00, 602);

CREATE TABLE Spezialn (
  NSpez VARCHAR(10) NOT NULL,  
  NaprSpez VARCHAR(50) NOT NULL,
  ShifrSpez VARCHAR(50) NOT NULL
);

INSERT INTO Spezialn
VALUES
('01.03.04', 'Прикладная Математика', 'мм'),
('09.03.02', 'Информационные системы и технологии', 'ис'),
('14.03.02', 'Ядерная физика и технологии', 'иф'),
('38.03.05', 'Бизнес инфориатика', 'ис'),
('09.09.03', 'Прикладная инфориатика', 'пи');

CREATE TABLE Predmet (
  kod_pred VARCHAR(10) NOT NULL, 
  Kol VARCHAR(10) NOT NULL,
  Predmet VARCHAR(255) NOT NULL,  
  Ispolnitel_kaf VARCHAR(255) NOT NULL
  );

INSERT INTO Predmet
VALUES
('101', '320', 'Математика', 'вм'),
('102', '160', 'Информатика', 'пи'),
('103', '160', 'Физика', 'оф'),
('202', '120', 'База данных', 'ис'),
('204', '160', 'Электроника', 'эф'),
('205', '80', 'Программирование', 'пи'),
('209', '80', 'Моделирование', 'мм');

CREATE TABLE Zakaz (
  N_Z VARCHAR(10) NOT NULL,  
  Kod_Z VARCHAR(10) NOT NULL
);

INSERT INTO Zakaz (N_Z, Kod_Z)
VALUES
('01.03.04','101'),
('01.03.04','205'),
('01.03.04','209'),
('09.03.02','101'),
('09.03.02','102'),
('09.03.02','103'),
('09.03.02','202'),
('09.02.03','205'),
('09.02.03','209'),
('09.03.03','101'),
('09.09.03','102'),
('09.09.03','103'),
('09.03.03','205'),
('09.03.03','202'),
('14.03.02','101'),
('14.03.02','102'),
('14.03.02','103'),
('14.03.02','204'),
('38.03.05','101'),
('38.03.05','103'),
('38.03.05','202'),
('38.03.05','209');

CREATE TABLE ZavKaf (
  TabNom_K int NOT NULL,
  St_K VARCHAR(10) NOT NULL
);

INSERT INTO ZavKaf (TabNom_K, St_K) 
VALUES
(101, 15),
(201, 18),
(301, 20),
(401, 10),
(501, 18),
(601, 8);

CREATE TABLE Ingener (  
  TabNom_IN int NOT NULL,
  Spez VARCHAR(50) NOT NULL
);

INSERT INTO Ingener (TabNom_IN, Spez) 
VALUES
(153, 'электроник'),
(241, 'электроник'),
(242, 'программист'),
(435, 'электроник'),
(614, 'программист');

CREATE TABLE Prepodavatel (
  TabNom_Pr int NOT NULL,  
  Zvanie VARCHAR(50) NOT NULL,
  Stepen VARCHAR(50)
);

INSERT INTO Prepodavatel (TabNom_Pr, Zvanie, Stepen)
VALUES
(101, 'профессор', 'д.т.н.'),
(102, 'доцент', 'к.ф.-м.н.'),
(105, 'доцент', 'к.т.н.'),
(201, 'профессор', 'д.ф.-м.н.'),
(202, 'доцент', 'к.ф.-м.н.'),
(301, 'профессор', 'д.т.н.'),
(302, 'доцент', 'к.т.н.'),
(401, 'профессор', 'д.т.н.'),
(402, 'доцент', 'к.т.н.'),
(403, 'ассистент', NULL),
(501, 'профессор', 'д.ф.-м.н.'),
(502, 'профессор', 'д.ф.-м.н.'),
(601, 'доцент', 'к.ф.-м.н.'),
(602, 'профессор.', 'д.ф.-м.н.');

CREATE TABLE Student (
  Reg_Nom INT NOT NULL,  
  Nom_Spez_St VARCHAR(10) NOT NULL,
  FIO_Stud VARCHAR(50) NOT NULL
);

INSERT INTO Student (Reg_Nom, Nom_Spez_St, FIO_Stud)
VALUES
(10101, '09.03.03', 'Николаева'),
(10102, '09.03.03', 'Иванов'),
(10103, '09.03.03', 'Крюков'),
(20101, '09.03.02', 'Андреев'),
(20102, '09.03.02', 'Федоров'),
(30101, '14.03.02', 'Бондаренко'),
(30102, '14.03.02', 'Цветков'),
(30103, '14.03.02', 'Петров'),
(50101, '01.03.04', 'Сергеев'),
(50102, '01.03.04', 'Кудрявцев'),
(80101, '38.03.05', 'Макаров'),
(80102, '38.03.05', 'Яковлев');

CREATE TABLE Ozenka (
data DATE NOT NULL,
  kod VARCHAR(10) NOT NULL,  
  ReGNom VARCHAR(10) NOT NULL,
  TabNom int NOT NULL,  
  Auditoria VARCHAR(10) NOT NULL,
  Ozenk_a INT NOT NULL
  );

INSERT INTO Ozenka (data, kod, ReGNom, TabNom, Auditoria, Ozenk_a)
VALUES
('2022-06-05', '102', '10101', 102, 'т505', 4),
('2022-06-05', '102', '10102', 102, 'т505', 4),
('2022-06-05', '202', '20101', 202, 'т506', 4),
('2022-06-05', '202', '20102', 202, 'т506', 3),
('2022-06-07', '102', '30101', 105, 'ф419', 3),
('2022-06-07', '102', '30102', 101, 'т506', 4),
('2022-06-07', '102', '80101', 102, 'м425', 5),
('2022-06-09', '205', '80102', 402, 'м424', 4),
('2022-06-09', '209', '20101', 302, 'ф333', 3),
('2022-06-10', '101', '10102', 501, 'т506', 4),
('2022-06-10', '204', '30102', 601, 'ф349', 5),
('2022-06-10', '209', '80101', 301, 'э105', 5),
('2022-06-10', '209', '80102', 301, 'э105', 4),
('2022-06-12', '101', '80101', 502, 'c324', 4),
('2022-06-15', '101', '30101', 503, 'ф417', 4),
('2022-06-15', '101', '50101', 501, 'ф201', 5),
('2022-06-15', '101', '50102', 501, 'ф201', 3),
('2022-06-15', '103', '10101', 403, 'ф414', 4),
('2022-06-15', '102', '10101', 102, 'т505', 5);

--1
SELECT
F.nfak AS fakultet,
K.nkaf AS kafedra
FROM fakultet F, kafedra K
WHERE F.abfak = K.ABfak_Kaf
ORDER BY fakultet, kafedra;

--2
SELECT
F.nfak AS fakultet,
K.nkaf AS kafedra
FROM
fakultet F
INNER JOIN kafedra K
ON F.abfak = K.ABfak_Kaf
ORDER BY fakultet,kafedra;

--3
SELECT
F.nfak AS fakultet,
K.nkaf AS kafedra
FROM
fakultet F
LEFT OUTER JOIN kafedra K
ON F.abfak = K.ABfak_Kaf
ORDER BY fakultet, kafedra;

--4
SELECT
S.Fio_stud,
P.NaprSpez,
K.NKaf AS Kafedra
FROM
Student S
INNER JOIN Spezialn P ON S.Nom_SpeZ_St = P.NSpez
INNER JOIN Kafedra K ON P.ShifrSpez = K.Shifrkaf

--5
SELECT  S.FIO,
S.Dolgn,  S.Zarplata,
P.FIO AS Руководитель
FROM
Sotrudnik S
INNER JOIN Sotrudnik P ON S.TabNom = P.TabNom_ruk

--6
SELECT
S.Fio_stud
FROM  Student S
INNER JOIN Ozenka O ON S.Reg_Nom = O.REGNom
GROUP BY S.Fio_stud

--7
SELECT
S.FIO_Stud, AVG(O.Ozenk_a) AS [Средний балл]
FROM Student S  INNER JOIN Ozenka O ON S.Reg_Nom = O.REGNom
GROUP BY S.FIO_Stud

--8
SELECT
S.FIO, S.Zarplata, Z.St_K 
FROM Sotrudnik S 
INNER JOIN Zavkaf Z ON S.TabNom = Z.TabNom_K

--9
SELECT
S.FIO, P.Stepen
FROM Sotrudnik S
INNER JOIN Prepodavatel P ON S.TabNom = P.TabNom_Pr
WHERE P.Stepen IN ('к.ф.-м.н.', 'д.ф.-м.н.')

--10
SELECT DISTINCT
PR.Predmet AS Дисциплина, S.FIO,
S.Dolgn, P.Stepen,
O.data, O.Auditoria 
FROM Ozenka O 
INNER JOIN Predmet PR ON O.Kod = PR.kod_pred
INNER JOIN Sotrudnik S ON O.TabNom = S. TabNom 
INNER JOIN Prepodavatel P ON O.TabNom = P.TabNom_Pr 
ORDER BY O.data

--11
SELECT
s.fio, count(O.data) as [Количество экзаменов]
FROM Ozenka O   
INNER JOIN Sotrudnik S ON O.TabNom = S.TabNom
GROUP BY S.FIO

--12
SELECT
  S.fio_stud 
FROM Student S
  LEFT OUTER JOIN Ozenka O ON S.Reg_Nom = O.ReGNom
WHERE O.ReGNom IS NULL


--сам. работа
--1
SELECT S.FIO_Stud
FROM Student S
  INNER JOIN Spezialn SP ON S.Nom_Spez_St = SP.NSpez
  INNER JOIN Kafedra K ON SP.ShifrSpez = K.ShifrKaf
WHERE K.ABfak_Kaf = 'ит';

--2
SELECT S.TabNom, S.FIO, R.FIO AS Rukovoditel
FROM Sotrudnik S
LEFT OUTER JOIN Sotrudnik R ON S.TabNom_ruk = R.TabNom;

--3
SELECT S.FIO_Stud
FROM Ozenka O
LEFT OUTER JOIN Student S ON S.ReG_Nom = O.ReGNom
GROUP BY  S.FIO_Stud
HAVING COUNT(*) >= 2;

--4
SELECT I.TabNom_IN, I.Spez, S.Zarplata
FROM Ingener I
INNER JOIN Sotrudnik S ON I.TabNom_IN = S.TabNom
WHERE S.Zarplata < 2000.00;

--5
SELECT S.FIO_Stud
FROM Ozenka O
LEFT OUTER JOIN Student S ON S.ReG_Nom = O.ReGNom
WHERE O.Auditoria = 'т505';

--6
SELECT S.ReG_Nom, S.FIO_Stud, COUNT(O.kod) AS KolEkzamenov, AVG(O.Ozenk_a) AS SredniyBall
FROM Student S
INNER JOIN Ozenka O ON S.ReG_Nom = O.ReGNom
GROUP BY S.ReG_Nom, S.FIO_Stud
HAVING AVG(O.Ozenk_a) >= 4
ORDER BY S.ReG_Nom;

--7
SELECT S.TabNom, S.FIO, S.Zarplata, P.Stepen
FROM Sotrudnik S
INNER JOIN Prepodavatel P ON S.TabNom = P.TabNom_Pr
WHERE S.Dolgn = 'зав. кафедрой';

--8
SELECT S.TabNom, S.FIO
FROM Sotrudnik S
INNER JOIN Prepodavatel P ON S.TabNom = P.TabNom_Pr
WHERE P.Zvanie = 'профессор';

--9
SELECT P.Predmet, S.FIO, S.Dolgn, Pr.Stepen, O.data, O.Auditoria
FROM Ozenka O
INNER JOIN Sotrudnik S ON O.TabNom = S.TabNom
INNER JOIN Prepodavatel Pr ON S.TabNom = Pr.TabNom_Pr
INNER JOIN Predmet P ON O.kod = P.kod_pred
WHERE O.data BETWEEN '2022-06-05' AND '2022-06-10'
ORDER BY O.data;

--10
SELECT S.FIO, COUNT(O.kod) as KolPrinyatEkz
FROM Sotrudnik S
INNER JOIN Predmet P ON S.ShifrKaf_Sotr = P.Ispolnitel_kaf
INNER JOIN Ozenka O ON P.kod_pred = O.kod
GROUP BY S.FIO
HAVING COUNT(O.kod) > 3;

--11
SELECT DISTINCT S.FIO_Stud
FROM Student S
LEFT OUTER JOIN Ozenka O ON o.RegNom = S.ReG_Nom
WHERE O.data != '2022-06-15'  OR  O.data IS NULL;