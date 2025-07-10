SELECT email_address, MAX(order_total) AS max_order_total
FROM
(
  SELECT email_address, o.order_id, SUM((item_price - discount_amount) * quantity) AS order_total
  FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
  GROUP BY email_address, o.order_id
) t
GROUP BY email_address
ORDER BY max_order_total DESC