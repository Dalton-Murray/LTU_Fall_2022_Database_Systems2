-- SELECT COUNT(*) AS number_of_invoices, SUM(invoice_total - payment_total - credit_total)
--     AS total_due
-- FROM ap.invoices
-- WHERE invoice_total - payment_total - credit_total > 0

-- SELECT 5+4 AS addition

-- SELECT "Hello World!" as message

-- SELECT 'After 1/1/2018' AS selection_date,
--     COUNT(*) AS number_of_invoices,
--     ROUND(AVG(invoice_total), 2) AS avg_invoice_amt,
--     SUM(invoice_total) AS total_invoice_amt
-- FROM ap.invoices
-- WHERE invoice_date > '2018-01-01'

-- SELECT 'After 1/1/2018' AS selection_date,
--     COUNT(*) AS number_of_invoices,
--     MAX(invoice_total) AS highest_invoice_total,
--     MIN(invoice_total) AS lowest_invoice_total
-- FROM ap.invoices
-- WHERE invoice_date > '2018-01-01'

-- SELECT MIN(vendor_name) AS first_vendor,
--     MAX(vendor_name) AS last_vendor,
--     COUNT(vendor_name) AS number_of_vendors
-- FROM ap.vendors

-- SELECT COUNT(DISTINCT vendor_id) AS number_of_vendors,
--     COUNT(vendor_id) AS number_of_invoices,
--     ROUND(AVG(invoice_total), 2) AS avg_invoice_amt
-- FROM ap.invoices
-- WHERE invoice_date > '2018-01-01'

-- SELECT vendor_id, ROUND(AVG(invoice_total), 2) AS average_invoice_amount
-- FROM ap.invoices
-- GROUP BY vendor_id
-- HAVING AVG(invoice_total) > 2000
-- ORDER BY average_invoice_amount DESC

-- SELECT vendor_id, COUNT(*) AS invoice_qty
-- FROM ap.invoices
-- GROUP BY vendor_id

-- SELECT vendor_state, vendor_city, COUNT(*) AS invoice_qty,
--     ROUND(AVG(invoice_total), 2) AS invoice_avg
-- FROM ap.invoices JOIN vendors
--     ON invoices.vendor_id = vendors.vendor_id
-- GROUP BY vendor_state, vendor_city
-- ORDER BY vendor_state, vendor_city

-- SELECT vendor_state, vendor_city, COUNT(*) AS invoice_qty,
--     ROUND(AVG(invoice_total), 2) AS invoice_avg
-- FROM ap.invoices JOIN vendors
--     ON invoices.vendor_id = vendors.vendor_id
-- GROUP BY vendor_state, vendor_city
-- HAVING COUNT(*) >= 2
-- ORDER BY vendor_state, vendor_city

-- SELECT vendor_name,
--     COUNT(*) AS invoice_qty,
--     ROUND(AVG(invoice_total), 2) AS invoice_avg
-- FROM ap.vendors JOIN invoices
--     ON vendors.vendor_id = invoices.vendor_id
-- GROUP BY vendor_name
-- HAVING AVG(invoice_total) > 500
-- ORDER BY invoice_qty DESC


-- SELECT vendor_name,
--     COUNT(*) AS invoice_qty,
--     ROUND(AVG(invoice_total), 2) AS invoice_avg
-- FROM ap.vendors JOIN invoices
--     ON vendors.vendor_id = invoices.vendor_id
-- WHERE invoice_total > 500
-- GROUP BY vendor_name
-- ORDER BY invoice_qty DESC

-- SELECT
--     invoice_date,
--     COUNT(8) AS invoie_qty,
--     SUM(invoice_total) AS invoice_sum
-- FROM invoices
-- GROUP BY invoice_date
-- HAVING invoice_date BETWEEN '2018-05-01' AND '2018-05-31'
--     AND COUNT(*) > 1
--     AND SUM(invoice_total) > 100
-- ORDER BY invoice_date DESC

-- SELECT
--     invoice_date,
--     COUNT(8) AS invoie_qty,
--     SUM(invoice_total) AS invoice_sum
-- FROM invoices
-- WHERE invoice_date BETWEEN '2018-05-01' AND '2018-05-31'
-- GROUP BY invoice_date
-- HAVING COUNT(*) > 1
--     AND SUM(invoice_total) > 100
-- ORDER BY invoice_date DESC

-- SELECT vendor_id, COUNT(*) AS invoice_count,
--     SUM(invoice_total) AS invoice_total
-- FROM ap.invoices
-- GROUP BY vendor_id WITH ROLLUP

-- SELECT vendor_state, vendor_city, COUNT(*) as qty_vendors
-- FROM ap.vendors
-- WHERE vendor_state IN ('IA', 'NJ')
-- GROUP BY vendor_state, vendor_city WITH ROLLUP

-- SELECT invoice_date, payment_date,
--     SUM(invoice_total) AS invoice_total,
--     SUM(invoice_total - credit_total - payment_total)
-- AS balance_due
-- FROM ap.invoices
-- WHERE invoice_date BETWEEN '2018-07-24' AND '2018-07-31'
-- GROUP BY invoice_date, payment_date WITH ROLLUP

SELECT IF(GROUPING(invoice_date) = 1, 'Grand totals', invoice_date) AS invoice_date,
    IF(GROUPING(payment_date) = 1, 'Invoice date totals', payment_date) AS payment_date,
    SUM(invoice_total) AS invoice_total,
    SUM(invoice_total - credit_total - payment_total) AS balance_due
FROM ap.invoices
WHERE invoice_date BETWEEN '2018-07-24' AND '2018-07-31'
GROUP BY invoice_date, payment_date WITH ROLLUP