USE dealership;

-- 1. Get all dealerships
SELECT * 
FROM dealerships;

-- 2. Find all vehicles for a specific dealership
SELECT * 
FROM vehicles
INNER JOIN inventory ON vehicles.vin = inventory.vin
INNER JOIN dealerships ON inventory.dealership_id = dealerships.dealership_id
WHERE dealerships.dealership_id = 5;

-- 3. Find a car by VIN
SELECT * 
FROM vehicles
WHERE vin = '1HGCM82633A000010';

-- 4. Find the dealership where a certain car is located, by VIN
SELECT dealerships.dealership_id, name, address, phone 
FROM dealerships
INNER JOIN inventory ON inventory.dealership_id = dealerships.dealership_id
INNER JOIN vehicles ON vehicles.vin = inventory.vin
WHERE vehicles.vin = '1HGCM82633A000040';

-- 5. Find all Dealerships that have a certain car type (i.e. Red Ford Mustang)
SELECT *
FROM dealerships
INNER JOIN inventory ON inventory.dealership_id = dealerships.dealership_id
INNER JOIN vehicles ON vehicles.vin = inventory.vin
WHERE vehicles.make = 'Nissan' AND vehicles.model = 'Murano';

-- 6. Get all sales information for a specific dealer for a specific date range
SELECT *
FROM sales_contracts
INNER JOIN inventory ON sales_contracts.vin = inventory.vin
INNER JOIN dealerships ON inventory.dealership_id = dealerships.dealership_id
WHERE date BETWEEN '2025-02-10' AND '2025-02-16' AND dealerships.dealership_id = 3j
