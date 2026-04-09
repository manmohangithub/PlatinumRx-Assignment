-- Clinic Schema Setup

CREATE TABLE clinics (
 cid VARCHAR(50) PRIMARY KEY,
 clinic_name VARCHAR(100),
 city VARCHAR(100),
 state VARCHAR(100),
 country VARCHAR(100)
);

CREATE TABLE customer (
 uid VARCHAR(50) PRIMARY KEY,
 name VARCHAR(100),
 mobile VARCHAR(15)
);

CREATE TABLE clinic_sales (
 oid VARCHAR(50) PRIMARY KEY,
 uid VARCHAR(50),
 cid VARCHAR(50),
 amount DECIMAL(10,2),
 datetime DATETIME,
 sales_channel VARCHAR(50)
);

CREATE TABLE expenses (
 eid VARCHAR(50) PRIMARY KEY,
 cid VARCHAR(50),
 description TEXT,
 amount DECIMAL(10,2),
 datetime DATETIME
);
