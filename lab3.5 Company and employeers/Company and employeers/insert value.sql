use Ucheb_7_Kryuchkov;

ALTER TABLE Employees DROP CONSTRAINT IF EXISTS FK_Departments;

INSERT Employees (E_ID, E_NAME, E_ADDRESS, E_SALARY, E_BORN, D_ID)
VALUES (1, 'John Doe', '123 Main St', 50000.00, '1990-05-15', 1),
       (2, 'Jane Smith', '456 Elm St', 60000.00, '1988-02-28', 4),
       (3, 'Alice Johnson', '789 Oak St', 55000.00, '1992-11-10', 8),
       (4, 'Bob Brown', '101 Pine St', 48000.00, '1995-07-20', 7),
       (5, 'Eva White', '202 Maple St', 52000.00, '1985-04-03', 10),
       (6, 'Michael Davis', '303 Cedar St', 65000.00, '1993-09-18', 3),
       (7, 'Olivia Lee', '404 Birch St', 70000.00, '1987-12-07', 5),
       (8, 'Daniel Wilson', '505 Spruce St', 75000.00, '1984-08-25', 6),
       (9, 'Sophia Martinez', '606 Ash St', 48000.00, '1991-03-14', 9),
       (10, 'Liam Thomas', '707 Fir St', 55000.00, '1994-06-29', 1),
	   (11, 'Sarah Johnson', '808 Pine St', 62000.00, '1993-08-12', 2),
       (12, 'David Lee', '909 Oak St', 58000.00, '1994-02-19', 3),
       (13, 'Megan Brown', '101 Elm St', 56000.00, '1991-06-25', 4),
       (14, 'Kevin Miller', '202 Cedar St', 59000.00, '1989-11-07', 5),
       (15, 'Amanda Wilson', '303 Spruce St', 64000.00, '1990-09-15', 6),
       (16, 'Christopher Hall', '404 Birch St', 67000.00, '1987-04-28', 7),
       (17, 'Emma Martinez', '505 Maple St', 60000.00, '1992-12-04', 8),
       (18, 'Ryan Taylor', '606 Ash St', 57000.00, '1988-07-21', 9),
       (19, 'Grace Robinson', '707 Fir St', 61000.00, '1995-03-09', 10),
       (20, 'Brandon Young', '808 Pine St', 63000.00, '1986-10-13', 2);


INSERT Departments (D_ID, D_NAME, D_ADDRESS, D_HEAD)
VALUES (1, 'Sales', '123 Sales St', 1),
       (2, 'Marketing', '456 Marketing St', NULL),
       (3, 'IT', '789 IT St', 3),
       (4, 'Finance', '101 Finance St', 4),
       (5, 'HR', '202 HR St', 5),
       (6, 'Operations', '303 Operations St', 6),
       (7, 'Research', '404 Research St', 7),
       (8, 'Customer Service', '505 Customer Service St', 8),
       (9, 'Product Development', '606 Product Development St', NULL),
       (10, 'Quality Assurance', '707 QA St', 10);

ALTER TABLE Employees
   ADD CONSTRAINT FK_Departments FOREIGN KEY (D_ID) REFERENCES Departments(D_ID) ON DELETE CASCADE;


INSERT Projects (P_ID, P_NAME, P_BUDGET, D_ID)
VALUES (1, 'Project A', 100000.00, 1),
       (2, 'Project B', 80000.00, 2),
       (3, 'Project C', 120000.00, 3),
       (4, 'Project D', 90000.00, 4),
       (5, 'Project E', 95000.00, 5),
       (6, 'Project F', 110000.00, 6),
       (7, 'Project G', 85000.00, 7),
       (8, 'Project H', 130000.00, 8),
       (9, 'Project I', 70000.00, 9),
       (10, 'Project J', 75000.00, 10);

INSERT Participations (P_ID, E_ID, E_START, E_HEAD)
VALUES (1, 1, '2023-01-15', 2),
       (1, 3, '2023-01-20', 2),
       (2, 2, '2023-02-01', 4),
       (2, 4, '2023-02-05', 4),
       (3, 5, '2023-03-10', 6),
       (3, 6, '2023-03-12', 6),
       (4, 7, '2023-04-03', 8),
       (4, 8, '2023-04-05', 8),
       (5, 9, '2023-05-20', 10),
       (5, 10, '2023-05-25', 10);

INSERT Dependents (DE_NAME, E_ID, DE_BORN, DE_STATUS)
VALUES ('Child 1', 1, '2000-03-05', 'Son'),
       ('Child 2', 3, '2002-07-12', 'Daughter'),
       ('Spouse 1', 2, '1975-11-18', 'Spouse'),
       ('Child 3', 7, '2005-01-30', 'Son'),
       ('Child 4', 9, '2008-09-14', 'Daughter'),
       ('Spouse 2', 6, '1980-06-22', 'Spouse'),
       ('Child 5', 5, '1999-04-08', 'Son'),
       ('Child 6', 4, '2003-12-19', 'Daughter'),
       ('Child 7', 10, '2010-02-28', 'Son'),
       ('Spouse 3', 8, '1978-09-07', 'Spouse');