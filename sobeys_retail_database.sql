-- Create Store Table(Emmanuel Chijioke)--
CREATE TABLE Store (
    Store_ID INT NOT NULL,
    Manager_ID INT NOT NULL,
    Store_Name VARCHAR(50) NOT NULL,
    Location VARCHAR(50) NOT NULL,
    Opening_Date DATE NOT NULL,
    Store_Type VARCHAR(30) NOT NULL
);

-- Create Supplier Table(Joseph Nguyen)--
CREATE TABLE Supplier (
    Supplier_ID INT NOT NULL,
    Store_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Supplier_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    Contact_Number NUMBER(10,0) NOT NULL
);

-- Create Product Table(Alif Hossain)--
CREATE TABLE Product (
    Product_ID INT NOT NULL,
    Supplier_ID INT NOT NULL,
    Product_Name VARCHAR(50) NOT NULL,
    Category VARCHAR(30) NOT NULL,
    Price DECIMAL(8,2) NOT NULL,
    Stock_Quantity INT NOT NULL
);

-- Create Customers Table(Joseph Nguyen)
CREATE TABLE Customers (
    Customer_ID INT NOT NULL,
    Store_ID INT NOT NULL,
    Loyalty_Point INT NOT NULL,
    First_Name VARCHAR(30) NOT NULL,
    Last_Name VARCHAR(30) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Phone_Number NUMBER(10,0) NOT NULL
);

-- Create Employees Table (Alif Hossain)--
CREATE TABLE Employees (
    Employee_ID INT NOT NULL,
    Store_ID INT NOT NULL,
    First_Name VARCHAR(30) NOT NULL,
    Last_Name VARCHAR(30) NOT NULL,
    Position VARCHAR(30) NOT NULL,
    Salary DECIMAL(8,2) NOT NULL
);

-- Create Orders Table(Emmanuel Chijioke)--
CREATE TABLE Orders (
    Order_ID INT NOT NULL,
    Customer_ID INT NOT NULL,
    Store_ID INT NOT NULL,
    Order_Date DATE NOT NULL,
    Total_Amount DECIMAL(8,2) NOT NULL
);

-- Add Primary Keys
ALTER TABLE Store ADD CONSTRAINT PK_Store PRIMARY KEY (Store_ID);
ALTER TABLE Supplier ADD CONSTRAINT PK_Supplier PRIMARY KEY (Supplier_ID);
ALTER TABLE Product ADD CONSTRAINT PK_Product PRIMARY KEY (Product_ID);
ALTER TABLE Customers ADD CONSTRAINT PK_Customers PRIMARY KEY (Customer_ID);
ALTER TABLE Employees ADD CONSTRAINT PK_Employees PRIMARY KEY (Employee_ID);
ALTER TABLE Orders ADD CONSTRAINT PK_Orders PRIMARY KEY (Order_ID);

-- Add Foreign Keys
ALTER TABLE Store 
ADD CONSTRAINT FK_STORE_MANAGER 
FOREIGN KEY (Manager_ID) REFERENCES Employees(Employee_ID) 
ON DELETE SET NULL;
ALTER TABLE Supplier ADD CONSTRAINT FK_Supplier_Store FOREIGN KEY (Store_ID) REFERENCES Store(Store_ID) ON DELETE CASCADE;
ALTER TABLE Supplier ADD CONSTRAINT FK_Supplier_Product FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID) ON DELETE CASCADE;
ALTER TABLE Product ADD CONSTRAINT FK_Product_Supplier FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID) ON DELETE CASCADE;
ALTER TABLE Customers ADD CONSTRAINT FK_Customers_Store FOREIGN KEY (Store_ID) REFERENCES Store(Store_ID) ON DELETE CASCADE;
ALTER TABLE Employees ADD CONSTRAINT FK_Employees_Store FOREIGN KEY (Store_ID) REFERENCES Store(Store_ID) ON DELETE CASCADE;
ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Customer FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID) ON DELETE CASCADE;
ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Store FOREIGN KEY (Store_ID) REFERENCES Store(Store_ID) ON DELETE CASCADE;

-- Add Unique Constraints
ALTER TABLE Supplier ADD CONSTRAINT UQ_Supplier_Email UNIQUE (Email);
ALTER TABLE Customers ADD CONSTRAINT UQ_Customers_Email UNIQUE (Email);

-- Add Check Constraints
ALTER TABLE Supplier ADD CONSTRAINT CHK_Contact_Number CHECK (Contact_Number BETWEEN 1000000000 AND 9999999999);
ALTER TABLE Customers ADD CONSTRAINT CHK_Phone_Number CHECK (Phone_Number BETWEEN 1000000000 AND 9999999999);
ALTER TABLE Customers ADD CONSTRAINT CHK_Loyalty_Points CHECK (Loyalty_Point >= 0);
ALTER TABLE Product ADD CONSTRAINT CHK_Product_Price CHECK (Price >= 0);
ALTER TABLE Product ADD CONSTRAINT CHK_Product_Stock CHECK (Stock_Quantity >= 0);
ALTER TABLE Employees ADD CONSTRAINT CHK_Employee_Salary CHECK (Salary >= 1000);
ALTER TABLE Orders ADD CONSTRAINT CHK_Orders_Amount CHECK (Total_Amount >= 0);


