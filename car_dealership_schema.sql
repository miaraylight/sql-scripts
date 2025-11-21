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
    `address` varchar(50),
    `phone` varchar(12),
    
    PRIMARY KEY (`dealership_id`)
);

# ---------------------------------------------------------------------- #
# Add table "Vehicles"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE vehicles (
    `vin` INT NOT NULL,
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
	`vin` INT NOT NULL,
    
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
    `vin` INT,   -- foreign key to vehicles
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
    `vin` INT,                        -- foreign key to vehicles
    `expected_ending_value` DECIMAL(10,2),  
    `lease_fee` DECIMAL(10,2),        
    `total_price` DECIMAL(10,2),
    `monthly_payment` DECIMAL(10,2),

    PRIMARY KEY (`id`),
    FOREIGN KEY (`vin`) REFERENCES vehicles(`vin`)
);
