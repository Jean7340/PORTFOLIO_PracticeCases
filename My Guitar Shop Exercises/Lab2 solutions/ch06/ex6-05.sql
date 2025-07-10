SELECT email_address, COUNT(o.order_id) AS order_count, 
  SUM((item_price - discount_amount) * quantity) AS order_total
FROM customers c
  JOIN orders o ON c.customer_id = o.customer_id
  JOIN order_items oi ON o.order_id = oi.order_id
WHERE item_price > 400 
GROUP BY email_address
HAVING order_count > 1
ORDER BY order_total DESC
