--Внутреннее соединение таблиц Employees и Departments
SELECT *
FROM Employees
INNER JOIN Departments ON Employees.D_ID = Departments.D_ID;

--Внешнее левое соединение таблиц Departments и Projects
SELECT *
FROM Departments
LEFT JOIN Projects ON Departments.D_ID = Projects.D_ID;


--Полное внешнее соединение таблиц Employees и Dependents
SELECT *
FROM Employees
FULL JOIN Dependents ON Employees.E_ID = Dependents.E_ID;

--Перекрестное соединение таблиц Projects и Participations
SELECT *
FROM Projects
CROSS JOIN Participations;

--Запрос на пересечение
SELECT *
FROM Employees
WHERE E_SALARY > 50000
INTERSECT
SELECT *
FROM Employees
WHERE E_NAME LIKE 'B%';

--Запрос на разность
SELECT *
FROM Employees
EXCEPT
SELECT *
FROM Employees
WHERE E_NAME LIKE 'A%';

--Запрос на объединение таблиц
SELECT *
FROM Employees
WHERE E_SALARY > 60000
UNION
SELECT *
FROM Employees
WHERE YEAR(E_BORN) > 1990;

--Выбрать сотрудников, зарплата который больше средней зарплаты
SELECT *
FROM Employees
WHERE E_SALARY > (SELECT AVG(E_SALARY) FROM Employees);

--Выбрать сотрудников, которые являюься руководителями отделов
SELECT *
FROM Employees
WHERE E_ID IN (SELECT D_HEAD FROM Departments);


-- Выбрать сотрудников, участвующих в проектах
SELECT *
FROM Employees
WHERE EXISTS (SELECT 1 FROM Participations WHERE E_ID = Employees.E_ID);



--Запрос на выбор сотрудников без иждивенцев, у которых зарплата больше любой запрлаты работника, имеющим иждивенцев.
SELECT E_ID, E_NAME
FROM Employees
WHERE E_ID NOT IN (SELECT E_ID FROM Dependents) AND E_SALARY > ANY (SELECT E_SALARY FROM Employees
WHERE E_ID IN (SELECT E_ID FROM Dependents));