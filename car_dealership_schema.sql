# ---------------------------------------------------------------------- #
# Target DBMS:           MySQL                                           #
# Project name:          Dealership                                       #
# ---------------------------------------------------------------------- #
DROP DATABASE IF EXISTS dealership;

CREATE DATABASE IF NOT EXISTS dealership;

USE dealership;

# ---------------------------------------------------------------------- #
# Tables                                                                 #
# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #
# Add table "Dealerships"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE `dealerships` (
    `dealership_id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `address` varchar(100),
    `phone` varchar(12),
    
    PRIMARY KEY (`dealership_id`)
);

# ---------------------------------------------------------------------- #
# Add table "Vehicles"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE vehicles (
    `vin` VARCHAR(17) NOT NULL,
    `year` INT,
    `make` VARCHAR(50),
    `model` VARCHAR(50),
    `vehicle_type` VARCHAR(50),
    `color` VARCHAR(30),
    `odometer` INT,
    `price` DECIMAL(10,2),
    `sold` TINYINT(1) DEFAULT 0,   -- 0 = not sold, 1 = sold
    
    PRIMARY KEY (`vin`)
);

# ---------------------------------------------------------------------- #
# Add table "Inventory"                                                  #
# ---------------------------------------------------------------------- #

CREATE TABLE `inventory` (
    `dealership_id` INTEGER NOT NULL AUTO_INCREMENT,
	`vin` varchar(17) NOT NULL,
    
	FOREIGN KEY (`dealership_id`) REFERENCES dealerships(`dealership_id`),
    FOREIGN KEY (`vin`) REFERENCES vehicles(`vin`)
);

# ---------------------------------------------------------------------- #
# Add table "sales_contracts"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE sales_contracts (
    `id` INT AUTO_INCREMENT,
    `date` DATE,
    `customer_name` VARCHAR(50),
    `customer_email` VARCHAR(50),
    `vin` varchar(17),   -- foreign key to vehicles
    `sales_tax_amount` DECIMAL(10,2),
    `recording_fee` DECIMAL(10,2),
    `processing_fee` DECIMAL(10,2),
    `total_price` DECIMAL(10,2),
    `is_finance` TINYINT(1),        -- boolean
    `monthly_payment` DECIMAL(10,2),
    
    PRIMARY KEY (`id`),
    FOREIGN KEY (`vin`) REFERENCES vehicles(`vin`)
);

# ---------------------------------------------------------------------- #
# Add table "lease_contracts"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE lease_contracts (
	`id` INT AUTO_INCREMENT,
    `date` DATE,
    `customer_name` VARCHAR(50),
    `customer_email` VARCHAR(50),
    `vin` varchar(17),                        -- foreign key to vehicles
    `expected_ending_value` DECIMAL(10,2),  
    `lease_fee` DECIMAL(10,2),        
    `total_price` DECIMAL(10,2),
    `monthly_payment` DECIMAL(10,2),

    PRIMARY KEY (`id`),
    FOREIGN KEY (`vin`) REFERENCES vehicles(`vin`)
);



# ------------------------------------------------------------ #
# Insert sample data into dealerships                          #
# ------------------------------------------------------------ #

INSERT INTO dealerships (name, address, phone) 
VALUES
('Auto World Motors', '123 Main St, Springfield, IL 62704', '555-123-4567'),
('Premium Cars', '456 Elm St, Chicago, IL 60616', '555-234-5678'),
('City Auto Sales', '789 Oak Ave, Naperville, IL 60540', '555-345-6789'),
('Luxury Rides', '321 Pine Rd, Evanston, IL 60201', '555-456-7890'),
('Budget Wheels', '654 Maple Blvd, Peoria, IL 61614', '555-567-8901');

# ------------------------------------------------------------ #
# Insert sample data into vehicles                             #
# ------------------------------------------------------------ #

INSERT INTO vehicles (vin, year, make, model, vehicle_type, color, odometer, price, sold) VALUES
('1HGCM82633A000001', 2020, 'Toyota', 'Camry', 'Sedan', 'Blue', 35000, 19999.99, 1),
('1HGCM82633A000002', 2021, 'Honda', 'Civic', 'Sedan', 'Red', 22000, 20999.99, 0),
('1HGCM82633A000003', 2019, 'Ford', 'Escape', 'SUV', 'Black', 48000, 17999.99, 1),
('1HGCM82633A000004', 2022, 'Chevrolet', 'Malibu', 'Sedan', 'White', 15000, 21999.99, 0),
('1HGCM82633A000005', 2021, 'Nissan', 'Altima', 'Sedan', 'Silver', 30000, 19999.99, 1),
('1HGCM82633A000006', 2020, 'Hyundai', 'Elantra', 'Sedan', 'Gray', 28000, 18999.99, 0),
('1HGCM82633A000007', 2019, 'Kia', 'Sorento', 'SUV', 'White', 55000, 22999.99, 1),
('1HGCM82633A000008', 2022, 'Mazda', 'CX-5', 'SUV', 'Blue', 12000, 26999.99, 0),
('1HGCM82633A000009', 2021, 'Subaru', 'Outback', 'SUV', 'Green', 35000, 25999.99, 1),
('1HGCM82633A000010', 2020, 'Volkswagen', 'Passat', 'Sedan', 'Black', 40000, 20999.99, 0),
('1HGCM82633A000011', 2022, 'Toyota', 'Corolla', 'Sedan', 'Red', 10000, 19999.99, 1),
('1HGCM82633A000012', 2021, 'Honda', 'Accord', 'Sedan', 'Silver', 25000, 23999.99, 0),
('1HGCM82633A000013', 2020, 'Ford', 'Explorer', 'SUV', 'Blue', 36000, 32999.99, 1),
('1HGCM82633A000014', 2019, 'Chevrolet', 'Equinox', 'SUV', 'White', 52000, 24999.99, 0),
('1HGCM82633A000015', 2022, 'Nissan', 'Sentra', 'Sedan', 'Gray', 9000, 18999.99, 1),
('1HGCM82633A000016', 2021, 'Hyundai', 'Tucson', 'SUV', 'Red', 28000, 22999.99, 0),
('1HGCM82633A000017', 2020, 'Kia', 'Optima', 'Sedan', 'Black', 37000, 20999.99, 1),
('1HGCM82633A000018', 2019, 'Mazda', 'Mazda3', 'Sedan', 'White', 48000, 18999.99, 0),
('1HGCM82633A000019', 2022, 'Subaru', 'Forester', 'SUV', 'Blue', 11000, 26999.99, 1),
('1HGCM82633A000020', 2021, 'Volkswagen', 'Jetta', 'Sedan', 'Gray', 30000, 19999.99, 0),
('1HGCM82633A000021', 2020, 'Toyota', 'RAV4', 'SUV', 'Green', 35000, 25999.99, 1),
('1HGCM82633A000022', 2022, 'Honda', 'CR-V', 'SUV', 'Black', 12000, 27999.99, 0),
('1HGCM82633A000023', 2019, 'Ford', 'Fusion', 'Sedan', 'Red', 46000, 18999.99, 1),
('1HGCM82633A000024', 2021, 'Chevrolet', 'Malibu', 'Sedan', 'Silver', 25000, 20999.99, 0),
('1HGCM82633A000025', 2020, 'Nissan', 'Rogue', 'SUV', 'Blue', 38000, 23999.99, 1),
('1HGCM82633A000026', 2022, 'Hyundai', 'Santa Fe', 'SUV', 'White', 15000, 28999.99, 0),
('1HGCM82633A000027', 2021, 'Kia', 'Soul', 'Hatchback', 'Red', 27000, 19999.99, 1),
('1HGCM82633A000028', 2020, 'Mazda', 'CX-30', 'SUV', 'Gray', 32000, 23999.99, 0),
('1HGCM82633A000029', 2019, 'Subaru', 'Impreza', 'Sedan', 'Blue', 50000, 17999.99, 1),
('1HGCM82633A000030', 2022, 'Volkswagen', 'Tiguan', 'SUV', 'White', 14000, 29999.99, 0),
('1HGCM82633A000031', 2021, 'Toyota', 'Highlander', 'SUV', 'Black', 26000, 35999.99, 1),
('1HGCM82633A000032', 2020, 'Honda', 'Pilot', 'SUV', 'Silver', 40000, 34999.99, 0),
('1HGCM82633A000033', 2019, 'Ford', 'Edge', 'SUV', 'Red', 48000, 29999.99, 1),
('1HGCM82633A000034', 2022, 'Chevrolet', 'Traverse', 'SUV', 'Blue', 13000, 36999.99, 0),
('1HGCM82633A000035', 2021, 'Nissan', 'Murano', 'SUV', 'White', 22000, 32999.99, 1),
('1HGCM82633A000036', 2020, 'Hyundai', 'Kona', 'SUV', 'Black', 35000, 24999.99, 0),
('1HGCM82633A000037', 2019, 'Kia', 'Sportage', 'SUV', 'Gray', 50000, 23999.99, 1),
('1HGCM82633A000038', 2022, 'Mazda', 'CX-9', 'SUV', 'Red', 10000, 39999.99, 0),
('1HGCM82633A000039', 2021, 'Subaru', 'Crosstrek', 'SUV', 'Blue', 27000, 25999.99, 1),
('1HGCM82633A000040', 2020, 'Volkswagen', 'Atlas', 'SUV', 'White', 38000, 37999.99, 0),
('1HGCM82633A000041', 2022, 'Toyota', 'Sienna', 'Van', 'Silver', 12000, 34999.99, 1),
('1HGCM82633A000042', 2021, 'Honda', 'Odyssey', 'Van', 'Black', 30000, 32999.99, 0),
('1HGCM82633A000043', 2020, 'Ford', 'Transit', 'Van', 'White', 40000, 35999.99, 1),
('1HGCM82633A000044', 2019, 'Chevrolet', 'Express', 'Van', 'Blue', 52000, 33999.99, 0),
('1HGCM82633A000045', 2022, 'Nissan', 'NV200', 'Van', 'Red', 15000, 21999.99, 1),
('1HGCM82633A000046', 2021, 'Hyundai', 'Staria', 'Van', 'Gray', 18000, 29999.99, 0),
('1HGCM82633A000047', 2020, 'Kia', 'Carnival', 'Van', 'Black', 28000, 30999.99, 1),
('1HGCM82633A000048', 2019, 'Mazda', 'MPV', 'Van', 'White', 45000, 27999.99, 0),
('1HGCM82633A000049', 2022, 'Subaru', 'Ascent', 'SUV', 'Silver', 13000, 34999.99, 1),
('1HGCM82633A000050', 2021, 'Volkswagen', 'Golf', 'Hatchback', 'Blue', 25000, 22999.99, 0);


# ------------------------------------------------------------ #
# Insert sample data into inventory                            #
# Dealership ID = 1                                             #
# vin = vehicles above                                          #
# ------------------------------------------------------------ #


INSERT INTO inventory (dealership_id, vin) VALUES
(1, '1HGCM82633A000001'),
(2, '1HGCM82633A000002'),
(3, '1HGCM82633A000003'),
(4, '1HGCM82633A000004'),
(5, '1HGCM82633A000005'),
(1, '1HGCM82633A000006'),
(2, '1HGCM82633A000007'),
(3, '1HGCM82633A000008'),
(4, '1HGCM82633A000009'),
(5, '1HGCM82633A000010'),
(1, '1HGCM82633A000011'),
(2, '1HGCM82633A000012'),
(3, '1HGCM82633A000013'),
(4, '1HGCM82633A000014'),
(5, '1HGCM82633A000015'),
(1, '1HGCM82633A000016'),
(2, '1HGCM82633A000017'),
(3, '1HGCM82633A000018'),
(4, '1HGCM82633A000019'),
(5, '1HGCM82633A000020'),
(1, '1HGCM82633A000021'),
(2, '1HGCM82633A000022'),
(3, '1HGCM82633A000023'),
(4, '1HGCM82633A000024'),
(5, '1HGCM82633A000025'),
(1, '1HGCM82633A000026'),
(2, '1HGCM82633A000027'),
(3, '1HGCM82633A000028'),
(4, '1HGCM82633A000029'),
(5, '1HGCM82633A000030'),
(1, '1HGCM82633A000031'),
(2, '1HGCM82633A000032'),
(3, '1HGCM82633A000033'),
(4, '1HGCM82633A000034'),
(5, '1HGCM82633A000035'),
(1, '1HGCM82633A000036'),
(2, '1HGCM82633A000037'),
(3, '1HGCM82633A000038'),
(4, '1HGCM82633A000039'),
(5, '1HGCM82633A000040'),
(1, '1HGCM82633A000041'),
(2, '1HGCM82633A000042'),
(3, '1HGCM82633A000043'),
(4, '1HGCM82633A000044'),
(5, '1HGCM82633A000045'),
(1, '1HGCM82633A000046'),
(2, '1HGCM82633A000047'),
(3, '1HGCM82633A000048'),
(4, '1HGCM82633A000049'),
(5, '1HGCM82633A000050');


# ------------------------------------------------------------ #
# Insert sample data into sales_contracts                      #                                  #
# ------------------------------------------------------------ #
 
 INSERT INTO sales_contracts
(`date`, `customer_name`, `customer_email`, `vin`, `sales_tax_amount`,
 `recording_fee`, `processing_fee`, `total_price`, `is_finance`, `monthly_payment`)
VALUES
('2025-02-10', 'John Doe', 'john.doe@email.com', '1HGCM82633A000049',
 750.00, 85.00, 150.00, 34750.00, 1, 350.00),

('2025-02-12', 'Sarah Miller', 'sarah.miller@email.com', '1HGCM82633A000043',
 920.00, 95.00, 150.00, 22420.00, 0, NULL),

('2025-02-14', 'David Carter', 'david.carter@email.com', '1HGCM82633A000027',
 650.00, 80.00, 150.00, 16550.00, 1, 295.00),

('2025-02-15', 'Emily Turner', 'emily.turner@email.com', '1HGCM82633A000015',
 870.00, 90.00, 150.00, 20910.00, 0, NULL),

('2025-02-16', 'Robert Young', 'robert.young@email.com', '1HGCM82633A000003',
 990.00, 95.00, 150.00, 25990.00, 1, 420.00);

# ------------------------------------------------------------ #
# Insert sample data into lease_contracts                      #                                    #
# ------------------------------------------------------------ #
 
 INSERT INTO lease_contracts
(`date`, `customer_name`, `customer_email`, `vin`,
 `expected_ending_value`, `lease_fee`, `total_price`, `monthly_payment`)
VALUES
('2025-02-10', 'Jacob Allen', 'jacob.allen@email.com', '1HGCM82633A000050',
 12000.00, 500.00, 14500.00, 260.00),

('2025-02-11', 'Laura White', 'laura.white@email.com', '1HGCM82633A000040',
 15000.00, 600.00, 17600.00, 310.00),

('2025-02-13', 'Mark Benson', 'mark.benson@email.com', '1HGCM82633A000030',
 11000.00, 450.00, 13950.00, 245.00),

('2025-02-14', 'Olivia Grant', 'olivia.grant@email.com', '1HGCM82633A000020',
 14000.00, 550.00, 17250.00, 300.00),

('2025-02-16', 'Sophia Turner', 'sophia.turner@email.com', '1HGCM82633A000010',
 16000.00, 650.00, 18650.00, 325.00);

