use TestBD1
Create table Klient_PR_K_ID_UN1
(
ID int Primary Key Identity,
Age int,
NName NVARCHAR(20),
Fio NVARCHAR(20),
Email NVARCHAR(30),
Phone NVARCHAR(20) 
UNIQUE(Email, Phone)
)