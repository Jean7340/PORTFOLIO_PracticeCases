USE my_web_db;

ALTER TABLE users
MODIFY first_name VARCHAR(20) NOT NULL;

UPDATE users
SET first_name = NULL
WHERE user_id = 1;

UPDATE users
SET first_name = '123456789012345678901'
WHERE user_id = 1;