--Store rows (Emmanuel Chijioke)--
INSERT INTO Store (Store_ID, Manager_ID, Store_Name, Location, Opening_Date, Store_Type) VALUES
(1, NULL, 'SuperMart', 'New York', TO_DATE('2023-01-10', 'YYYY-MM-DD'), 'Retail');

INSERT INTO Store (Store_ID, Manager_ID, Store_Name, Location, Opening_Date, Store_Type) 
VALUES (2, NULL, 'MegaStore', 'Los Angeles', TO_DATE('2022-05-15', 'YYYY-MM-DD'), 'Wholesale');

INSERT INTO Store (Store_ID, Manager_ID, Store_Name, Location, Opening_Date, Store_Type) 
VALUES (3, NULL, 'QuickBuy', 'Chicago', TO_DATE('2023-03-20', 'YYYY-MM-DD'), 'Retail');

INSERT INTO Store (Store_ID, Manager_ID, Store_Name, Location, Opening_Date, Store_Type) 
VALUES (4, NULL, 'DailyNeeds', 'Houston', TO_DATE('2022-09-12', 'YYYY-MM-DD'), 'Convenience');

INSERT INTO Store (Store_ID, Manager_ID, Store_Name, Location, Opening_Date, Store_Type) 
VALUES (5, NULL, 'DiscountHub', 'Miami', TO_DATE('2021-11-05', 'YYYY-MM-DD'), 'Discount');

INSERT INTO Store (Store_ID, Manager_ID, Store_Name, Location, Opening_Date, Store_Type) 
VALUES (6, NULL, 'CityMart', 'Dallas', TO_DATE('2022-08-30', 'YYYY-MM-DD'), 'Retail');

INSERT INTO Store (Store_ID, Manager_ID, Store_Name, Location, Opening_Date, Store_Type) 
VALUES (7, NULL, 'FreshMarket', 'Phoenix', TO_DATE('2023-01-05', 'YYYY-MM-DD'), 'Grocery');

INSERT INTO Store (Store_ID, Manager_ID, Store_Name, Location, Opening_Date, Store_Type) 
VALUES (8, NULL, 'BuyMore', 'San Diego', TO_DATE('2021-07-14', 'YYYY-MM-DD'), 'Retail');

INSERT INTO Store (Store_ID, Manager_ID, Store_Name, Location, Opening_Date, Store_Type) 
VALUES (9, NULL, 'SmartShop', 'San Jose', TO_DATE('2022-11-23', 'YYYY-MM-DD'), 'Supermarket');

INSERT INTO Store (Store_ID, Manager_ID, Store_Name, Location, Opening_Date, Store_Type) 
VALUES (10, NULL, 'ValueStore', 'Austin', TO_DATE('2023-02-18', 'YYYY-MM-DD'), 'Discount');

INSERT INTO Store (Store_ID, Manager_ID, Store_Name, Location, Opening_Date, Store_Type) 
VALUES (11, NULL, 'QuickMart', 'Seattle', TO_DATE('2022-06-10', 'YYYY-MM-DD'), 'Retail');

INSERT INTO Store (Store_ID, Manager_ID, Store_Name, Location, Opening_Date, Store_Type) 
VALUES (12, NULL, 'EverydayShop', 'Denver', TO_DATE('2021-04-07', 'YYYY-MM-DD'), 'Convenience');

INSERT INTO Store (Store_ID, Manager_ID, Store_Name, Location, Opening_Date, Store_Type) 
VALUES (13, NULL, 'GiantMart', 'Boston', TO_DATE('2022-09-20', 'YYYY-MM-DD'), 'Wholesale');

INSERT INTO Store (Store_ID, Manager_ID, Store_Name, Location, Opening_Date, Store_Type) 
VALUES (14, NULL, 'ExpressShop', 'Las Vegas', TO_DATE('2023-03-05', 'YYYY-MM-DD'), 'Retail');

INSERT INTO Store (Store_ID, Manager_ID, Store_Name, Location, Opening_Date, Store_Type) 
VALUES (15, NULL, 'EasyBuy', 'San Antonio', TO_DATE('2022-08-15', 'YYYY-MM-DD'), 'Grocery');

INSERT INTO Store (Store_ID, Manager_ID, Store_Name, Location, Opening_Date, Store_Type) 
VALUES (16, NULL, 'BudgetMart', 'Philadelphia', TO_DATE('2021-12-01', 'YYYY-MM-DD'), 'Discount');

INSERT INTO Store (Store_ID, Manager_ID, Store_Name, Location, Opening_Date, Store_Type) 
VALUES (17, NULL, 'SuperSave', 'Columbus', TO_DATE('2023-01-25', 'YYYY-MM-DD'), 'Retail');

INSERT INTO Store (Store_ID, Manager_ID, Store_Name, Location, Opening_Date, Store_Type) 
VALUES (18, NULL, 'FastMart', 'Charlotte', TO_DATE('2022-07-09', 'YYYY-MM-DD'), 'Convenience');

