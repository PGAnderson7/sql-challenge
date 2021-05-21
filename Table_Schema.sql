--Data Engineering - Create table for each csv file

CREATE TABLE Employees (
    emp_no INT   NOT NULL,
    emp_title_id VARCHAR   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE Department_Employees (
    emp_no INT   NOT NULL,
    dept_no VARCHAR   NOT NULL
);

CREATE TABLE Department_Manager (
    dept_no VARCHAR   NOT NULL,
    emp_no INT   NOT NULL
);

CREATE TABLE Salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL
);

CREATE TABLE Titles (
    title_id VARCHAR   NOT NULL,
    title VARCHAR   NOT NULL
);

ALTER TABLE Department_Employees ADD CONSTRAINT fk_Department_Employees_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Department_Employees ADD CONSTRAINT fk_Department_Employees_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Department_Manager ADD CONSTRAINT fk_Department_Manager_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Department_Manager ADD CONSTRAINT fk_Department_Manager_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

-- Checking table data was imported
SELECT * from Employees;
SELECT * from Departments;
SELECT * from Department_Employees;
SELECT * from Department_Manager;
SELECT * from Salaries;
SELECT * from Titles;