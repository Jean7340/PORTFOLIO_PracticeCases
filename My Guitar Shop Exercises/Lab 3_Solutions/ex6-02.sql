SELECT email_address, SUM(item_price * quantity) AS item_price_total, 
  SUM(discount_amount * quantity) AS discount_amount_total
FROM customers c
  JOIN orders o ON c.customer_id = o.customer_id
  JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY email_address
ORDER BY item_price_total DESC