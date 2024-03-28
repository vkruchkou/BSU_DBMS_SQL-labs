--������� ���� ����������� � ������� ��������
SELECT E_NAME, UPPER(E_NAME) AS UPPERCASE_NAME
FROM Employees;

--������������ �������� ��������� � ������ � ������� Departments
SELECT D_NAME +  ', ' + D_ADDRESS AS NAME_ADDRESS
FROM Departments;

--������������� ������� RIGHT ��� ���������� �������� ��������
SELECT P_NAME, RIGHT(P_NAME, 1) AS SHORT_NAME
FROM Projects;

--������������� ������� REPLACE ��� ������ ������� ��� ����������
SELECT DE_STATUS, REPLACE(DE_STATUS,'Son', 'Child') AS UPDATED_Son
FROM Dependents;

--������������� ������� FLOOR ��� ���������� ����� �� ������ ����� �������� ������� �� �������
SELECT  D_ID, FLOOR(AVG(P_BUDGET)) AS ROUNDED_AVGSAL
FROM Projects
GROUP BY D_ID;

--������������� ������� ROUND ��� ������� �������� ����������� �� ���� ������
SELECT  D_ID, ROUND(AVG(E_SALARY),2) AS ROUNDED_AVGSAL
FROM Employees
GROUP BY D_ID;

--������������� ������� CEILING ��� ��������� ���� �� ������ ����� ������� �������� �����������
SELECT  D_ID, CEILING(AVG(E_SALARY)) AS ROUNDED_AVGSAL
FROM Employees
GROUP BY D_ID;

--������������� ���� ���������� �������� � �� �������������
go
CREATE VIEW View_ParticipationAndHeads
AS
SELECT Pr.P_NAME, E1.E_NAME AS Participant, E2.E_NAME AS Head
FROM Participations P
JOIN Employees E1 ON P.E_ID = E1.E_ID
JOIN Employees E2 ON P.E_HEAD = E2.E_ID
JOIN Projects Pr ON P.P_ID = Pr.P_ID;
go
SELECT * FROM View_ParticipationAndHeads;

--������������� �������� � �������� ���� ��������
go
CREATE VIEW View_ProjectsAvgBudget
AS
SELECT *
FROM Projects
WHERE P_BUDGET > (SELECT AVG(P_BUDGET) FROM Projects);
go
SELECT * FROM View_ProjectsAvgBudget;

--������������� ��������, ������� �������� � ������ � ��������� 'IT' ��� 'Sales':
go
CREATE VIEW View_EmployeesITSales
AS
SELECT *
FROM  Employees
WHERE D_ID IN (SELECT D_ID FROM Departments WHERE D_NAME IN ('IT', 'Sales'));
go
SELECT * FROM View_EmployeesITSales;

--�������������, � ������� �������� ������ 60000 � �������� � ������ 'IT':
go
CREATE VIEW View_EmployeesITFixSal
AS
SELECT * 
FROM Employees
WHERE E_SALARY > 60000 AND D_ID = (SELECT D_ID FROM Departments WHERE D_NAME = 'IT');
go
SELECT * FROM View_EmployeesITFixSal;

--������������� ��������, � ������� ������ ������ 100000 � �� ������� ���������� ���������������� ����� 2019 ����
go
CREATE VIEW View_ProjectsFixBUDData
AS
SELECT * 
FROM Projects 
WHERE P_BUDGET > 100000 
AND P_ID IN (SELECT P_ID FROM Participations WHERE YEAR(E_START) > 2019);
go
SELECT * FROM View_ProjectsFixBUDData;

--������������� ��������� ��������� ����������:
SELECT D_NAME AS D_NAME, D_ADDRESS AS D_ADDRESS INTO #TempTable
FROM Departments;

SELECT * FROM #TempTable;

-- ������� ��������� �������
DROP TABLE #TempTable;

--������������� ��������� ����������:
-- ��������� ��������� ����������
DECLARE @TableVariable TABLE (
    ID INT PRIMARY KEY,
    Name NVARCHAR(50)
);

-- ��������� ������ � ��������� ����������
INSERT INTO @TableVariable (ID, Name)
SELECT E_ID, E_NAME
FROM Employees;

