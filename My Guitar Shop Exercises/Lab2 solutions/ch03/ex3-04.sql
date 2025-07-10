SELECT product_name, list_price, discount_percent,
       ROUND(list_price * discount_percent * .01, 2) AS discount_amount,
       list_price - ROUND(list_price * discount_percent * .01, 2) AS discount_price       
FROM products
ORDER BY discount_price DESC
LIMIT 5;