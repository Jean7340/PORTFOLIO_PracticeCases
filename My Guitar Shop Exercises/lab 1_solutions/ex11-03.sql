DROP DATABASE IF EXISTS my_web_db;
CREATE DATABASE my_web_db CHARSET utf8mb4;
USE my_web_db;

CREATE TABLE users (
  user_id       INT          PRIMARY KEY AUTO_INCREMENT,
  email_address VARCHAR(100) UNIQUE,
  first_name    VARCHAR(45)  NOT NULL,
  last_name     VARCHAR(45)  NOT NULL
) ENGINE = InnoDB;

CREATE TABLE products (
  product_id   INT         PRIMARY KEY AUTO_INCREMENT,
  product_name VARCHAR(45) UNIQUE
) ENGINE = InnoDB;

CREATE TABLE downloads (
  download_id   INT         PRIMARY KEY,
  user_id       INT         NOT NULL,
  download_date DATETIME    NOT NULL,
  filename      VARCHAR(50) NOT NULL,
  product_id    INT         NOT NULL,
  CONSTRAINT fk_downloads_users
    FOREIGN KEY (user_id )
    REFERENCES users (user_id),
  CONSTRAINT fk_downloads_products
    FOREIGN KEY (product_id )
    REFERENCES products (product_id)
) ENGINE = InnoDB;
