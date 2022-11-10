-- Dalton Murray
-- 11/9/2022
 
-- Sets use ap even though I set it to ap in from
use ap;

-- Creating stored procedure

-- If procedure already exists we drop it otherwise keep going
DROP PROCEDURE IF EXISTS getPhone;

-- Change of delimiter
DELIMITER //

-- Creates procuedure getPhone
CREATE PROCEDURE getPhone
(
-- Setting in and out variables, vendor id and vendor phone
	IN v_ID INT,
    OUT v_Phone VARCHAR(30)
)
-- Starts statements for stored procedure
BEGIN
-- Selecting vendor phone from vendors table
	SELECT vendor_phone
-- Setting it into our variable
    INTO v_Phone
    FROM ap.vendors
-- Ensuring vendor id from the table is equal to our inputted one
	WHERE vendor_id	= v_ID;

-- Detecting if vendor phone is null, if so we set it to not found
    SET v_Phone = IFNULL(v_Phone, "Phone Number: Not Found");

-- Ends stored procedure
END //

-- Sets delimiter back to default
DELIMITER ;

-- Calling get phone with vendor id and session variable vendor phone
CALL getPhone(1, @v_Phone);
-- Outputting session variable
SELECT @v_Phone AS "Vendor Phone Number";

-- Calling get phone with vendor id and session variable vendor phone
CALL getPhone(3, @v_Phone);
-- Outputting session variable
SELECT @v_Phone AS "Vendor Phone Number";

-- I call it twice on purpose with two different numbers, allowing it to have two resulting tables to show that it works