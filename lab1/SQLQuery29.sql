use TestBD1
Create Table TestTable1(
iID int DEFAULT 1,
CONSTRAINT check_iID CHECK (iID is NOT NULL)
)
INSERT INTO TestTable1
VALUES(10)
