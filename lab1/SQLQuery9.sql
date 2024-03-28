use TestBD1
Create table Zakaz_L
(
Zakaz int,
Produkt int,
Kol_vo int,
Cena Money,
Primary Key(Zakaz, Produkt)
)