SELECT DISTINCT category_name
FROM categories
WHERE category_id IN
     (SELECT DISTINCT category_id FROM products)
ORDER BY category_name;
