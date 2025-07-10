CREATE OR REPLACE VIEW customer_addresses
AS
SELECT c.customer_id, email_address, last_name, first_name, 
    ba.line1 AS bill_line1, ba.line2 AS bill_line2, 
    ba.city AS bill_city, ba.state AS bill_state, ba.zip_code AS bill_zip, 
    sa.line1 AS ship_line1, sa.line2 AS ship_line2, 
    sa.city AS ship_city, sa.state AS ship_state, sa.zip_code AS ship_zip 
FROM customers c 
    JOIN addresses ba ON c.billing_address_id  = ba.address_id
    JOIN addresses sa ON c.shipping_address_id = sa.address_id