INSERT INTO Store (Store_ID, Manager_ID, Store_Name, Location, Opening_Date, Store_Type) 
VALUES (19, NULL, 'BigDeals', 'Detroit', TO_DATE('2023-02-12', 'YYYY-MM-DD'), 'Discount');

INSERT INTO Store (Store_ID, Manager_ID, Store_Name, Location, Opening_Date, Store_Type) 
VALUES (20, NULL, 'MetroStore', 'Indianapolis', TO_DATE('2021-10-30', 'YYYY-MM-DD'), 'Supermarket');


--Employee Rows (Alif Hossain)--
INSERT INTO Employees (Employee_ID, Store_ID, First_Name, Last_Name, Position, Salary) 
VALUES (101, 1, 'Alice', 'Johnson', 'Manager', 5000.00);

INSERT INTO Employees (Employee_ID, Store_ID, First_Name, Last_Name, Position, Salary) 
VALUES (102, 2, 'Bob', 'Smith', 'Manager', 5200.00);

INSERT INTO Employees (Employee_ID, Store_ID, First_Name, Last_Name, Position, Salary) 
VALUES (103, 3, 'Charlie', 'Brown', 'Cashier', 2800.00);

INSERT INTO Employees (Employee_ID, Store_ID, First_Name, Last_Name, Position, Salary) 
VALUES (104, 4, 'David', 'Williams', 'Stock Clerk', 3000.00);

INSERT INTO Employees (Employee_ID, Store_ID, First_Name, Last_Name, Position, Salary) 
VALUES (105, 5, 'Eve', 'Davis', 'Customer Service', 3200.00);

INSERT INTO Employees (Employee_ID, Store_ID, First_Name, Last_Name, Position, Salary) 
VALUES (106, 6, 'Frank', 'Miller', 'Sales Associate', 2900.00);

INSERT INTO Employees (Employee_ID, Store_ID, First_Name, Last_Name, Position, Salary) 
VALUES (107, 7, 'Grace', 'Wilson', 'Inventory Manager', 4000.00);

INSERT INTO Employees (Employee_ID, Store_ID, First_Name, Last_Name, Position, Salary) 
VALUES (108, 8, 'Hannah', 'Moore', 'Cashier', 2700.00);

INSERT INTO Employees (Employee_ID, Store_ID, First_Name, Last_Name, Position, Salary) 
VALUES (109, 9, 'Isaac', 'Taylor', 'Stock Clerk', 2950.00);

INSERT INTO Employees (Employee_ID, Store_ID, First_Name, Last_Name, Position, Salary) 
VALUES (110, 10, 'Jack', 'White', 'Customer Service', 3100.00);

INSERT INTO Employees (Employee_ID, Store_ID, First_Name, Last_Name, Position, Salary) 
VALUES (111, 11, 'Karen', 'Harris', 'Inventory Manager', 4100.00);

INSERT INTO Employees (Employee_ID, Store_ID, First_Name, Last_Name, Position, Salary) 
VALUES (112, 12, 'Leo', 'Martin', 'Sales Associate', 2850.00);

INSERT INTO Employees (Employee_ID, Store_ID, First_Name, Last_Name, Position, Salary) 
VALUES (113, 13, 'Mia', 'Clark', 'Cashier', 2750.00);

INSERT INTO Employees (Employee_ID, Store_ID, First_Name, Last_Name, Position, Salary) 
VALUES (114, 14, 'Nathan', 'Walker', 'Stock Clerk', 2980.00);

INSERT INTO Employees (Employee_ID, Store_ID, First_Name, Last_Name, Position, Salary) 
VALUES (115, 15, 'Olivia', 'Lewis', 'Customer Service', 3150.00);

INSERT INTO Employees (Employee_ID, Store_ID, First_Name, Last_Name, Position, Salary) 
VALUES (116, 16, 'Paul', 'Scott', 'Inventory Manager', 4100.00);

INSERT INTO Employees (Employee_ID, Store_ID, First_Name, Last_Name, Position, Salary) 
VALUES (117, 17, 'Quinn', 'Young', 'Sales Associate', 2900.00);

INSERT INTO Employees (Employee_ID, Store_ID, First_Name, Last_Name, Position, Salary) 
VALUES (118, 18, 'Rachel', 'King', 'Cashier', 2700.00);

INSERT INTO Employees (Employee_ID, Store_ID, First_Name, Last_Name, Position, Salary) 
VALUES (119, 19, 'Sam', 'Green', 'Stock Clerk', 3000.00);

INSERT INTO Employees (Employee_ID, Store_ID, First_Name, Last_Name, Position, Salary) 
VALUES (120, 20, 'Tina', 'Adams', 'Customer Service', 3200.00);

UPDATE Store SET Manager_ID = 101 WHERE Store_ID = 1;
UPDATE Store SET Manager_ID = 102 WHERE Store_ID = 2;

ALTER TABLE Supplier MODIFY Product_ID INT NULL;

--Supplier rows (Joseph Nguyen)--
INSERT INTO Supplier (Supplier_ID, Store_ID, Product_ID, Supplier_Name, Email, Address, Contact_Number) 
VALUES (1, 1, NULL, 'FreshFoods', 'contact@freshfoods.com', '123 Food St, New York', 9876543210);

