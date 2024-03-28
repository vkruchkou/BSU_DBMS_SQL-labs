--���������� ���������� ������ Employees � Departments
SELECT *
FROM Employees
INNER JOIN Departments ON Employees.D_ID = Departments.D_ID;

--������� ����� ���������� ������ Departments � Projects
SELECT *
FROM Departments
LEFT JOIN Projects ON Departments.D_ID = Projects.D_ID;


--������ ������� ���������� ������ Employees � Dependents
SELECT *
FROM Employees
FULL JOIN Dependents ON Employees.E_ID = Dependents.E_ID;

--������������ ���������� ������ Projects � Participations
SELECT *
FROM Projects
CROSS JOIN Participations;

--������ �� �����������
SELECT *
FROM Employees
WHERE E_SALARY > 50000
INTERSECT
SELECT *
FROM Employees
WHERE E_NAME LIKE 'B%';

--������ �� ��������
SELECT *
FROM Employees
EXCEPT
SELECT *
FROM Employees
WHERE E_NAME LIKE 'A%';

--������ �� ����������� ������
SELECT *
FROM Employees
WHERE E_SALARY > 60000
UNION
SELECT *
FROM Employees
WHERE YEAR(E_BORN) > 1990;

--������� �����������, �������� ������� ������ ������� ��������
SELECT *
FROM Employees
WHERE E_SALARY > (SELECT AVG(E_SALARY) FROM Employees);

--������� �����������, ������� �������� �������������� �������
SELECT *
FROM Employees
WHERE E_ID IN (SELECT D_HEAD FROM Departments);


-- ������� �����������, ����������� � ��������
SELECT *
FROM Employees
WHERE EXISTS (SELECT 1 FROM Participations WHERE E_ID = Employees.E_ID);



--������ �� ����� ����������� ��� ����������, � ������� �������� ������ ����� �������� ���������, ������� ����������.
SELECT E_ID, E_NAME
FROM Employees
WHERE E_ID NOT IN (SELECT E_ID FROM Dependents) AND E_SALARY > ANY (SELECT E_SALARY FROM Employees
WHERE E_ID IN (SELECT E_ID FROM Dependents));