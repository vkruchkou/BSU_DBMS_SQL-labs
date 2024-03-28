; CREATE DATABASE productdb1
	on
	(NAME = productdb1,
	FILENAME= 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLS\MSSQL\DATA\productdb1.mdf'
	)
	go
	USE productdb1;
	CREATE TABLE Product(
	ID INT IDENTITY PRIMARY KEY,
	PName NVARCHAR(30) NOT NULL,
	Proizvod NVARCHAR(20) NOT NULL,
	ProductCount INT DEFAULT 0,
	Price MONEY NOT NULL
	)
	insert Product Values('Iphone 7','apple',5,5100)