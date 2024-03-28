use TestBD1
Create Table TestTable4(
id int DEFAULT 1 NOT NULL,
vcName varchar(50) NOT NULL,
dBirthDate datetime,
dDocDate datetime, 
CONSTRAINT CK_Dbirthdate CHECK (dBirthDate > '01-01-1900' AND dBirthDate<getDate())
)