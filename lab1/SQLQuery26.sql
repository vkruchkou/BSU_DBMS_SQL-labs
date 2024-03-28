use TestBD1
Alter Table dbo.Zakaz	
ADD Constraint PK_Zakaz_id Primary key(Id);
Alter Table dbo.Zakaz	
ADD Constraint FK_Zakaz_TO_Klient
FOREIGN KEY (KlientId) REFERENCES Klient_alt(Id);
Alter Table dbo.Klient_Alt
ADD Constraint CK_Zakaz_alt_age2 Check(Age>0);