INSERT INTO Supplier (Supplier_ID, Store_ID, Product_ID, Supplier_Name, Email, Address, Contact_Number) 
VALUES (2, 2, NULL, 'TechSupply', 'contact@techsupply.com', '456 Tech Ave, Los Angeles', 9876543211);

INSERT INTO Supplier (Supplier_ID, Store_ID, Product_ID, Supplier_Name, Email, Address, Contact_Number) 
VALUES (3, 3, NULL, 'HomeEssentials', 'contact@homeessentials.com', '789 Home Blvd, Chicago', 9876543212);

INSERT INTO Supplier (Supplier_ID, Store_ID, Product_ID, Supplier_Name, Email, Address, Contact_Number) 
VALUES (4, 4, NULL, 'BestBeverages', 'contact@bestbeverages.com', '101 Drink Rd, Houston', 9876543213);

INSERT INTO Supplier (Supplier_ID, Store_ID, Product_ID, Supplier_Name, Email, Address, Contact_Number) 
VALUES (5, 5, NULL, 'GroceryWorld', 'contact@groceryworld.com', '202 Market Ln, Miami', 9876543214);

INSERT INTO Supplier (Supplier_ID, Store_ID, Product_ID, Supplier_Name, Email, Address, Contact_Number) 
VALUES (6, 6, NULL, 'DairyFresh', 'contact@dairyfresh.com', '303 Dairy St, Dallas', 9876543215);

INSERT INTO Supplier (Supplier_ID, Store_ID, Product_ID, Supplier_Name, Email, Address, Contact_Number) 
VALUES (7, 7, NULL, 'ElectronicSolutions', 'contact@electronics.com', '707 Tech Plaza, Phoenix', 9876543216);

INSERT INTO Supplier (Supplier_ID, Store_ID, Product_ID, Supplier_Name, Email, Address, Contact_Number) 
VALUES (8, 8, NULL, 'HomeAppliances', 'contact@appliances.com', '808 Home Blvd, San Diego', 9876543217);

INSERT INTO Supplier (Supplier_ID, Store_ID, Product_ID, Supplier_Name, Email, Address, Contact_Number) 
VALUES (9, 9, NULL, 'HealthyDrinks', 'contact@healthydrinks.com', '909 Juice Rd, San Jose', 9876543218);

INSERT INTO Supplier (Supplier_ID, Store_ID, Product_ID, Supplier_Name, Email, Address, Contact_Number) 
VALUES (10, 10, NULL, 'BakerySupplies', 'contact@bakery.com', '505 Bread St, Austin', 9876543219);

INSERT INTO Supplier (Supplier_ID, Store_ID, Product_ID, Supplier_Name, Email, Address, Contact_Number) 
VALUES (11, 11, NULL, 'GadgetStore', 'contact@gadgetstore.com', '111 Tech Blvd, Seattle', 9876543220);

INSERT INTO Supplier (Supplier_ID, Store_ID, Product_ID, Supplier_Name, Email, Address, Contact_Number) 
VALUES (12, 12, NULL, 'EcoProducts', 'contact@ecoproducts.com', '212 Green Rd, Denver', 9876543221);

INSERT INTO Supplier (Supplier_ID, Store_ID, Product_ID, Supplier_Name, Email, Address, Contact_Number) 
VALUES (13, 13, NULL, 'FurnitureMakers', 'contact@furnitures.com', '313 Wood St, Boston', 9876543222);

INSERT INTO Supplier (Supplier_ID, Store_ID, Product_ID, Supplier_Name, Email, Address, Contact_Number) 
VALUES (14, 14, NULL, 'FashionTrends', 'contact@fashiontrends.com', '414 Fashion Ln, Las Vegas', 9876543223);

INSERT INTO Supplier (Supplier_ID, Store_ID, Product_ID, Supplier_Name, Email, Address, Contact_Number) 
VALUES (15, 15, NULL, 'AutoParts', 'contact@autoparts.com', '515 Auto Dr, San Antonio', 9876543224);

INSERT INTO Supplier (Supplier_ID, Store_ID, Product_ID, Supplier_Name, Email, Address, Contact_Number) 
VALUES (16, 16, NULL, 'OrganicFoods', 'contact@organicfoods.com', '616 Farm Rd, Philadelphia', 9876543225);

INSERT INTO Supplier (Supplier_ID, Store_ID, Product_ID, Supplier_Name, Email, Address, Contact_Number) 
VALUES (17, 17, NULL, 'HealthCarePlus', 'contact@healthcare.com', '717 Health St, Columbus', 9876543226);

INSERT INTO Supplier (Supplier_ID, Store_ID, Product_ID, Supplier_Name, Email, Address, Contact_Number) 
VALUES (18, 18, NULL, 'BookWorld', 'contact@bookworld.com', '818 Library Rd, Charlotte', 9876543227);

INSERT INTO Supplier (Supplier_ID, Store_ID, Product_ID, Supplier_Name, Email, Address, Contact_Number) 
VALUES (19, 19, NULL, 'ToyHeaven', 'contact@toys.com', '919 Fun St, Detroit', 9876543228);

