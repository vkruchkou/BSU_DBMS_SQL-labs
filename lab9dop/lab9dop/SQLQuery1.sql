--Выборка имен сотрудников в верхнем регистре
SELECT E_NAME, UPPER(E_NAME) AS UPPERCASE_NAME
FROM Employees;

--Конкатенация названия отделения и адреса в таблице Departments
SELECT D_NAME +  ', ' + D_ADDRESS AS NAME_ADDRESS
FROM Departments;

--Использование функции RIGHT для сокращения названия проектов
SELECT P_NAME, RIGHT(P_NAME, 1) AS SHORT_NAME
FROM Projects;

--Использование функции REPLACE для замены статуса для иждевенцев
SELECT DE_STATUS, REPLACE(DE_STATUS,'Son', 'Child') AS UPDATED_Son
FROM Dependents;

--Использование функции FLOOR для округления вверх до целого числа среднего бюджета по отделам
SELECT  D_ID, FLOOR(AVG(P_BUDGET)) AS ROUNDED_AVGSAL
FROM Projects
GROUP BY D_ID;

--Использование функции ROUND для средней запрлаты сотрудников до двух знаков
SELECT  D_ID, ROUND(AVG(E_SALARY),2) AS ROUNDED_AVGSAL
FROM Employees
GROUP BY D_ID;

--Использование функции CEILING для кругления вниз до целого числа средней запрлаты сотрудников
SELECT  D_ID, CEILING(AVG(E_SALARY)) AS ROUNDED_AVGSAL
FROM Employees
GROUP BY D_ID;

--Представление всех участников проектов и их руководителей
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

--Представление проектов с бюджетом выше среднего
go
CREATE VIEW View_ProjectsAvgBudget
AS
SELECT *
FROM Projects
WHERE P_BUDGET > (SELECT AVG(P_BUDGET) FROM Projects);
go
SELECT * FROM View_ProjectsAvgBudget;

--Представление проектов, которые работают в отделе с названием 'IT' или 'Sales':
go
CREATE VIEW View_EmployeesITSales
AS
SELECT *
FROM  Employees
WHERE D_ID IN (SELECT D_ID FROM Departments WHERE D_NAME IN ('IT', 'Sales'));
go
SELECT * FROM View_EmployeesITSales;

--Представление, у которых зарплата больше 60000 и работают в отделе 'IT':
go
CREATE VIEW View_EmployeesITFixSal
AS
SELECT * 
FROM Employees
WHERE E_SALARY > 60000 AND D_ID = (SELECT D_ID FROM Departments WHERE D_NAME = 'IT');
go
SELECT * FROM View_EmployeesITFixSal;

--Представление проектов, у которых бюджет больше 100000 и на которые сотрудники зарегистрированы после 2019 года
go
CREATE VIEW View_ProjectsFixBUDData
AS
SELECT * 
FROM Projects 
WHERE P_BUDGET > 100000 
AND P_ID IN (SELECT P_ID FROM Participations WHERE YEAR(E_START) > 2019);
go
SELECT * FROM View_ProjectsFixBUDData;

--Использование локальной временной переменной:
SELECT D_NAME AS D_NAME, D_ADDRESS AS D_ADDRESS INTO #TempTable
FROM Departments;

SELECT * FROM #TempTable;

-- Удаляем временную таблицу
DROP TABLE #TempTable;

--Использование табличной переменной:
-- Объявляем табличную переменную
DECLARE @TableVariable TABLE (
    ID INT PRIMARY KEY,
    Name NVARCHAR(50)
);

-- Вставляем данные в табличную переменную
INSERT INTO @TableVariable (ID, Name)
SELECT E_ID, E_NAME
FROM Employees;

SELECT * FROM @TableVariable;

--Использование временной глобальной таблицы:
-- Создаем временную глобальную таблицу
CREATE TABLE ##GlobalTempTable (
    ID INT PRIMARY KEY,
    Name NVARCHAR(50)
);

-- Вставляем данные во временную глобальную таблицу
INSERT INTO ##GlobalTempTable (ID, Name)
SELECT E_ID, E_NAME
FROM Employees;

-- Выполняем операции с временной глобальной таблицей
SELECT * FROM ##GlobalTempTable;

-- Удаляем временную глобальную таблицу
DROP TABLE ##GlobalTempTable;

--Использование обобщенного табличного выражения:
WITH CTE AS (
    SELECT E_ID, E_NAME, E_SALARY
    FROM Employees
    WHERE E_SALARY > 50000
)
SELECT *
FROM CTE;

--Хранимая процедура без параметров
go
CREATE PROCEDURE dbo.ProcEmp
AS
BEGIN
    SELECT * FROM Employees;
END;
EXEC ProcEmp;

--Хранимая процедура с выходными параметрами
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
PRINT 'Количество сотрудников в отделе: ' + CAST(@Count AS NVARCHAR(10));

--Скалярная функция для вычисления возраста сотрудника
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

--Функция, возвращающая список сотрудников в указанном отделе
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

--AFTER-триггер для обновления даты последнего изменения сотрудника
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

--INSTEAD OF-триггер для проверки ограничения на заработную плату при вставке нового сотрудника
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
-- Вставляем нового сотрудника с заработной платой в пределах ограничения
INSERT INTO Employees (E_ID, E_NAME, E_SALARY, E_BORN, D_ID)
VALUES (1002, 'Jane Doe', 95000.00, '1995-03-20', 2);

-- Вставляем нового сотрудника с заработной платой, превышающей ограничение
INSERT INTO Employees (E_ID, E_NAME, E_SALARY, E_BORN, D_ID)
VALUES (1003, 'Bob Smith', 105000.00, '1980-11-15', 1);
Select * FROM Employees;