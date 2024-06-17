
# Expense Tracker Database Setup and Data Analysis

## Table of Contents

1. [Database Schema Setup](#database-schema-setup)
2. [Loading Data from CSV Files](#loading-data-from-csv-files)
3. [Verifying Data Load](#verifying-data-load)
4. [Complex SQL Queries](#complex-sql-queries)

## Database Schema Setup (Since the new schema update will include the setup and the loading data from CSV files, please ignore these first 2 steps.)

To create the necessary tables for the Expense Tracker database, follow these steps:

1. Open MySQL Workbench and connect to your MySQL server.
2. Open a new SQL tab.
3. Copy and paste the following schema creation script into the SQL tab.
4. Execute the script by clicking the lightning bolt icon or pressing `Ctrl + Shift + Enter`.

```sql
-- Drop tables if they exist
DROP TABLE IF EXISTS Expenses;
DROP TABLE IF EXISTS Income;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS PaymentType;
DROP TABLE IF EXISTS Place;
DROP TABLE IF EXISTS Emotions;

-- Create Users table
CREATE TABLE IF NOT EXISTS Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(80) NOT NULL UNIQUE,
    password VARCHAR(120) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE
);

-- Create Categories table
CREATE TABLE IF NOT EXISTS Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(80) NOT NULL UNIQUE
);

-- Create PaymentType table
CREATE TABLE IF NOT EXISTS PaymentType (
    payment_type_id INT AUTO_INCREMENT PRIMARY KEY,
    payment_method VARCHAR(80) NOT NULL UNIQUE
);

-- Create Place table
CREATE TABLE IF NOT EXISTS Place (
    place_id INT AUTO_INCREMENT PRIMARY KEY,
    place_name VARCHAR(80) NOT NULL UNIQUE,
    place_type VARCHAR(80) NOT NULL
);

-- Create Emotions table
CREATE TABLE IF NOT EXISTS Emotions (
    emotion_id INT AUTO_INCREMENT PRIMARY KEY,
    emotion_name VARCHAR(80) NOT NULL UNIQUE
);

-- Create Income table
CREATE TABLE IF NOT EXISTS Income (
    income_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    source VARCHAR(100),
    date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Create Expenses table
CREATE TABLE IF NOT EXISTS Expenses (
    expense_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    category_id INT,
    place_id INT,
    payment_type_id INT,
    emotion_id INT,
    description VARCHAR(200),
    date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    FOREIGN KEY (place_id) REFERENCES Place(place_id),
    FOREIGN KEY (payment_type_id) REFERENCES PaymentType(payment_type_id),
    FOREIGN KEY (emotion_id) REFERENCES Emotions(emotion_id)
);
```

## Loading Data from CSV Files

To load data into the tables from CSV files, follow these steps:

Ensure your CSV files are correctly formatted and saved with LF (Line Feed) line endings.
Place your CSV files in the directory C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/.
Use the following commands to load the data into the tables:

## Truncate Tables (if necessary)

```sql
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Income;
TRUNCATE TABLE Expenses;
TRUNCATE TABLE Users;
TRUNCATE TABLE Categories;
TRUNCATE TABLE PaymentType;
TRUNCATE TABLE Place;
TRUNCATE TABLE Emotions;
SET FOREIGN_KEY_CHECKS = 1;

```

## Load Data Commands

```sql
-- Load data into Users table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/users.csv'
INTO TABLE Users
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(username, password, email);

-- Load data into Categories table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/categories.csv'
INTO TABLE Categories
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(category_name);

-- Load data into PaymentType table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/payment_type.csv'
INTO TABLE PaymentType
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(payment_method);

-- Load data into Place table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/place.csv'
INTO TABLE Place
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(place_name, place_type);

-- Load data into Emotions table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/emotions.csv'
INTO TABLE Emotions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(emotion_name);

-- Load data into Income table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/income.csv'
INTO TABLE Income
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(user_id, amount, source, date);

-- Load data into Expenses table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/expenses.csv'
INTO TABLE Expenses
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(user_id, amount, category_id, place_id, payment_type_id, emotion_id, description, date);

```

## Verifying Data Load
To verify that the data has been loaded correctly, run the following SELECT queries for each table:

```sql
-- Verify Users table
SELECT * FROM Users;

-- Verify Categories table
SELECT * FROM Categories;

-- Verify PaymentType table
SELECT * FROM PaymentType;

-- Verify Place table
SELECT * FROM Place;

-- Verify Emotions table
SELECT * FROM Emotions;

-- Verify Income table
SELECT * FROM Income;

-- Verify Expenses table
SELECT * FROM Expenses;

```
## Complex SQL Queries
Here are some complex SQL queries to analyze the data:

1. Aggregating Expenses by Categories and Months
```sql

SELECT
    c.category_name,
    DATE_FORMAT(e.date, '%Y-%m') AS month,
    SUM(e.amount) AS total_expense
FROM
    Expenses e
JOIN
    Categories c ON e.category_id = c.category_id
GROUP BY
    c.category_name, month
ORDER BY
    month, c.category_name;
```

2. Calculating the Average Expense per User
```sql
SELECT
    u.username,
    AVG(e.amount) AS avg_expense
FROM
    Expenses e
JOIN
    Users u ON e.user_id = u.user_id
GROUP BY
    u.username;
```

3.  Calculate the Percentage of Total Income Spent
```sql
SELECT
    u.username,
    SUM(e.amount) AS total_expenses,
    SUM(i.amount) AS total_income,
    (SUM(e.amount) / SUM(i.amount)) * 100 AS percentage_spent
FROM
    Users u
LEFT JOIN
    Expenses e ON u.user_id = e.user_id
LEFT JOIN
    Income i ON u.user_id = i.user_id
GROUP BY
    u.username;

```
