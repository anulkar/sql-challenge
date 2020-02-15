-- This SQL script creates a table schema for each of the six CSV files provided for the Employee Database.
-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/YF3XjC

-- Drop all tables if they exist first so we can create them from scratch
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- Create the departments table
CREATE TABLE "departments" (
    "dept_no" CHAR(4)   NOT NULL,
    "dept_name" VARCHAR(100)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

-- Create the employees table
CREATE TABLE "employees" (
    "emp_no" INTEGER   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(100)   NOT NULL,
    "last_name" VARCHAR(100)   NOT NULL,
    "gender" CHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

-- Create the salaries table
CREATE TABLE "salaries" (
    "salary_no" SERIAL   NOT NULL,
    "emp_no" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "salary_no"
     )
);

-- Create the titles table
CREATE TABLE "titles" (
    "title_no" SERIAL   NOT NULL,
    "emp_no" INTEGER   NOT NULL,
    "title" VARCHAR(100)   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_no"
     )
);

-- Create the department_manager table
CREATE TABLE "dept_manager" (
    "emp_no" INTEGER   NOT NULL,
    "dept_no" CHAR(4)   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "emp_no"
     )
);

-- Create the deptartment-employee table
CREATE TABLE "dept_emp" (
    "emp_no" INTEGER   NOT NULL,
    "dept_no" CHAR(4)   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

-- Run Alter table SQL statements to create Foreign Key constraints and references across the relevant tables

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

-- The COPY statements commented out below were used to load/import data from each of the CSV files into their respective tables.
/*
COPY departments(dept_no, dept_name) 
FROM '/Users/Shared/Resources/departments.csv'
DELIMITER ',' CSV HEADER;

COPY employees(emp_no, birth_date, first_name, last_name, gender, hire_date) 
FROM '/Users/Shared/Resources/employees.csv'
DELIMITER ',' CSV HEADER;

COPY salaries(emp_no, salary, from_date, to_date) 
FROM '/Users/Shared/Resources/salaries.csv'
DELIMITER ',' CSV HEADER;

COPY titles(emp_no, title, from_date, to_date) 
FROM '/Users/Shared/Resources/titles.csv'
DELIMITER ',' CSV HEADER;

COPY dept_manager(dept_no, emp_no, from_date, to_date) 
FROM '/Users/Shared/Resources/dept_manager.csv'
DELIMITER ',' CSV HEADER;

COPY dept_emp(emp_no, dept_no, from_date, to_date) 
FROM '/Users/Shared/Resources/dept_emp.csv'
DELIMITER ',' CSV HEADER;
*/

-- Run select queries on each table to verify the imported data
select * from departments;
select * from employees;
select * from salaries;
select * from titles;
select * from dept_manager;
select * from dept_emp;