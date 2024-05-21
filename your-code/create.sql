CREATE DATABASE IF NOT EXISTS mysql_lab;
USE mysql_lab;

-- Drop tables if they exist to start fresh
DROP TABLE IF EXISTS Invoice_Cars;
DROP TABLE IF EXISTS Invoices;
DROP TABLE IF EXISTS Salesperson;
DROP TABLE IF EXISTS Cars;
DROP TABLE IF EXISTS Customers;

-- Create Customers table with updated PhoneNumber length
CREATE TABLE IF NOT EXISTS Customers (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID VARCHAR(10) UNIQUE,
    Name VARCHAR(50),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(50),
    Address VARCHAR(100),
    City VARCHAR(50),
    StateProvince VARCHAR(50),
    Country VARCHAR(50),
    ZipPostalCode VARCHAR(10)
);

-- Create Cars table
CREATE TABLE IF NOT EXISTS Cars (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(50) UNIQUE,
    Manufacturer VARCHAR(50),
    Model VARCHAR(50),
    Year YEAR,
    Color VARCHAR(20)
);

-- Create Salesperson table
CREATE TABLE IF NOT EXISTS Salesperson (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    StaffID VARCHAR(10) UNIQUE,
    Name VARCHAR(50),
    Store VARCHAR(50)
);

-- Create Invoices table
CREATE TABLE IF NOT EXISTS Invoices (
    InvoiceID INT AUTO_INCREMENT PRIMARY KEY,
    InvoiceNumber VARCHAR(50) UNIQUE,
    Date DATE,
    Customer_ID INT,
    Salesperson_ID INT,
    FOREIGN KEY (Customer_ID) REFERENCES Customers(ID),
    FOREIGN KEY (Salesperson_ID) REFERENCES Salesperson(ID)
);

-- Create Invoice_Cars junction table
/*Invoice_Cars Table (junction table for many-to-many relationship between Invoices and Cars):
	-Handles the relationship between invoices and cars.
	-Allows an invoice to include multiple cars and a car to be associated with multiple invoices (in case of returns, leasing, etc., although typically, a car is sold only once).*/
CREATE TABLE IF NOT EXISTS Invoice_Cars (
    InvoiceID INT,
    Car_ID INT,
    PRIMARY KEY (InvoiceID, Car_ID),
    FOREIGN KEY (InvoiceID) REFERENCES Invoices(InvoiceID),
    FOREIGN KEY (Car_ID) REFERENCES Cars(ID)
);
