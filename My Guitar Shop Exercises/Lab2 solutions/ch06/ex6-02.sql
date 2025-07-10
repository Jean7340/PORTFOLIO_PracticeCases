SELECT category_name, COUNT(*) AS product_count,
       MAX(list_price) AS most_expensive_product
FROM categories c JOIN products p
  ON c.category_id = p.category_id
GROUP BY category_name
ORDER BY product_count DESC