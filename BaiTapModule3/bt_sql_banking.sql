use banking;
/**
	# Tao function don gian
SET GLOBAL log_bin_trust_function_creators = 1;
delimiter //
create function sumAB(a Integer, b Integer)
returns Integer
begin
	#if, else, while....
    #declare
	return a + b;
end //
# Tao procedure them san pham
use qlbh;
delimiter //
create procedure sp_insertProduct(
	IN sMaSP char(4),
    IN sTenSP varchar(40),
    IN sDVT varchar(20),
    IN sNuocSX varchar(40),
    IN sGia decimal(10,2),
    OUT sMessage varchar(100)
)
begin
	declare flag boolean;
	set sMessage = "";
    set flag = true;	#Neu flag = true thi insert
	if(exists (SELECT MaSP FROM qlbh.sanpham where MaSP = sMaSP)) then
		set sMessage = "Ma SP da ton tai";
        set flag = false;
	end if;
    
	if(flag = true) then
		insert into sanpham(MaSP, TenSP, DVT, NuocSX, Gia) values (sMaSP, sTenSP, SDVT,sNuocSX, sGia);
        set sMessage = "Them thanh cong";
	end if;
end //
**/

delimiter //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_customer` (
	IN sFullName varchar(100),
    IN sEmail varchar(50),
    IN sPhone varchar(11),
    IN sAddress varchar(50)
)
begin
	INSERT INTO `customers` (`full_name`, `email`, `phone`, `address`, `balance`, `created_at`, `deleted`) 
        VALUES (sFullName, sEmail, sPhone, sAddress, '0', now(), '0');
end //

delimiter //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_deposit` (
	IN sCustomerId integer,
    IN sTransactionAmount decimal(12,0)
)
begin
	INSERT INTO `deposits` (`created_at`, `deleted`, `customer_id`, `transaction_amount`) 
    VALUES (now(), '0', sCustomerId, sTransactionAmount);
end //

delimiter //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_withdraws` (
	IN sCustomerId integer,
    IN sTransactionAmount decimal(12,0)
)
begin
	INSERT INTO  `banking`.`withdraws` (`created_at`, `deleted`, `customer_id`, `transaction_amount`) 
    VALUES (now(), '0', sCustomerId, sTransactionAmount);
end //

delimiter //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_transfers` (
	IN sFees INT, 
    IN sFeesAmount DECIMAL(12,0),
    IN sTransactionAmount decimal(12,0),
    IN sTransferAmount decimal(12,0),
    IN sRecipientId BIGINT, 
    IN sSenderId BIGINT
)
begin
	INSERT INTO  `banking`.`transfers` (
		`created_at`, 
		`deleted`, 
        `fees`, 
        `fees_amount`, 
        `transaction_amount`,
        `transfer_amount`,
        `recipient_id`,
		`sender_id`
	) 
    VALUES (
		now(), 
		'0', 
		sFees, 
		sFeesAmount, 
		sTransactionAmount, 
		sTransferAmount, 
		sRecipientId, 
		sSenderId
        );
end //

-- 3. chuyển tiền (transfers)
-- - id: k cần nhập;
-- - created_at = now();
-- - created_by : null
-- - deleted: 0
-- - updated_at: null;
-- - updated_by: 
-- - fees: 5%
-- - fees_amount = 5% * số tiền chuyển khoản
-- - transaction_amount: số tiền giao dịch = số tiền chuyển khoản + phí
-- - transfer_amount: số tiền chuyển khoản
-- - recipient_id: id người nhận
-- - sender_id: id người gửi

delimiter //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deposits`(
	IN sFullName varchar(100),
    IN sEmail varchar(50),
    IN sPhone varchar(11),
    IN sAddress varchar(50),
    IN sTransactionAmount decimal(12,0)
)
begin
	declare total decimal(12,0);
    declare sCustomerId integer;
    
    # Kiem tra customer_id co ton tai hay chua
    if(not exists (SELECT `email` FROM `customers` where `email` COLLATE utf8mb4_0900_ai_ci like sEmail)) then 
		call sp_insert_customer(sFullName, sEmail, sPhone, sAddress);
    end if;
    
    set sCustomerId = (SELECT id FROM `customers` where `email` COLLATE utf8mb4_0900_ai_ci like sEmail);
	call sp_insert_deposit(sCustomerId, sTransactionAmount);
    
    set total = (SELECT balance from customers where id = sCustomerId);
    set total = total + sTransactionAmount;
    
    UPDATE `customers` SET `balance` = total WHERE (`id` = sCustomerId);
    UPDATE `customers` SET `updated_at` = now() WHERE (`id` = sCustomerId);
end //



/*
1. nộp tiền (deposits)
2. rút tiền (with draws)
3. chuyển tiền (transfers)
*/

-- 2. Rút tiền (with draws)
-- - id: auto không cần nhập
-- - created_at: now()
-- - created_by: không có
-- - deleted: 0;
-- - updated_at: không, 
-- - update_by: không, 
-- - customer_id: id khách hàng, 
-- - transaction_amount: số tiền cần rút

