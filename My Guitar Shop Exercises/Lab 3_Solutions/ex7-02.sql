SELECT product_name, list_price
FROM products p
WHERE list_price > (SELECT AVG(list_price) FROM products)
ORDER BY list_price DESC;