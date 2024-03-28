use TestBD1
Create table Klient_im_org
(
ID int Constraint PK_Klient_Id Primary Key Identity,
Age int Constraint DF_Klient_Age Default 18 Constraint Ck_Klient_Age Check (Age>0 And Age < 100),
NName NVARCHAR(20) Not Null,
Fio NVARCHAR(20) Not Null,
Email NVARCHAR(30) Constraint Uq_Klient_Email UNIQUE,
Phone NVARCHAR(20) Constraint Uq_Klient_Phone UNIQUE,
)

Create table Klient_im_org1
(
ID int Identity,
Age int Constraint DF_Klient_Age1 Default 18,
NName NVARCHAR(20) Not Null,
Fio NVARCHAR(20) Not Null,
Email NVARCHAR(30),
Phone NVARCHAR(20),
Constraint Ck_Klient_Age1 Check (Age>0 And Age < 100),
Constraint PK_Klient_Id1 Primary Key(ID),
Constraint Uq_Klient_Email1 UNIQUE(Email),
Constraint Uq_Klient_Phone1 UNIQUE(Phone)
)