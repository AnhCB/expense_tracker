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

-- Load data into Users table first to ensure user_id values exist for foreign keys
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

-- Indexes
CREATE INDEX idx_date ON Expenses(date);
CREATE INDEX idx_category_id ON Expenses(category_id);
CREATE INDEX idx_income_user_id ON Income(user_id);

-- Drop existing users if they exist
DROP USER IF EXISTS 'readonly'@'localhost';
DROP USER IF EXISTS 'admin'@'localhost';

-- Create a read-only user
CREATE USER 'readonly'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT ON expense_tracker.* TO 'readonly'@'localhost';

-- Create an admin user with full privileges
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'adminpassword';
GRANT ALL PRIVILEGES ON expense_tracker.* TO 'admin'@'localhost';

-- Drop existing views if they exist
DROP VIEW IF EXISTS UserExpenses;
DROP VIEW IF EXISTS UserIncome;

-- Create views to simplify complex queries
CREATE VIEW UserExpenses AS
SELECT u.username, e.amount, e.date, c.category_name, p.place_name, pt.payment_method, em.emotion_name 
FROM Users u 
JOIN Expenses e ON u.user_id = e.user_id
JOIN Categories c ON e.category_id = c.category_id
JOIN Place p ON e.place_id = p.place_id
JOIN PaymentType pt ON e.payment_type_id = pt.payment_type_id
JOIN Emotions em ON e.emotion_id = em.emotion_id;

CREATE VIEW UserIncome AS
SELECT u.username, i.amount, i.date, i.source 
FROM Users u 
JOIN Income i ON u.user_id = i.user_id;

-- Sample Transaction for expense insertion ensuring data integrity
START TRANSACTION;
INSERT INTO Expenses (user_id, amount, category_id, place_id, payment_type_id, emotion_id, description, date)
VALUES (1, 150.00, 1, 1, 1, 1, 'Groceries shopping', '2023-06-01');
COMMIT;