SELECT * FROM @TableVariable;

--������������� ��������� ���������� �������:
-- ������� ��������� ���������� �������
CREATE TABLE ##GlobalTempTable (
    ID INT PRIMARY KEY,
    Name NVARCHAR(50)
);

-- ��������� ������ �� ��������� ���������� �������
INSERT INTO ##GlobalTempTable (ID, Name)
SELECT E_ID, E_NAME
FROM Employees;

-- ��������� �������� � ��������� ���������� ��������
SELECT * FROM ##GlobalTempTable;

-- ������� ��������� ���������� �������
DROP TABLE ##GlobalTempTable;

--������������� ����������� ���������� ���������:
WITH CTE AS (
    SELECT E_ID, E_NAME, E_SALARY
    FROM Employees
    WHERE E_SALARY > 50000
)
SELECT *
FROM CTE;

--�������� ��������� ��� ����������
go
CREATE PROCEDURE dbo.ProcEmp
AS
BEGIN
    SELECT * FROM Employees;
END;
EXEC ProcEmp;

--�������� ��������� � ��������� �����������
go
CREATE PROCEDURE dbo.ProcCOUNTEmp
   @DepartmentID INT,
   @EmployeeCount INT OUTPUT
AS
BEGIN
    SELECT @EmployeeCount = COUNT(*)
    FROM Employees
    WHERE D_ID = @DepartmentID;
END;
DECLARE @Count INT;
EXEC dbo.ProcCOUNTEmp
    @DepartmentID = 1,
    @EmployeeCount = @Count OUTPUT;
PRINT '���������� ����������� � ������: ' + CAST(@Count AS NVARCHAR(10));

--��������� ������� ��� ���������� �������� ����������
go
CREATE FUNCTION dbo.CalculateAge
(
    @BirthDate DATE
)
RETURNS INT
AS
BEGIN
    DECLARE @Age INT;
    SET @Age = DATEDIFF(YEAR, @BirthDate, GETDATE());
    RETURN @Age;
END;
go
SELECT E_ID, E_NAME, dbo.CalculateAge(E_BORN) AS AGE
FROM Employees;

--�������, ������������ ������ ����������� � ��������� ������
go
CREATE FUNCTION dbo.GetEmployeesDepartment
(
    @DepartmentID INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT E_ID, E_NAME, E_SALARY, E_BORN
    FROM Employees
    WHERE D_ID = @DepartmentID
);
go
SELECT *
FROM dbo.GetEmployeesDepartment(1);

--AFTER-������� ��� ���������� ���� ���������� ��������� ����������
CREATE TABLE EmployeeLog (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT,
    UpdateDate DATETIME
);
go
CREATE TRIGGER AfterEmployeeUpdate
ON Employees
AFTER UPDATE
AS
BEGIN
    INSERT INTO EmployeeLog (EmployeeID, UpdateDate)
    SELECT E_ID, GETDATE()
    FROM INSERTED;
END;
go
UPDATE Employees
SET E_SALARY = E_SALARY + 1000
WHERE E_ID = 1;
SELECT * FROM EmployeeLog;

--INSTEAD OF-������� ��� �������� ����������� �� ���������� ����� ��� ������� ������ ����������
go
CREATE TRIGGER InsteadOfInsertEmployee
ON Employees
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @MaxSalary DECIMAL(8, 2) = 100000.00;

    INSERT INTO Employees (E_ID, E_NAME, E_SALARY, E_BORN, D_ID)
    SELECT E_ID, E_NAME, E_SALARY, E_BORN, D_ID
    FROM INSERTED
    WHERE E_SALARY <= @MaxSalary;
END;
go
-- ��������� ������ ���������� � ���������� ������ � �������� �����������
INSERT INTO Employees (E_ID, E_NAME, E_SALARY, E_BORN, D_ID)
VALUES (1002, 'Jane Doe', 95000.00, '1995-03-20', 2);

-- ��������� ������ ���������� � ���������� ������, ����������� �����������
INSERT INTO Employees (E_ID, E_NAME, E_SALARY, E_BORN, D_ID)
VALUES (1003, 'Bob Smith', 105000.00, '1980-11-15', 1);
Select * FROM Employees;