CREATE DATABASE TestDatabas
ON
(
NAME = TestDatabas_data,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLS\MSSQL\DATA\test.mdf',
SIZE = 10MB,
MAXSIZE = 100MB,
FILEGROWTH = 5MB
)
LOG ON
(
NAME = 'TestDatabas_log',
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLS\MSSQL\DATA\test.ldf',
SIZE = 10MB,
MAXSIZE = 100MB,
FILEGROWTH = 5%
)