INSERT INTO Supplier (Supplier_ID, Store_ID, Product_ID, Supplier_Name, Email, Address, Contact_Number) 
VALUES (20, 20, NULL, 'SportsZone', 'contact@sportszone.com', '1010 Stadium Rd, Indianapolis', 9876543229);

--Product rows (Alif Hossain)--
INSERT INTO Product (Product_ID, Supplier_ID, Product_Name, Category, Price, Stock_Quantity) 
VALUES (101, 1, 'Organic Apples', 'Grocery', 3.99, 500);

INSERT INTO Product (Product_ID, Supplier_ID, Product_Name, Category, Price, Stock_Quantity) 
VALUES (102, 2, 'Wireless Headphones', 'Electronics', 49.99, 200);

INSERT INTO Product (Product_ID, Supplier_ID, Product_Name, Category, Price, Stock_Quantity) 
VALUES (103, 3, 'Comfort Sofa', 'Furniture', 199.99, 50);

INSERT INTO Product (Product_ID, Supplier_ID, Product_Name, Category, Price, Stock_Quantity) 
VALUES (104, 4, 'Bottled Water', 'Beverages', 1.29, 1000);

INSERT INTO Product (Product_ID, Supplier_ID, Product_Name, Category, Price, Stock_Quantity) 
VALUES (105, 5, 'Whole Wheat Bread', 'Bakery', 2.49, 300);

INSERT INTO Product (Product_ID, Supplier_ID, Product_Name, Category, Price, Stock_Quantity) 
VALUES (106, 6, 'Milk 1L', 'Dairy', 1.99, 600);

INSERT INTO Product (Product_ID, Supplier_ID, Product_Name, Category, Price, Stock_Quantity) 
VALUES (107, 7, 'LED TV 55 Inch', 'Electronics', 499.99, 100);

INSERT INTO Product (Product_ID, Supplier_ID, Product_Name, Category, Price, Stock_Quantity) 
VALUES (108, 8, 'Microwave Oven', 'Appliances', 89.99, 150);

INSERT INTO Product (Product_ID, Supplier_ID, Product_Name, Category, Price, Stock_Quantity) 
VALUES (109, 9, 'Orange Juice 1L', 'Beverages', 3.49, 800);

INSERT INTO Product (Product_ID, Supplier_ID, Product_Name, Category, Price, Stock_Quantity) 
VALUES (110, 10, 'Chocolate Cake', 'Bakery', 15.99, 50);

INSERT INTO Product (Product_ID, Supplier_ID, Product_Name, Category, Price, Stock_Quantity) 
VALUES (111, 11, 'Smartphone 128GB', 'Electronics', 699.99, 75);

INSERT INTO Product (Product_ID, Supplier_ID, Product_Name, Category, Price, Stock_Quantity) 
VALUES (112, 12, 'Organic Shampoo', 'Personal Care', 9.99, 400);

INSERT INTO Product (Product_ID, Supplier_ID, Product_Name, Category, Price, Stock_Quantity) 
VALUES (113, 13, 'Office Chair', 'Furniture', 129.99, 120);

INSERT INTO Product (Product_ID, Supplier_ID, Product_Name, Category, Price, Stock_Quantity) 
VALUES (114, 14, 'Men''s Running Shoes', 'Fashion', 59.99, 250);

INSERT INTO Product (Product_ID, Supplier_ID, Product_Name, Category, Price, Stock_Quantity) 
VALUES (115, 15, 'Car Engine Oil', 'Automotive', 29.99, 300);

INSERT INTO Product (Product_ID, Supplier_ID, Product_Name, Category, Price, Stock_Quantity) 
VALUES (116, 16, 'Organic Carrots', 'Grocery', 2.99, 600);

INSERT INTO Product (Product_ID, Supplier_ID, Product_Name, Category, Price, Stock_Quantity) 
VALUES (117, 17, 'Multivitamin Supplements', 'Health', 19.99, 500);

INSERT INTO Product (Product_ID, Supplier_ID, Product_Name, Category, Price, Stock_Quantity) 
VALUES (118, 18, 'Hardcover Notebook', 'Stationery', 4.49, 800);

INSERT INTO Product (Product_ID, Supplier_ID, Product_Name, Category, Price, Stock_Quantity) 
VALUES (119, 19, 'Toy Building Blocks', 'Toys', 39.99, 400);

INSERT INTO Product (Product_ID, Supplier_ID, Product_Name, Category, Price, Stock_Quantity) 
VALUES (120, 20, 'Basketball', 'Sports', 24.99, 350);

