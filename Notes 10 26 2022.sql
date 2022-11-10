---- Views



-- CREATE VIEW vendors_phone_list AS
--     SELECT vendor_name, vendor_contact_last_name,
--             vendor_contact_first_name, vendor_phone
--     FROM vendors
--     WHERE vendor_id IN
--     (SELECT DISTINCT vendor_id FROM invoices)

--------

-- SELECT SECOND(CURRENT_TIME()), MINUTE(CURRENT_TIME()), HOUR(CURRENT_TIME())
-- SELECT DAY(CURRENT_DATE()), MONTH(CURRENT_DATE()), YEAR(CURRENT_DATE())
-- SELECT CURRENT_TIMESTAMP(), CURRENT_DATE(), CURRENT_TIME()
-- SELECT UTC_DATE(), UTC_TIME()
-- SELECT CURDATE(), CURRENT_DATE()
-- SELECT NOW(), SYSDATE(), CURRENT_TIMESTAMP()

-- SELECT FLOOR(RAND()*(100-0))

-- SELECT substring("Hello World", 7, 1)

-- Count positive or negative changes direction of search
-- and from where
-- SELECT substring_index("https://www.google.com", ".", "-2")

-- SELECT length("  Hello World  ") as length

-- SELECT locate("World", "Hello World")

-- SELECT substring("Hello World", locate("World", "Hello World"))

-- SELECT insert("google.com", 1, 0, "https://www.")

-- SELECT REPLACE(RIGHT("(559) 555-1212", 13), ") ", "-")

-- SELECT RIGHT("(559) 555-1212", 8)

-- SELECT REPLACE(LEFT("(559) 555-1212", 5), "(", "")

-- SELECT vendor_name,
--     CONCAT_WS(", ", vendor_contact_last_name,
--         vendor_contact_first_name) as contact_name,
--     RIGHT(vendor_phone, 8) as phone
-- FROM ap.vendors
-- WHERE LEFT(vendor_phone, 4) = "(559"
-- ORDER BY contact_name
