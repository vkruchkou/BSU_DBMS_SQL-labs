use TestBD1
Create table Klient_PR_K_ID_UN_Def_CH
(
ID int Primary Key Identity,
Age int Default 18,
NName NVARCHAR(20) Not Null,
Fio NVARCHAR(20) Not Null,
Email NVARCHAR(30),
Phone NVARCHAR(20) 
UNIQUE(Email, Phone),
Check (( Age>0 And Age < 100) AND (Email !='') AND (Phone !=''))
)