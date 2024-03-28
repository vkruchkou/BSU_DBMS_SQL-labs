; CREATE DATABASE productdb
	on
	(NAME = productdb,
	FILENAME= 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLS\MSSQL\DATA\productdb.mdf'
	)
	go
	USE productdb;
	CREATE TABLE Product(
	ID INT IDENTITY PRIMARY KEY,
	PName NVARCHAR(30) NOT NULL,
	Proizvod NVARCHAR(20) NOT NULL,
	ProductCount INT DEFAULT 0,
	Price MONEY NOT NULL
	)
	insert Product Values('Iphone 7','apple',5,5100)

	insert Product (PName, Price, Proizvod)
	Values('Iphone 6',6100,'apple')