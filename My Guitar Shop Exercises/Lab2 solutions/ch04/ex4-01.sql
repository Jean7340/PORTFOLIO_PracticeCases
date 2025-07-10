SELECT category_name, product_name, list_price
FROM categories c JOIN products p
  ON c.category_id = p.category_id
ORDER BY category_name, product_name
  