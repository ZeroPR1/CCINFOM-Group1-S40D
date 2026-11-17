CREATE DATABASE IF NOT EXISTS media_store_db;
USE media_store_db;

CREATE TABLE CUSTOMER (
    customerNum VARCHAR(10) PRIMARY KEY,
    customerLName VARCHAR(50) NOT NULL,
    customerFName VARCHAR(50) NOT NULL,
    customerEmail VARCHAR(100),
    customerRegisterDate DATE
);

CREATE TABLE STAFF (
    staffID VARCHAR(10) PRIMARY KEY,
    staffLName VARCHAR(50) NOT NULL,
    staffFName VARCHAR(50) NOT NULL,
    staffRole VARCHAR(30),
    staffDateHired DATE,
    staffStatus VARCHAR(20)
);

CREATE TABLE PRODUCT (
    productCode VARCHAR(10) PRIMARY KEY,
    productTitle VARCHAR(255) NOT NULL,
    productCreator VARCHAR(100),
    productFormat VARCHAR(30),
    productCategory VARCHAR(30),
    productGenre VARCHAR(50),
    productRuntime INT,
    productStock INT DEFAULT 0,
    productPrice DECIMAL(10,2) NOT NULL
);

CREATE TABLE SALES (
    saleID VARCHAR(10) PRIMARY KEY,
    salePurchaseDate DATETIME NOT NULL,
    saleDiscount DECIMAL(5,2) DEFAULT 0.00,
    customerNum VARCHAR(10),
    staffID VARCHAR(10),
    FOREIGN KEY (customerNum) REFERENCES CUSTOMER(customerNum),
    FOREIGN KEY (staffID) REFERENCES STAFF(staffID)
);

CREATE TABLE SALES_LINE_ITEM (
    saleID VARCHAR(10),
    productCode VARCHAR(10),
    saleQuantity INT NOT NULL,
    PRIMARY KEY (saleID, productCode),
    FOREIGN KEY (saleID) REFERENCES SALES(saleID),
    FOREIGN KEY (productCode) REFERENCES PRODUCT(productCode)
);