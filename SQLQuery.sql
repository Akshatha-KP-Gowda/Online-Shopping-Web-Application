CREATE TABLE Products
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    ImagePath VARCHAR(255) NOT NULL
);

INSERT INTO Products (ProductName, Category, Price, ImagePath)
VALUES
('Laptop', 'Electronics', 55000.00, 'Images/laptop.jpg'),
('Smartphone', 'Electronics', 25000.00, 'Images/mobile.jpg'),
('Men T-Shirt', 'Clothes', 799.00, 'Images/tshirt.jpg'),
('Women Kurti', 'Clothes', 1299.00, 'Images/kurti.jpg'),
('Study Table', 'Furniture', 6500.00, 'Images/table.jpg'),
('Wooden Chair', 'Furniture', 3500.00, 'Images/chair.jpg'),
('School Bag', 'Accessories', 1200.00, 'Images/bag.jpg'),
('Watch', 'Accessories', 3500.00, 'Images/watch.jpg'),
('Sports Shoes', 'Footwear', 2499.00, 'Images/shoes.jpg'),
('Flip Flops', 'Footwear', 499.00, 'Images/flipflops.jpg');
Drop table Products
CREATE TABLE Products
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    ImagePath VARCHAR(255) NOT NULL
);
Select * from Products
INSERT INTO Products (ProductName, Category, Price, ImagePath)
VALUES
('Laptop', 'Electronics', 55000.00, 'Images/laptop.jpg'),
('Smartphone', 'Electronics', 25000.00, 'Images/mobile.jpg'),
('Headphones', 'Electronics', 1999.00, 'Images/headphones.jpg'),

('Men T-Shirt', 'Clothes', 799.00, 'Images/tshirt.jpg'),
('Women Kurti', 'Clothes', 1299.00, 'Images/kurti.jpg'),
('Jeans', 'Clothes', 1499.00, 'Images/jeans.jpg'),

('Study Table', 'Furniture', 6500.00, 'Images/table.jpg'),
('Wooden Chair', 'Furniture', 3500.00, 'Images/chair.jpg'),
('Sofa', 'Furniture', 22000.00, 'Images/sofa.jpg'),

('School Bag', 'Accessories', 1200.00, 'Images/bag.jpg'),
('Watch', 'Accessories', 3500.00, 'Images/watch.jpg'),
('Sunglasses', 'Accessories', 999.00, 'Images/sunglasses.jpg'),

('Sports Shoes', 'Footwear', 2499.00, 'Images/shoes.jpg'),
('Flip Flops', 'Footwear', 499.00, 'Images/flipflops.jpg'),
('Sandals', 'Footwear', 899.00, 'Images/sandals.jpg');
SELECT ImagePath FROM Products;
SELECT ProductName, ImagePath FROM Products;
SELECT * FROM Products
WHERE Category = 'Electronics';
SELECT ProductName, ImagePath FROM Products;
CREATE TABLE Users
(
    UserId INT IDENTITY(1,1) PRIMARY KEY,
    Email VARCHAR(100) NOT NULL,
    Password VARCHAR(50) NOT NULL
);
select * from Users