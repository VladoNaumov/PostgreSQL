Вот основные команды PostgreSQL с примерами:

### 1. Подключение к базе данных

\c database_name

**Пример**:

\c my_database


### 2. Создание базы данных

CREATE DATABASE database_name;

**Пример**:

CREATE DATABASE company;


### 3. Удаление базы данных

DROP DATABASE database_name;

**Пример**:

DROP DATABASE company;


### 4. Создание таблицы

CREATE TABLE table_name (
    column_name1 data_type constraints,
    column_name2 data_type constraints
);

**Пример**:

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    salary NUMERIC(10, 2),
    department_id INT
);


### 5. Вставка данных

INSERT INTO table_name (column1, column2) VALUES (value1, value2);

**Пример**:

INSERT INTO employees (name, salary, department_id)
VALUES ('John Doe', 50000.00, 1);


### 6. Обновление данных

UPDATE table_name
SET column1 = value1, column2 = value2
WHERE condition;

**Пример**:

UPDATE employees
SET salary = 55000.00
WHERE name = 'John Doe';


### 7. Удаление данных

DELETE FROM table_name
WHERE condition;

**Пример**:

DELETE FROM employees
WHERE id = 1;


### 8. Выборка данных

SELECT column1, column2 FROM table_name WHERE condition;

**Пример**:

SELECT name, salary
FROM employees
WHERE salary > 30000.00;


### 9. Создание пользователя

CREATE USER username WITH PASSWORD 'password';

**Пример**:

CREATE USER admin WITH PASSWORD 'secure_password';


### 10. Назначение прав пользователю

GRANT privilege ON table_name TO username;

**Пример**:

GRANT SELECT, INSERT ON employees TO admin;


### 11. Создание индекса

CREATE INDEX index_name ON table_name (column_name);

**Пример**:

CREATE INDEX idx_salary ON employees (salary);


### 12. Создание связи между таблицами (внешний ключ)

ALTER TABLE child_table
ADD CONSTRAINT fk_name FOREIGN KEY (child_column) REFERENCES parent_table(parent_column);

**Пример**:

ALTER TABLE employees
ADD CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES departments(id);


### 13. Завершение транзакции

COMMIT;
ROLLBACK;


### 14. Просмотр таблиц и баз данных

\dt  -- Список таблиц
\l   -- Список баз данных
\d table_name -- Описание структуры таблицы


**Пример**:

\dt
\d employees


### 15. Создание представления

CREATE VIEW view_name AS
SELECT column1, column2 FROM table_name WHERE condition;

**Пример**:

CREATE VIEW high_salaries AS
SELECT name, salary
FROM employees
WHERE salary > 60000;


Вот основные команды для работы с таблицами в PostgreSQL, включая добавление, изменение и удаление колонок:

### 1. **Добавление колонки**

ALTER TABLE table_name ADD COLUMN column_name data_type [constraints];

**Пример**:

ALTER TABLE employees ADD COLUMN hire_date DATE;


### 2. **Удаление колонки**

ALTER TABLE table_name DROP COLUMN column_name [CASCADE];

**Пример**:

ALTER TABLE employees DROP COLUMN hire_date;


### 3. **Переименование колонки**

ALTER TABLE table_name RENAME COLUMN old_column_name TO new_column_name;

**Пример**:

ALTER TABLE employees RENAME COLUMN salary TO monthly_salary;


### 4. **Изменение типа данных колонки**

ALTER TABLE table_name ALTER COLUMN column_name SET DATA TYPE new_data_type;

**Пример**:

ALTER TABLE employees ALTER COLUMN monthly_salary SET DATA TYPE NUMERIC(12, 2);


### 5. **Добавление ограничения (например, NOT NULL)**

ALTER TABLE table_name ALTER COLUMN column_name SET NOT NULL;

**Пример**:

ALTER TABLE employees ALTER COLUMN name SET NOT NULL;


### 6. **Удаление ограничения (например, NOT NULL)**

ALTER TABLE table_name ALTER COLUMN column_name DROP NOT NULL;

**Пример**:

ALTER TABLE employees ALTER COLUMN name DROP NOT NULL;


### 7. **Добавление первичного ключа**

ALTER TABLE table_name ADD CONSTRAINT constraint_name PRIMARY KEY (column_name);

**Пример**:

ALTER TABLE employees ADD CONSTRAINT employees_pk PRIMARY KEY (id);


### 8. **Добавление уникального ограничения**

ALTER TABLE table_name ADD CONSTRAINT constraint_name UNIQUE (column_name);

**Пример**:

ALTER TABLE employees ADD CONSTRAINT unique_name UNIQUE (name);


### 9. **Удаление ограничения**

ALTER TABLE table_name DROP CONSTRAINT constraint_name;

**Пример**:

ALTER TABLE employees DROP CONSTRAINT unique_name;


### 10. **Переименование таблицы**

ALTER TABLE old_table_name RENAME TO new_table_name;

**Пример**:

ALTER TABLE employees RENAME TO company_employees;


### 11. **Удаление всех строк из таблицы**
- Если нужно удалить все данные из таблицы, но оставить её структуру:

TRUNCATE TABLE table_name;

**Пример**:

TRUNCATE TABLE employees;


### 12. **Удаление таблицы**

DROP TABLE table_name [CASCADE];

**Пример**:

DROP TABLE employees;


### 13. **Копирование структуры таблицы**
- Если нужно создать копию таблицы без данных:

CREATE TABLE new_table_name (LIKE old_table_name INCLUDING ALL);

**Пример**:

CREATE TABLE employees_backup (LIKE employees INCLUDING ALL);


Эти команды помогут управлять таблицами, внося изменения в их структуру или удаляя их.