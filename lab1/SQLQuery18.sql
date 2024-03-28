use TestBD1
Create table Zakaz_VKK2
(
ID int Primary Key Identity,
KlientId int,
CreatedA Date
Foreign Key (KlientId) REFERENCES Klient_VKK(ID)
)