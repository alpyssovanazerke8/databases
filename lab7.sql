-- 1.
CREATE INDEX id_countries_name ON countries (name);

-- 2.
CREATE INDEX id_employees_name_surname ON employees (name, surname);

-- 3.
CREATE UNIQUE INDEX id_employees_salary_range ON employees (salary);

-- 4.
CREATE INDEX id_employees_name_prefix ON employees (substring(name FROM 1 FOR 4));

-- 5.
CREATE INDEX id_employees_departments_budget_salary
ON employees (department_id, salary);
CREATE INDEX id_departments_budget ON departments (budget);
