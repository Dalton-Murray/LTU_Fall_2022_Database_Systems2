-- Creating stored procedure

-- If procedure already exists we drop it otherwise keep going
DROP PROCEDURE IF EXISTS getAddress;

-- Change of delimiter
DELIMITER //

-- Creates procuedure getAddress, takes in vName, can also do out and inout
CREATE PROCEDURE getAddress(IN vName varchar(255))
-- Starts statements for stored procedure
BEGIN
    SELECT concat(vendor_address1,", ", vendor_city, ", ", vendor_zip_code) as Address
    FROM ap.vendors
    WHERE vendor_name = vName;

-- Ends stored procedure
END //

-- Sets delimiter back to default
DELIMITER ;

CALL getAddress("Register")