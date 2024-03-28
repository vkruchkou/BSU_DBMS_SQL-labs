use TestBD1
If OBJECT_ID('dbo.klient_alt','U') is not NULL
Drop table dbo.klient_alt;
Create table Klient_alt(
ID int Primary Key Identity,
Age int Default 18,
NName NVARCHAR(20) Not Null,
Fio NVARCHAR(20) Not Null,
Email VARCHAR(30) UNIQUE,
Phone VARCHAR(20) UNIQUE
);

If OBJECT_ID('dbo.Zakaz','U') is not NULL
Drop table dbo.Zakaz;
Create table Zakaz(
ID int Identity,
KlientId int,
CreatedA Date
);

ALTER Table Zakaz 
ADD Foreign Key(KlientId) References klient_alt(Id);

ALTER Table Zakaz 
ADD Primary Key(ID);	