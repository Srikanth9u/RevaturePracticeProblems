--Complete the queries below to insert data into the tables & retrieving the first records from the tables: Orders, OrderDetails & Payment

-- Customers
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address, City, Region, Country, PostalCode) VALUES
(1, 'Alice', 'Smith', 'alice.smith@email.com', '555-123-4567', '123 Main St', 'Anytown', 'CA', 'USA', '90210'),
(2, 'Bob', 'Johnson', 'bob.johnson@email.com', '555-987-6543', '456 Oak Ave', 'Springfield', 'IL', 'USA', '62704'),
(3, 'Charlie', 'Brown', 'charlie.brown@email.com', '555-555-1212', '789 Pine Ln', 'Hill Valley', 'CA', 'USA', '90302'),
(4, 'Diana', 'Miller', 'diana.miller@email.com', '555-111-2222', '10 Downing St', 'London', NULL, 'UK', 'SW1A 2AA'),
(5, 'Eve', 'Davis', 'eve.davis@email.com', '555-333-4444', '5 Champs-Élysées', 'Paris', NULL, 'France', '75008');

-- Products
INSERT INTO Products (ProductID, ProductName, Description, CategoryID, Price, StockQuantity) VALUES
(1, 'Laptop', 'High-performance laptop for professionals', 1, 1200.00, 10),
(2, 'Smartphone', 'Latest model smartphone with advanced features', 1, 800.00, 20),
(3, 'Wireless Mouse', 'Ergonomic wireless mouse for comfortable use', 2, 25.00, 50),
(4, 'Keyboard', 'Mechanical keyboard for gamers', 2, 75.00, 30),
(5, '4K Monitor', '27-inch 4K monitor for stunning visuals', 1, 400.00, 15);

-- Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, ShippingAddress, OrderStatus) VALUES
(1, 1, '2023-01-15', '123 Main St, Anytown, CA', 'Delivered'),
(2, 2, '2023-02-20', '456 Oak Ave, Springfield, IL', 'Shipped'),
(3, 1, '2023-03-10', '123 Main St, Anytown, CA', 'Delivered'),
(4, 3, '2023-04-05', '789 Pine Ln, Hill Valley, CA', 'Pending'),
(5, 4, '2023-05-01', '10 Downing St, London, UK', 'Cancelled');

-- OrderDetails
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 1, 1200.00),
(2, 1, 3, 1, 25.00),
(3, 2, 2, 1, 800.00),
(4, 3, 1, 1, 1200.00),
(5, 4, 4, 2, 75.00);

-- Payments
INSERT INTO Payments (PaymentID, OrderID, PaymentDate, Amount, PaymentMethod, TransactionID) VALUES
(1, 1, '2023-01-15', 1225.00, 'Credit Card', 'TXN12345'),
(2, 2, '2023-02-20', 800.00, 'PayPal', 'TXN67890'),
(3, 3, '2023-03-10', 1200.00, 'Credit Card', 'TXN24680'),
(4, 4, '2023-04-05', 150.00, 'Credit Card', 'TXN13579'),
(5, 5, '2023-05-01', 0.00, 'Credit Card', 'TXN86420'); -- Example: Payment of 0 for a cancelled order

-- Shipping
INSERT INTO Shipping (ShippingID, OrderID, ShippingDate, TrackingNumber, Shipper, DeliveryDate, ShippingCost) VALUES
(1, 1, '2023-01-16', 'UPS12345', 'UPS', '2023-01-18', 10.00),
(2, 2, '2023-02-21', 'FEDEX67890', 'FedEx', NULL, 12.50),
(3, 3, '2023-03-11', 'USPS24680', 'USPS', '2023-03-13', 7.50),
(4, 4, '2023-04-06', 'DHL13579', 'DHL', NULL, 15.00),
(5, 5, '2023-05-02', 'DHL86420', 'DHL', NULL, 15.00);

-- Categories
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES
(1, 'Electronics', 'Electronic devices and accessories'),
(2, 'Computer Accessories', 'Accessories for computers');

--Now write the queries for retrieving the first records from the tables: Orders, OrderDetails & Payment

select * from Orders limit 1;
select * from OrderDetails limit 1;
select * from Payments limit 1;