CREATE DATABASE TestBD1
ON
(
NAME = TestBD1_data,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLS\MSSQL\DATA\TestBD1.mdf',
SIZE = 10MB,
MAXSIZE = 100MB,
FILEGROWTH = 5MB
)
LOG ON
(
NAME = 'TestDatabas_log',
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLS\MSSQL\DATA\TestBD1.ldf',
SIZE = 10MB,
MAXSIZE = 100MB,
FILEGROWTH = 5%
)