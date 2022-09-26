USE classicmodels;

select * from customers;

DELIMITER //
create procedure findAllCustomers()
begin
	select * from customers;
end //
    
call findAllCustomers();


DELIMITER //
DROP PROCEDURE IF EXISTS findAllCustomers//

DELIMITER //
CREATE PROCEDURE findAllCustomers()

BEGIN

SELECT * FROM customers where customerNumber = 175;

END //

call findAllCustomers();
    