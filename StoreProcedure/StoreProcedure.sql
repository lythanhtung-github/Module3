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
DELIMITER //

CREATE PROCEDURE getCusById (IN cusNum INT(11))
BEGIN
  SELECT * FROM customers WHERE customerNumber = cusNum;
END //
DELIMITER ;

call getCusById(175);

DELIMITER //
CREATE PROCEDURE GetCustomersCountByCity(IN in_city VARCHAR(50), OUT total INT)
BEGIN
    SELECT COUNT(customerNumber) INTO total FROM customers
    WHERE city = in_city;
END//
DELIMITER ;

CALL GetCustomersCountByCity('Lyon',@total);
SELECT @total;
DELIMITER //

CREATE PROCEDURE SetCounter(INOUT counter INT, IN inc INT)
BEGIN
    SET counter = counter + inc;
END//
DELIMITER ;

SET @counter = 1;	
CALL SetCounter(@counter,1); -- 2

CALL SetCounter(@counter,1); -- 3

CALL SetCounter(@counter,5); -- 8

SELECT @counter; -- 8