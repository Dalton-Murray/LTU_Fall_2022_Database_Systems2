-- SELECT invoice_number, invoice_date, invoice_total
-- FROM ap.invoices
-- WHERE invoice_total >
--     (SELECT AVG(invoice_total)
--     FROM ap.invoices)
-- ORDER BY invoice_total

-- SELECT invoice_number, invoice_date, invoice_total
-- FROM ap.invoices
-- WHERE vendor_id IN
--     (SELECT vendor_id
--     FROM ap.vendors
--     WHERE vendor_state = "CA")
-- ORDER BY invoice_date

-- SELECT vendor_id, vendor_name, vendor_state
-- FROM ap.vendors
-- WHERE vendor_id NOT IN
--     (SELECT DISTINCT vendor_id
--     FROM ap.invoices)
-- ORDER BY vendor_id

-- SELECT invoice_number, invoice_date,
--     invoice_total - payment_total - credit_total
--     AS balance_due
-- FROM ap.invoices
-- WHERE invoice_total - payment_total - credit_total > 0
--     AND invoice_total - payment_total - credit_total <
--     (SELECT AVG(invoice_total - payment_total - credit_total)
--     FROM ap.invoices
--     WHERE invoice_total - payment_total - credit_total > 0)
-- ORDER BY invoice_total DESC

-- SELECT vendor_name, invoice_number, invoice_total
-- FROM invoices i JOIN vendors v ON i.vendor_id = v.vendor_id
-- WHERE invoice_total > ALL
--     (SELECT invoice_total
--     FROM ap.invoices
--     WHERE vendor_id = 34)
-- ORDER BY vendor_name

-- SELECT vendor_id, invoice_number, invoice_total
-- FROM invoices i
-- WHERE invoice_total >
--     (SELECT AVG(invoice_total)
--     FROM ap.invoices
--     WHERE vendor_id = i.vendor_id)
-- ORDER BY vendor_id, invoice_total

SELECT vendor_id, vendor_name, vendor_state
FROM ap.vendors
WHERE NOT EXISTS
    (SELECT *
    FROM ap.invoices
    WHERE vendor_id = vendors.vendor_id)