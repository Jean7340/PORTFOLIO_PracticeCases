USE my_web_db;

INSERT INTO users VALUES 
(1, 'johnsmith@gmail.com', 'John', 'Smith'),
(2, 'janedoe@yahoo.com', 'Jane', 'Doe');

INSERT INTO products VALUES 
(1, 'Local Music Vol 1'),
(2, 'Local Music Vol 2');

INSERT INTO downloads VALUES 
(1, 1, NOW(), 'pedals_are_falling.mp3', 2), 
(2, 2, NOW(), 'turn_signal.mp3', 1), 
(3, 2, NOW(), 'one_horse_town.mp3', 2);

SELECT u.email_address, u.first_name, u.last_name,
       d.download_date, d.filename, 
       p.product_name
FROM users u
  JOIN downloads d
    ON u.user_id = d.user_id
  JOIN products p
    ON d.product_id = p.product_id
ORDER BY u.email_address DESC, product_name;