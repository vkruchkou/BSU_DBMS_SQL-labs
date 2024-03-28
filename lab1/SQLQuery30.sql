use TestBD1
If OBJECT_ID('dbo.TestTable1','U') is NULL
Create Table TestTable1(
iID int DEFAULT 1,
CONSTRAINT check_iID CHECK (iID is NOT NULL)
)
INSERT INTO TestTable1
VALUES(10)

UPDATE TestTable1
SET iID = NULL