delimiter //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_withdraws`(
	IN sFullName varchar(100),
    IN sEmail varchar(50),
    IN sPhone varchar(11),
    IN sAddress varchar(50),
    IN sTransactionAmount decimal(12,0),
    OUT sMessage varchar(100)
)
begin
	declare transactionAmount decimal(12,0);
	declare total decimal(12,0);
    declare sCustomerId integer;
    set sMessage = "";
    
    if(not exists (SELECT `email` FROM `customers` where `email` COLLATE utf8mb4_0900_ai_ci like sEmail)) then 
		set sMessage = "Khách hàng chưa có trong hệ thống!";
    end if;
    
	if(exists (SELECT `email` FROM `customers` where `email` COLLATE utf8mb4_0900_ai_ci like sEmail)) then 
		set sCustomerId = (SELECT id FROM `customers` where `email` COLLATE utf8mb4_0900_ai_ci like sEmail);
		if( exists( SELECT `balance` FROM `customers` WHERE id = sCustomerId and sTransactionAmount <= `balance`)) then
			call sp_insert_withdraws(sCustomerId, sTransactionAmount);
			set total = (SELECT balance from customers where id = sCustomerId);
			set total = total - sTransactionAmount;
			UPDATE `customers` SET `balance` = total WHERE (`id` = sCustomerId);
            UPDATE `customers` SET `updated_at` = now() WHERE (`id` = sCustomerId);
			set sMessage = "Thành công!";
        else
			set sMessage = "Số tiền muốn rút lớn hơn số tiền hiện có trong tài khoản";
        end if;
    end if;
    
end //

-- 3. chuyển tiền (transfers)
-- - id: k cần nhập;
-- - created_at = now();
-- - created_by : null
-- - deleted: 0
-- - updated_at: null;
-- - updated_by: 
-- - fees: 5%
-- - fees_amount = 5% * số tiền chuyển khoản
-- - transaction_amount: số tiền giao dịch = số tiền chuyển khoản + phí
-- - transfer_amount: số tiền chuyển khoản
-- - recipient_id: id người nhận
-- - sender_id: id người gửi

delimiter //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_transfers`(
	IN sFullNameSender varchar(100),
    IN sEmailSender varchar(50),
    IN sPhoneSender varchar(11),
    IN sAddressSender varchar(50),
    IN sFullNameRecipient varchar(100),
    IN sEmailRecipient varchar(50),
    IN sPhoneRecipient varchar(11),
    IN sAddressRecipient varchar(50),
    IN sTransferAmount decimal(12,0),
    IN sFees INT,
	OUT sMessage varchar(100)
)
begin
	declare sTransactionAmount decimal(12,0);
    declare sCustomerIdSender integer;
    declare sCustomerIdRecipient integer;
    declare sFeesAmount DECIMAL(12,0);
    set sMessage = "";
    
    set sFeesAmount = (sTransferAmount * sFees)/100;
    set sTransactionAmount = sTransferAmount + sFeesAmount;
    
    if(not exists (SELECT `email` FROM `customers` where `email` COLLATE utf8mb4_0900_ai_ci like sEmailSender)) then 
		call sp_insert_customer(
								sFullNameSender, 
								sEmailSender, 
								sPhoneSender, 
								sAddressSender
                                );
        set sCustomerIdSender = (SELECT id FROM `customers` where `email` COLLATE utf8mb4_0900_ai_ci like sEmailSender);
		UPDATE `customers` SET `balance` = `sTransactionAmount` WHERE (`id` = sCustomerIdSender);
    end if;
    
    if(not exists (SELECT `email` FROM `customers` where `email` COLLATE utf8mb4_0900_ai_ci like sEmailRecipient)) then 
		set sMessage = "Người nhận chưa có trong hệ thống!";
	else
		set sCustomerIdRecipient = (SELECT id FROM `customers` where `email` COLLATE utf8mb4_0900_ai_ci like sEmailRecipient);
		set sCustomerIdSender = (SELECT id FROM `customers` where `email` COLLATE utf8mb4_0900_ai_ci like sEmailSender);
		if( exists( SELECT `balance` FROM `customers` WHERE id = sCustomerIdSender and `balance` >= sTransactionAmount)) then
			call `sp_withdraws`(sFullNameSender, 
								sEmailSender, 
								sPhoneSender, 
                                sAddressSender, 
								sTransactionAmount, 
                                sMessage);
            call `sp_deposits`(sFullNameRecipient, 
								sEmailRecipient, 
								sPhoneRecipient, 
                                sAddressRecipient, 
								sTransferAmount);
            call `sp_insert_transfers` (sFees , sFeesAmount, sTransactionAmount, sTransferAmount, sCustomerIdRecipient, sCustomerIdSender);
			set sMessage = "Chuyển tiền thành công!";
		else
			 set sMessage = "Số tiền muốn chuyển lớn hơn số tiền hiện có trong tài khoản";
        end if;
    end if;
    
end //