UPDATE Supplier SET Product_ID = 101 WHERE Supplier_ID = 1;
UPDATE Supplier SET Product_ID = 102 WHERE Supplier_ID = 2;
UPDATE Supplier SET Product_ID = 103 WHERE Supplier_ID = 3;
UPDATE Supplier SET Product_ID = 104 WHERE Supplier_ID = 4;
UPDATE Supplier SET Product_ID = 105 WHERE Supplier_ID = 5;
UPDATE Supplier SET Product_ID = 106 WHERE Supplier_ID = 6;
UPDATE Supplier SET Product_ID = 107 WHERE Supplier_ID = 7;
UPDATE Supplier SET Product_ID = 108 WHERE Supplier_ID = 8;
UPDATE Supplier SET Product_ID = 109 WHERE Supplier_ID = 9;
UPDATE Supplier SET Product_ID = 110 WHERE Supplier_ID = 10;
UPDATE Supplier SET Product_ID = 111 WHERE Supplier_ID = 11;
UPDATE Supplier SET Product_ID = 112 WHERE Supplier_ID = 12;
UPDATE Supplier SET Product_ID = 113 WHERE Supplier_ID = 13;
UPDATE Supplier SET Product_ID = 114 WHERE Supplier_ID = 14;
UPDATE Supplier SET Product_ID = 115 WHERE Supplier_ID = 15;
UPDATE Supplier SET Product_ID = 116 WHERE Supplier_ID = 16;
UPDATE Supplier SET Product_ID = 117 WHERE Supplier_ID = 17;
UPDATE Supplier SET Product_ID = 118 WHERE Supplier_ID = 18;
UPDATE Supplier SET Product_ID = 119 WHERE Supplier_ID = 19;
UPDATE Supplier SET Product_ID = 120 WHERE Supplier_ID = 20;

--Customer rows (Joseph Nguyen)--
INSERT INTO Customers (Customer_ID, Store_ID, Loyalty_Point, First_Name, Last_Name, Email, Phone_Number) 
VALUES (201, 1, 120, 'John', 'Doe', 'john.doe@email.com', 9876543101);

INSERT INTO Customers (Customer_ID, Store_ID, Loyalty_Point, First_Name, Last_Name, Email, Phone_Number) 
VALUES (202, 2, 85, 'Jane', 'Smith', 'jane.smith@email.com', 9876543102);

INSERT INTO Customers (Customer_ID, Store_ID, Loyalty_Point, First_Name, Last_Name, Email, Phone_Number) 
VALUES (203, 3, 200, 'Michael', 'Brown', 'michael.brown@email.com', 9876543103);

INSERT INTO Customers (Customer_ID, Store_ID, Loyalty_Point, First_Name, Last_Name, Email, Phone_Number) 
VALUES (204, 4, 150, 'Emily', 'Williams', 'emily.williams@email.com', 9876543104);

INSERT INTO Customers (Customer_ID, Store_ID, Loyalty_Point, First_Name, Last_Name, Email, Phone_Number) 
VALUES (205, 5, 95, 'David', 'Johnson', 'david.johnson@email.com', 9876543105);

INSERT INTO Customers (Customer_ID, Store_ID, Loyalty_Point, First_Name, Last_Name, Email, Phone_Number) 
VALUES (206, 6, 180, 'Sarah', 'Miller', 'sarah.miller@email.com', 9876543106);

INSERT INTO Customers (Customer_ID, Store_ID, Loyalty_Point, First_Name, Last_Name, Email, Phone_Number) 
VALUES (207, 7, 75, 'Robert', 'Wilson', 'robert.wilson@email.com', 9876543107);

INSERT INTO Customers (Customer_ID, Store_ID, Loyalty_Point, First_Name, Last_Name, Email, Phone_Number) 
VALUES (208, 8, 210, 'Olivia', 'Moore', 'olivia.moore@email.com', 9876543108);

INSERT INTO Customers (Customer_ID, Store_ID, Loyalty_Point, First_Name, Last_Name, Email, Phone_Number) 
VALUES (209, 9, 130, 'James', 'Taylor', 'james.taylor@email.com', 9876543109);

INSERT INTO Customers (Customer_ID, Store_ID, Loyalty_Point, First_Name, Last_Name, Email, Phone_Number) 
VALUES (210, 10, 50, 'Sophia', 'Anderson', 'sophia.anderson@email.com', 9876543110);

INSERT INTO Customers (Customer_ID, Store_ID, Loyalty_Point, First_Name, Last_Name, Email, Phone_Number) 
VALUES (211, 11, 90, 'William', 'Thomas', 'william.thomas@email.com', 9876543111);

INSERT INTO Customers (Customer_ID, Store_ID, Loyalty_Point, First_Name, Last_Name, Email, Phone_Number) 
VALUES (212, 12, 175, 'Isabella', 'Jackson', 'isabella.jackson@email.com', 9876543112);

INSERT INTO Customers (Customer_ID, Store_ID, Loyalty_Point, First_Name, Last_Name, Email, Phone_Number) 
VALUES (213, 13, 145, 'Benjamin', 'White', 'benjamin.white@email.com', 9876543113);

INSERT INTO Customers (Customer_ID, Store_ID, Loyalty_Point, First_Name, Last_Name, Email, Phone_Number) 
VALUES (214, 14, 220, 'Mia', 'Harris', 'mia.harris@email.com', 9876543114);

INSERT INTO Customers (Customer_ID, Store_ID, Loyalty_Point, First_Name, Last_Name, Email, Phone_Number) 
VALUES (215, 15, 60, 'Daniel', 'Martin', 'daniel.martin@email.com', 9876543115);

INSERT INTO Customers (Customer_ID, Store_ID, Loyalty_Point, First_Name, Last_Name, Email, Phone_Number) 
VALUES (216, 16, 140, 'Charlotte', 'Thompson', 'charlotte.thompson@email.com', 9876543116);

