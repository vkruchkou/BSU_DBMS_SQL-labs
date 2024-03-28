use TestBD1
Create Table TestTable2(
id int DEFAULT 1 NOT NULL,
vcName varchar(50) NOT NULL,
dBirthDate datetime,
CONSTRAINT CK_birthdate CHECK (dBirthDate > '01-01-1900' AND dBirthDate<getDate())
)