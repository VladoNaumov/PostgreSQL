###

Перейдите в директорию, где находится дамп базы данных:
cd  C:\Users\umbre\Desktop\PostgreSQL command\bd

Для загрузки базы данных PostgreSQL в SQL-формате
psql -U postgres -d database_name -f file.sql
psql -U postgres -d contry -f file.sql

Для загрузки базы данных PostgreSQL в dump-формате
pg_restore -U postgres -d airport -v airportdemo.dump

Для выгрузки базы данных PostgreSQL в SQL-формате (дамп) на компьютер.
pg_dump -U postgres -d database_name -f C:\DiSK\file.sql

В PostgreSQL переименовать базу данных можно с помощью команды:
ALTER DATABASE my_database RENAME TO new_database;


### 

хотите узнать список баз данных, выполните:
\l 
\l+

Подключение к базе данных
\c database_name

посмотреть список таблиц в текущей базе данных PostgreSQL
\dt

какие схемы есть в базе данных
\dn

Чтобы узнать, какая схема используется по умолчанию:
SHOW search_path;

Подключиться к другой схеме:
SET search_path TO hr_poc;


### 1. Создание базы данных

CREATE DATABASE database_name;

**Пример**:

CREATE DATABASE company;


### 2. Подключение к базе данных

\c database_name

**Пример**:

\c company


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

Чтобы добавить несколько строк данных в таблицу PostgreSQL за один запрос, используйте конструкцию `INSERT INTO`, перечисляя значения каждой строки через запятую. 
**Пример**:

INSERT INTO таблица (колонка1, колонка2, колонка3)
VALUES
    (значение1_1, значение1_2, значение1_3),
    (значение2_1, значение2_2, значение2_3),
    (значение3_1, значение3_2, значение3_3);

Конечно, вот пример. Допустим, у нас есть таблица `employees` с колонками `id`, `name` и `age`:

Теперь добавим несколько строк данных в эту таблицу:

INSERT INTO employees (name, salary, department_id)
VALUES
    ('Alice Blong', 3000.00, 2),
    ('Bob Hanigan', 2500.00, 3),
    ('Charlie Sugon', 3500, 4);


Этот запрос добавит три строки в таблицу `employees` с данными для каждого сотрудника.
Это позволяет вставить несколько строк за один запрос, что эффективно с точки зрения производительности.

### 6. Чтобы получить все данные из таблицы базы данных, используется SQL-запрос:

SELECT * FROM table_name;


### Объяснение:
- **`SELECT`** — команда для извлечения данных.  
- **`*`** — выбор всех колонок.  
- **`table_name`** — имя таблицы, из которой нужно извлечь данные.

Например, если таблица называется `employees`:

SELECT * FROM employees;

