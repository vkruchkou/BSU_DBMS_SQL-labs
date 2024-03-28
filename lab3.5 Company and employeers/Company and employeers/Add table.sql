-- ��������� ������� ������� Participations � ��������� ��������, ���� ��� ����������
IF OBJECT_ID('dbo.Participations', 'U') IS NOT NULL
	BEGIN
		-- ������� ������� �����, ���� ��� ����������
		ALTER TABLE Participations DROP CONSTRAINT IF EXISTS FK_Projects
		ALTER TABLE Participations DROP CONSTRAINT IF EXISTS FK_Employees_Participation
		ALTER TABLE Participations DROP CONSTRAINT IF EXISTS FK_Employees_Head
		-- ������� ������� Participations
		DROP TABLE Participations
	END;

-- ��������� ������� ������� Dependents � ��������� ��������, ���� ��� ����������
IF OBJECT_ID('dbo.Dependents', 'U') IS NOT NULL
	BEGIN
		-- ������� ������� ����, ���� �� ����������
		ALTER TABLE Dependents DROP CONSTRAINT IF EXISTS FK_Employees
	    -- ������� ������� Dependents
	    DROP TABLE Dependents
	END;

-- ��������� ������� ������� Projects � ��������� ��������, ���� ��� ����������
IF OBJECT_ID('dbo.Projects', 'U') IS NOT NULL
	BEGIN
		-- ������� ������� ����, ���� �� ����������
		ALTER TABLE Projects DROP CONSTRAINT IF EXISTS FK_Departments_Projects
	    -- ������� ������� Projects
	    DROP TABLE Projects
	END;

-- ��������� ������� ������� Departments � ������� ������� ����, ���� �� ����������
IF OBJECT_ID('dbo.Departments', 'U') IS NOT NULL
	ALTER TABLE Departments DROP CONSTRAINT IF EXISTS FK_Departments_Head;

-- ��������� ������� ������� Employees � ������� ������� ����, ���� �� ����������
IF OBJECT_ID('dbo.Employees', 'U') IS NOT NULL
	ALTER TABLE Employees DROP CONSTRAINT IF EXISTS FK_Departments;

-- ������� ������� Departments, ���� ��� ����������
IF OBJECT_ID('dbo.Departments', 'U') IS NOT NULL
	DROP TABLE Departments;

-- ������� ������� Employees, ���� ��� ����������
IF OBJECT_ID('dbo.Employees', 'U') IS NOT NULL
	DROP TABLE Employees;

-- ������� ������� Departments � ���������� ���������
CREATE TABLE Departments (
    D_ID INT PRIMARY KEY,
    D_NAME NVARCHAR(50) NOT NULL,
    D_ADDRESS NVARCHAR(50) NOT NULL,
    D_HEAD INT NULL
);

-- ������� ������� Employees � ���������� ��������� � ������� ������, ����������� � �������� Departments
CREATE TABLE Employees (
    E_ID INT PRIMARY KEY,
    E_NAME NVARCHAR(50) NOT NULL,
    E_ADDRESS NVARCHAR(50),
    E_SALARY DECIMAL(8, 2) NOT NULL CHECK (E_SALARY >= 0),
    E_BORN DATE NOT NULL,
    D_ID INT NOT NULL,
    CONSTRAINT FK_Departments FOREIGN KEY (D_ID) REFERENCES Departments(D_ID) ON DELETE CASCADE
);

-- ��������� ������� ���� � ������� Departments, ����������� D_HEAD � E_ID � ������� Employees
ALTER TABLE Departments
ADD CONSTRAINT FK_Employees FOREIGN KEY (D_HEAD) REFERENCES Employees(E_ID) ON DELETE NO ACTION;

-- ������� ������� Projects � ���������� ��������� � ������� ������, ����������� � �������� Departments
CREATE TABLE Projects (
    P_ID INT PRIMARY KEY,
    P_NAME NVARCHAR(50) UNIQUE NOT NULL,
    P_BUDGET DECIMAL(12, 2) NOT NULL CHECK (P_BUDGET >= 0),
    D_ID INT NOT NULL,
    CONSTRAINT FK_Departments_Projects FOREIGN KEY (D_ID) REFERENCES Departments(D_ID) ON DELETE CASCADE
);

-- ������� ������� Dependents � ���������� ��������� � ������� ������, ����������� E_ID � Employees
CREATE TABLE Dependents (
    DE_ID INT IDENTITY(1, 1) PRIMARY KEY,
    DE_NAME NVARCHAR(50),
    E_ID INT NOT NULL,
    DE_BORN DATE NOT NULL,
    DE_STATUS NVARCHAR(50) NOT NULL,
    CONSTRAINT FK_Employees_Dependents FOREIGN KEY (E_ID) REFERENCES Employees(E_ID) ON DELETE CASCADE
);

-- ������� ������� Participations � ���������� ��������� � �������� �������, ������������ P_ID, E_ID � E_HEAD � ������� ���������
CREATE TABLE Participations (
    P_ID INT NOT NULL,
    E_ID INT NOT NULL,
    E_START DATE NOT NULL,
    E_HEAD INT NOT NULL,
    CONSTRAINT PK_Participations PRIMARY KEY (P_ID, E_ID),
    CONSTRAINT FK_Participations_Projects FOREIGN KEY (P_ID) REFERENCES Projects(P_ID) ON DELETE CASCADE,
    CONSTRAINT FK_Participations_Employees FOREIGN KEY (E_ID) REFERENCES Employees(E_ID) ON DELETE NO ACTION,
    CONSTRAINT FK_Participations_Head FOREIGN KEY (E_HEAD) REFERENCES Employees(E_ID) ON DELETE NO ACTION
);