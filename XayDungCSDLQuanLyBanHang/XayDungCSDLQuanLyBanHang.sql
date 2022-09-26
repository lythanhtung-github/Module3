CREATE DATABASE QuanLyBanHang;

USE QuanLyBanHang;

CREATE TABLE Customer(
	cID INT AUTO_INCREMENT PRIMARY KEY,
    cName VARCHAR(50) NOT NULL,
    cAge INT NOT NULL
		CHECK (cAge>=18)
);

CREATE TABLE Product(
	pID INT AUTO_INCREMENT PRIMARY KEY,
    pName VARCHAR(50) NOT NULL UNIQUE,
    pPrice DOUBLE NOT NULL
		CHECK (pPrice >=0)
);

CREATE TABLE Order_order(
	oID INT AUTO_INCREMENT PRIMARY KEY,
    cID INT NOT NULL,
    oDate DATE NOT NULL,
    oTotalPrice DOUBLE NOT NULL,
    FOREIGN KEY (cID) REFERENCES Customer(cID)
);

CREATE TABLE OrderDetail(
	oID INT NOT NULL,
    pID INT NOT NULL,
    odQTY INT NOT NULL
		CHECK  (odQTY > 0),
	PRIMARY KEY (oID, pID),
	FOREIGN KEY (oID) REFERENCES Order_order(oID),
    FOREIGN KEY (pID) REFERENCES Product(pID)
);