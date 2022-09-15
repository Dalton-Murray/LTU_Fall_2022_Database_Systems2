-- USE ap;

-- SELECT *
-- FROM ap.invoices
-- WHERE invoice_total > 100
-- ORDER BY invoice_total DESC
-- -- LIMIT 1, 3;

-- SELECT *
-- FROM ap.invoices
-- WHERE invoice_date
--     NOT BETWEEN '2018-06-01' AND '2018-06-30'

-- SELECT DISTINCT vendor_id AS 'Vendor ID'
-- FROM ap.invoices;

-- SELECT invoice_id, (invoice_total - payment_total - credit_total) AS 'Balance Due'
-- FROM ap.invoices;

-- SELECT CONCAT("Vendor's address: ", vendor_address1, ", ", vendor_city, ", ", vendor_state, " ", vendor_zip_code) AS address
-- FROM ap.vendors;

-- SELECT CONCAT("Vendor's address: ", vendor_address1, ", ", left(vendor_city, 3), ", ", vendor_state, " ", vendor_zip_code) AS address
-- FROM ap.vendors;

-- SELECT invoice_date,
--     DATE_FORMAT(invoice_date, '%m/%d/%y') AS 'MM/DD/YY',
--     DATE_FORMAT(invoice_date, '%e-%b-%Y') AS 'DD-Mon-YYYY'
-- FROM ap.invoices
-- ORDER BY invoice_date;

-- SELECT invoice_date, invoice_total,
--     ROUND(invoice_total) AS nearest_dollar,
--     ROUND(invoice_total, 1) AS nearest_dime
-- FROM ap.invoices
-- ORDER BY invoice_DATE;

-- SELECT *
-- FROM ap.vendors
-- WHERE vendor_state != "MI"