INSERT INTO Customers (Customer_ID, Store_ID, Loyalty_Point, First_Name, Last_Name, Email, Phone_Number) 
VALUES (217, 17, 80, 'Matthew', 'Garcia', 'matthew.garcia@email.com', 9876543117);

INSERT INTO Customers (Customer_ID, Store_ID, Loyalty_Point, First_Name, Last_Name, Email, Phone_Number) 
VALUES (218, 18, 200, 'Amelia', 'Martinez', 'amelia.martinez@email.com', 9876543118);

INSERT INTO Customers (Customer_ID, Store_ID, Loyalty_Point, First_Name, Last_Name, Email, Phone_Number) 
VALUES (219, 19, 170, 'Henry', 'Robinson', 'henry.robinson@email.com', 9876543119);

INSERT INTO Customers (Customer_ID, Store_ID, Loyalty_Point, First_Name, Last_Name, Email, Phone_Number) 
VALUES (220, 20, 110, 'Ava', 'Clark', 'ava.clark@email.com', 9876543120);

--Order Rows (Emmanuel Chijioke)--
INSERT INTO Orders (Order_ID, Customer_ID, Store_ID, Order_Date, Total_Amount) 
VALUES (301, 201, 1, TO_DATE('2024-01-05', 'YYYY-MM-DD'), 59.99);

INSERT INTO Orders (Order_ID, Customer_ID, Store_ID, Order_Date, Total_Amount) 
VALUES (302, 202, 2, TO_DATE('2024-02-12', 'YYYY-MM-DD'), 129.50);

INSERT INTO Orders (Order_ID, Customer_ID, Store_ID, Order_Date, Total_Amount) 
VALUES (303, 203, 3, TO_DATE('2024-01-20', 'YYYY-MM-DD'), 39.99);

INSERT INTO Orders (Order_ID, Customer_ID, Store_ID, Order_Date, Total_Amount) 
VALUES (304, 204, 4, TO_DATE('2024-03-05', 'YYYY-MM-DD'), 19.99);

INSERT INTO Orders (Order_ID, Customer_ID, Store_ID, Order_Date, Total_Amount) 
VALUES (305, 205, 5, TO_DATE('2024-01-18', 'YYYY-MM-DD'), 250.00);

INSERT INTO Orders (Order_ID, Customer_ID, Store_ID, Order_Date, Total_Amount) 
VALUES (306, 206, 6, TO_DATE('2024-02-07', 'YYYY-MM-DD'), 75.25);

INSERT INTO Orders (Order_ID, Customer_ID, Store_ID, Order_Date, Total_Amount) 
VALUES (307, 207, 7, TO_DATE('2024-03-10', 'YYYY-MM-DD'), 89.99);

INSERT INTO Orders (Order_ID, Customer_ID, Store_ID, Order_Date, Total_Amount) 
VALUES (308, 208, 8, TO_DATE('2024-02-22', 'YYYY-MM-DD'), 200.75);

INSERT INTO Orders (Order_ID, Customer_ID, Store_ID, Order_Date, Total_Amount) 
VALUES (309, 209, 9, TO_DATE('2024-01-30', 'YYYY-MM-DD'), 110.00);

INSERT INTO Orders (Order_ID, Customer_ID, Store_ID, Order_Date, Total_Amount) 
VALUES (310, 210, 10, TO_DATE('2024-03-15', 'YYYY-MM-DD'), 45.80);

INSERT INTO Orders (Order_ID, Customer_ID, Store_ID, Order_Date, Total_Amount) 
VALUES (311, 211, 11, TO_DATE('2024-02-05', 'YYYY-MM-DD'), 99.99);

INSERT INTO Orders (Order_ID, Customer_ID, Store_ID, Order_Date, Total_Amount) 
VALUES (312, 212, 12, TO_DATE('2024-01-28', 'YYYY-MM-DD'), 149.49);

INSERT INTO Orders (Order_ID, Customer_ID, Store_ID, Order_Date, Total_Amount) 
VALUES (313, 213, 13, TO_DATE('2024-03-02', 'YYYY-MM-DD'), 300.00);

INSERT INTO Orders (Order_ID, Customer_ID, Store_ID, Order_Date, Total_Amount) 
VALUES (314, 214, 14, TO_DATE('2024-02-17', 'YYYY-MM-DD'), 79.99);

INSERT INTO Orders (Order_ID, Customer_ID, Store_ID, Order_Date, Total_Amount) 
VALUES (315, 215, 15, TO_DATE('2024-01-25', 'YYYY-MM-DD'), 55.99);

INSERT INTO Orders (Order_ID, Customer_ID, Store_ID, Order_Date, Total_Amount) 
VALUES (316, 216, 16, TO_DATE('2024-02-09', 'YYYY-MM-DD'), 89.50);

INSERT INTO Orders (Order_ID, Customer_ID, Store_ID, Order_Date, Total_Amount) 
VALUES (317, 217, 17, TO_DATE('2024-03-12', 'YYYY-MM-DD'), 250.99);

