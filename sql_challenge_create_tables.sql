--Create Schema

Create Table departments (
	dept_no varchar(4) not null primary key,
	dept_name varchar(50) not null
);

Create Table employees (
	emp_no int not null primary key,
	birth_date date,
	first_name varchar,
	last_name varchar,
	gender varchar(1),
	hire_date date
);

Create Table dept_emp (
	emp_no int not null references employees(emp_no),
	dept_no varchar(4) not null references departments(dept_no),
	from_date date,
    to_date date
);

Create Table dept_manager (
    dept_no varchar(4) not null references departments(dept_no),
    emp_no int not null references employees(emp_no),
    from_date date,
    to_date date
);

Create Table salaries (
    emp_no int not null references employees(emp_no),
    salary int not null,
    from_date date,
    to_date date
);

Create Table titles (
    emp_no int not null references employees(emp_no),
    title varchar not null,
    from_date date,
    to_date date
);

--Adding primary keys to the tables that don't have them. 

ALTER TABLE salaries
    ADD PRIMARY KEY (emp_no);

ALTER TABLE titles ADD COLUMN id SERIAL PRIMARY KEY;

ALTER TABLE dept_emp
    ADD CONSTRAINT emp_dept PRIMARY KEY (emp_no,dept_no);

ALTER TABLE dept_manager
    ADD CONSTRAINT man_dept PRIMARY KEY (emp_no,dept_no);