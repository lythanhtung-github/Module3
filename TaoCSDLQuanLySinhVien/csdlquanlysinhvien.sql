create DATABASE QuanLySinhVien;
use QuanLySinhVien;

CREATE TABLE Class(
	classID INT AUTO_INCREMENT PRIMARY KEY,
    className VARCHAR(60) NOT NULL,
    startDate DATETIME NOT NULL,
    status BIT
);

CREATE TABLE Student(
	studentID INT AUTO_INCREMENT PRIMARY KEY,
    studentName VARCHAR(30) NOT NULL,
    address VARCHAR(50),
    phone VARCHAR(20),
    status BIT,
    classID INT NOT NULL,
    FOREIGN  KEY (classID) REFERENCES Class(classID)
);

CREATE TABLE Subject(
	subID INT AUTO_INCREMENT PRIMARY KEY,
    subName VARCHAR(30) NOT NULL,
    credit TINYINT NOT NULL DEFAULT 1 CHECK (credit >=1),
    status BIT DEFAULT 1
);

CREATE TABLE Mark(
	markID INT AUTO_INCREMENT PRIMARY KEY,
    subID INT NOT NULL UNIQUE,
    studentID INT NOT NULL UNIQUE,
    mark FLOAT DEFAULT 0 CHECK (mark BETWEEN 0 AND 100),
    examTimes TINYINT DEFAULT 1,
    FOREIGN KEY (subID) REFERENCES Subject(subID),
    FOREIGN KEY (studentID) REFERENCES Student(studentID)
);