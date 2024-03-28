use TestBD1
If OBJECT_ID('dbo.klient_alt','U') is not NULL
Drop table dbo.klient_alt;
Create table Klient_alt(
ID int Primary Key Identity,
Age int Default 18,
NName NVARCHAR(20) Not Null,
Fio NVARCHAR(20) Not Null,
Email VARCHAR(30),
Phone VARCHAR(20)
);
Alter Table Klient_alt
Add Adress NVARCHAR(50) Not Null Default 'нет';