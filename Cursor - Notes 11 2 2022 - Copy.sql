use ap;

DROP PROCEDURE IF EXISTS getVendorList;

--
DELIMITER //

CREATE PROCEDURE getVendorList(INOUT vList varchar(5000))
BEGIN
    DECLARE finished INT DEFAULT 0;
    DECLARE vendorName VARCHAR(100) DEFAULT "";

    DECLARE curName cursor for
		SELECT vendor_name
		FROM ap.vendors
		WHERE vendor_state = "MI";

    DECLARE continue handler for not found set finished = 1;

	OPEN curName;

    getName: loop
		FETCH curName INTO vendorName;
        IF finished = 1 THEN
			LEAVE getName;
		END IF;

        SET vList = CONCAT(vendorName, "; ", vList);
	END loop getName;

    CLOSE curName;

END//

delimiter ;
--

SET @vList = "";
CALL getVendorList(@vList);
SELECT @vList as "List of Vendors";