INSERT INTO Orders (Order_ID, Customer_ID, Store_ID, Order_Date, Total_Amount) 
VALUES (318, 218, 18, TO_DATE('2024-02-03', 'YYYY-MM-DD'), 199.99);

INSERT INTO Orders (Order_ID, Customer_ID, Store_ID, Order_Date, Total_Amount) 
VALUES (319, 219, 19, TO_DATE('2024-01-29', 'YYYY-MM-DD'), 125.75);

INSERT INTO Orders (Order_ID, Customer_ID, Store_ID, Order_Date, Total_Amount) 
VALUES (320, 220, 20, TO_DATE('2024-03-08', 'YYYY-MM-DD'), 69.99);

--Select, Join and View Queries for Product and Employees (Alif Hossain)--
SELECT * FROM Product WHERE Price > 50;

SELECT * FROM Product WHERE Category = 'Electronics';

SELECT * FROM Employees WHERE Position = 'Manager';

SELECT * FROM Employees WHERE Salary > 4000;

--INNER JOIN--
SELECT Product.Product_ID, Product.Product_Name, Product.Price, Supplier.Supplier_Name
FROM Product
INNER JOIN Supplier ON Product.Supplier_ID = Supplier.Supplier_ID;

--LEFT JOIN--
SELECT Employees.Employee_ID, Employees.First_Name, Employees.Last_Name, Employees.Position, Store.Store_Name
FROM Employees
LEFT JOIN Store ON Employees.Store_ID = Store.Store_ID;

--VIEW with INNER JOIN--
CREATE VIEW ProductSupplierView AS
SELECT Product.Product_ID, Product.Product_Name, Supplier.Supplier_Name, Supplier.Email
FROM Product
INNER JOIN Supplier ON Product.Supplier_ID = Supplier.Supplier_ID;

--VIEW with LEFT JOIN--
CREATE VIEW EmployeeStoreView AS
SELECT Employees.Employee_ID, Employees.First_Name, Employees.Last_Name, Employees.Position, Store.Store_Name
FROM Employees
LEFT JOIN Store ON Employees.Store_ID = Store.Store_ID;

--Select, Join and View Queries for Store and Orders (Emmanuel Chijioke)--
SELECT * FROM Store WHERE Store_Type = 'Retail';

SELECT * FROM Store WHERE Location = 'Los Angeles';

SELECT * FROM Orders WHERE Total_Amount > 100;

SELECT * FROM Orders WHERE Order_Date > TO_DATE('2024-02-01', 'YYYY-MM-DD');

--INNER JOIN--
SELECT Orders.Order_ID, Customers.First_Name, Customers.Last_Name, Orders.Order_Date, Orders.Total_Amount
FROM Orders
INNER JOIN Customers ON Orders.Customer_ID = Customers.Customer_ID;

--RIGHT JOIN--
SELECT Store.Store_ID, Store.Store_Name, Employees.First_Name, Employees.Last_Name, Employees.Position
FROM Store
RIGHT JOIN Employees ON Store.Manager_ID = Employees.Employee_ID;

--VIEW with INNER JOIN--
CREATE VIEW StoreManagerView AS
SELECT Store.Store_ID, Store.Store_Name, Employees.First_Name, Employees.Last_Name, Employees.Position
FROM Store
INNER JOIN Employees ON Store.Manager_ID = Employees.Employee_ID;

--VIEW with LEFT JOIN--
CREATE VIEW OrderCustomerView AS
SELECT Orders.Order_ID, Orders.Order_Date, Orders.Total_Amount, Customers.First_Name, Customers.Last_Name
FROM Orders
LEFT JOIN Customers ON Orders.Customer_ID = Customers.Customer_ID;

--Select, Join and View Queries for Customers and Supplier (Joseph Nguyen)--
SELECT * FROM Customers WHERE Loyalty_Point > 100;

SELECT * FROM Customers WHERE Last_Name = 'Smith';

SELECT * FROM Supplier WHERE Address LIKE '%New York%';

SELECT * FROM Supplier WHERE Contact_Number LIKE '%3210';

--INNER JOIN--
SELECT Customers.Customer_ID, Customers.First_Name, Customers.Last_Name, Orders.Order_ID, Orders.Order_Date, Orders.Total_Amount
FROM Customers
INNER JOIN Orders ON Customers.Customer_ID = Orders.Customer_ID;

--LEFT JOIN--
SELECT Supplier.Supplier_ID, Supplier.Supplier_Name, Product.Product_Name, Product.Price
FROM Supplier
LEFT JOIN Product ON Supplier.Product_ID = Product.Product_ID;

--View with inner join--
CREATE VIEW SupplierProductView AS
SELECT Supplier.Supplier_ID, Supplier.Supplier_Name, Product.Product_Name, Product.Price
FROM Supplier
INNER JOIN Product ON Supplier.Product_ID = Product.Product_ID;

--View with Right join--
CREATE VIEW CustomerOrderView AS
SELECT Customers.Customer_ID, Customers.First_Name, Customers.Last_Name, Orders.Order_ID, Orders.Order_Date, Orders.Total_Amount
FROM Customers
RIGHT JOIN Orders ON Customers.Customer_ID = Orders.Customer_ID;












