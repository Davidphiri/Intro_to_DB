-- Create the database
CREATE DATABASE alx_book_store;

-- Use the newly created database
USE alx_book_store;

-- Create the Authors table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- Create the Books table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    price DOUBLE NOT NULL,
    publication_date DATE NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Create the Customers table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    address TEXT NOT NULL
);

-- Create the Orders table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create the Order_Details table
CREATE TABLE Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Add sample data (optional)

-- Insert authors
INSERT INTO Authors (author_name) VALUES ('J.K. Rowling'), ('George Orwell'), ('J.R.R. Tolkien');

-- Insert books
INSERT INTO Books (title, author_id, price, publication_date) VALUES 
('Harry Potter and the Sorcerer\'s Stone', 1, 19.99, '1997-06-26'),
('1984', 2, 14.99, '1949-06-08'),
('The Hobbit', 3, 25.50, '1937-09-21');

-- Insert customers
INSERT INTO Customers (customer_name, email, address) VALUES 
('Alice Johnson', 'alice.johnson@example.com', '123 Main St, Anytown, USA'),
('Bob Smith', 'bob.smith@example.com', '456 Oak St, Somewhere, USA');

-- Insert orders
INSERT INTO Orders (customer_id, order_date) VALUES 
(1, '2025-01-10'), 
(2, '2025-01-11');

-- Insert order details
INSERT INTO Order_Details (order_id, book_id, 
