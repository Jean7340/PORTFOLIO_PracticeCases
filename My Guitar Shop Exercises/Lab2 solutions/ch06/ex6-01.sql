SELECT COUNT(order_id) as order_count, SUM(tax_amount) AS tax_total
FROM orders
