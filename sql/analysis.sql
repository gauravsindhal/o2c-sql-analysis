-- Invoice details with customer name
SELECT
  i.invoice_id,
  c.customer_name,
  i.invoice_amount,
  i.status
FROM invoices i
JOIN customers c
  ON i.customer_id = c.customer_id;

-- Unpaid invoices
SELECT
  c.customer_name,
  i.invoice_id,
  i.invoice_amount
FROM invoices i
JOIN customers c
  ON i.customer_id = c.customer_id
WHERE i.status = 'Unpaid';

-- Total outstanding by customer
SELECT
  c.customer_name,
  SUM(i.invoice_amount) AS total_outstanding
FROM invoices i
JOIN customers c
  ON i.customer_id = c.customer_id
WHERE i.status = 'Unpaid'
GROUP BY c.customer_name
ORDER BY total_outstanding DESC;
