CREATE OR REPLACE VIEW product_summary
AS
SELECT product_name, COUNT(product_name) AS order_count, SUM(item_total) AS order_total
FROM order_item_products
GROUP BY product_name