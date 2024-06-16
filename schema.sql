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
