use TestBD1
Create table Klient_VKK
(
ID int Primary Key Identity,
Age int Default 18,
NName NVARCHAR(20) Not Null,
Fio NVARCHAR(20) Not Null,
Email NVARCHAR(30) UNIQUE,
Phone NVARCHAR(20) UNIQUE 
)

Create table Zakaz_VKK
(
ID int Primary Key Identity,
KlientId int REFERENCES Klient_VKK(ID),
CreatedA Date
)