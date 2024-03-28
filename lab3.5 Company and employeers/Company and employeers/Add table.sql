-- Проверяем наличие таблицы Participations и выполняем действия, если она существует
IF OBJECT_ID('dbo.Participations', 'U') IS NOT NULL
	BEGIN
		-- Удаляем внешние ключи, если они существуют
		ALTER TABLE Participations DROP CONSTRAINT IF EXISTS FK_Projects
		ALTER TABLE Participations DROP CONSTRAINT IF EXISTS FK_Employees_Participation
		ALTER TABLE Participations DROP CONSTRAINT IF EXISTS FK_Employees_Head
		-- Удаляем таблицу Participations
		DROP TABLE Participations
	END;

-- Проверяем наличие таблицы Dependents и выполняем действия, если она существует
IF OBJECT_ID('dbo.Dependents', 'U') IS NOT NULL
	BEGIN
		-- Удаляем внешний ключ, если он существует
		ALTER TABLE Dependents DROP CONSTRAINT IF EXISTS FK_Employees
	    -- Удаляем таблицу Dependents
	    DROP TABLE Dependents
	END;

-- Проверяем наличие таблицы Projects и выполняем действия, если она существует
IF OBJECT_ID('dbo.Projects', 'U') IS NOT NULL
	BEGIN
		-- Удаляем внешний ключ, если он существует
		ALTER TABLE Projects DROP CONSTRAINT IF EXISTS FK_Departments_Projects
	    -- Удаляем таблицу Projects
	    DROP TABLE Projects
	END;

-- Проверяем наличие таблицы Departments и удаляем внешний ключ, если он существует
IF OBJECT_ID('dbo.Departments', 'U') IS NOT NULL
	ALTER TABLE Departments DROP CONSTRAINT IF EXISTS FK_Departments_Head;

-- Проверяем наличие таблицы Employees и удаляем внешний ключ, если он существует
IF OBJECT_ID('dbo.Employees', 'U') IS NOT NULL
	ALTER TABLE Employees DROP CONSTRAINT IF EXISTS FK_Departments;

-- Удаляем таблицу Departments, если она существует
IF OBJECT_ID('dbo.Departments', 'U') IS NOT NULL
	DROP TABLE Departments;

-- Удаляем таблицу Employees, если она существует
IF OBJECT_ID('dbo.Employees', 'U') IS NOT NULL
	DROP TABLE Employees;

-- Создаем таблицу Departments с указанными столбцами
CREATE TABLE Departments (
    D_ID INT PRIMARY KEY,
    D_NAME NVARCHAR(50) NOT NULL,
    D_ADDRESS NVARCHAR(50) NOT NULL,
    D_HEAD INT NULL
);

-- Создаем таблицу Employees с указанными столбцами и внешним ключом, связывающим с таблицей Departments
CREATE TABLE Employees (
    E_ID INT PRIMARY KEY,
    E_NAME NVARCHAR(50) NOT NULL,
    E_ADDRESS NVARCHAR(50),
    E_SALARY DECIMAL(8, 2) NOT NULL CHECK (E_SALARY >= 0),
    E_BORN DATE NOT NULL,
    D_ID INT NOT NULL,
    CONSTRAINT FK_Departments FOREIGN KEY (D_ID) REFERENCES Departments(D_ID) ON DELETE CASCADE
);

-- Добавляем внешний ключ в таблицу Departments, связывающий D_HEAD с E_ID в таблице Employees
ALTER TABLE Departments
ADD CONSTRAINT FK_Employees FOREIGN KEY (D_HEAD) REFERENCES Employees(E_ID) ON DELETE NO ACTION;

-- Создаем таблицу Projects с указанными столбцами и внешним ключом, связывающим с таблицей Departments
CREATE TABLE Projects (
    P_ID INT PRIMARY KEY,
    P_NAME NVARCHAR(50) UNIQUE NOT NULL,
    P_BUDGET DECIMAL(12, 2) NOT NULL CHECK (P_BUDGET >= 0),
    D_ID INT NOT NULL,
    CONSTRAINT FK_Departments_Projects FOREIGN KEY (D_ID) REFERENCES Departments(D_ID) ON DELETE CASCADE
);

-- Создаем таблицу Dependents с указанными столбцами и внешним ключом, связывающим E_ID с Employees
CREATE TABLE Dependents (
    DE_ID INT IDENTITY(1, 1) PRIMARY KEY,
    DE_NAME NVARCHAR(50),
    E_ID INT NOT NULL,
    DE_BORN DATE NOT NULL,
    DE_STATUS NVARCHAR(50) NOT NULL,
    CONSTRAINT FK_Employees_Dependents FOREIGN KEY (E_ID) REFERENCES Employees(E_ID) ON DELETE CASCADE
);

-- Создаем таблицу Participations с указанными столбцами и внешними ключами, связывающими P_ID, E_ID и E_HEAD с другими таблицами
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