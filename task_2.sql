-- task_2.sql
-- Create all tables in alx_book_store database

-- Create database if it does not exist
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- Create Authors table
CREATE TABLE IF NOT EXISTS Authors (
    Author_id INT AUTO_INCREMENT PRIMARY KEY,
    First_name VARCHAR(50) NOT NULL,
    Last_name VARCHAR(50) NOT NULL,
    Birth_date DATE,
    Country VARCHAR(50)
);

-- Create Books table
CREATE TABLE IF NOT EXISTS Books (
    Book_id INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Author_id INT NOT NULL,
    Genre VARCHAR(50),
    Price DECIMAL(10,2) NOT NULL,
    Published_date DATE,
    FOREIGN KEY (Author_id) REFERENCES Authors(Author_id) ON DELETE CASCADE
);

-- Create Customers table
CREATE TABLE IF NOT EXISTS Customers (
    Customer_id INT AUTO_INCREMENT PRIMARY KEY,
    First_name VARCHAR(50) NOT NULL,
    Last_name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    Address VARCHAR(255)
);

-- Create Orders table
CREATE TABLE IF NOT EXISTS Orders (
    Order_id INT AUTO_INCREMENT PRIMARY KEY,
    Customer_id INT NOT NULL,
    Order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    Total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id) ON DELETE CASCADE
);

-- Create Order_Details table
CREATE TABLE IF NOT EXISTS Order_Details (
    Order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    Order_id INT NOT NULL,
    Book_id INT NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (Order_id) REFERENCES Orders(Order_id) ON DELETE CASCADE,
    FOREIGN KEY (Book_id) REFERENCES Books(Book_id) ON DELETE CASCADE
);
