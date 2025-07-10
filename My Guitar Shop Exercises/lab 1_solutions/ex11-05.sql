USE my_web_db;

ALTER TABLE products
  ADD price   DECIMAL(5,2)    DEFAULT 9.99;

ALTER TABLE products
  ADD date_added  DATETIME;
