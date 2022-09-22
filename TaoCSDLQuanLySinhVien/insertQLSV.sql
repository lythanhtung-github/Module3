USE quanlysinhvien;

INSERT INTO class (className, startDate, status) VALUE ("C0622G1", "2022-09-22", 1);
INSERT INTO class (className, startDate, status) VALUE ("C0522G1", "2022-08-22", 1);
INSERT INTO class (className, startDate, status) VALUE ("C0422G1", "2022-07-22", 1);
INSERT INTO class (className, startDate, status) VALUE ("C0322G1", "2022-06-22", 0);


INSERT INTO student(studentName, address, phone, status, classID) VALUE ("Lý Thanh Tùng", "Thừa Thiên Huế", "0987654321",1,1);
INSERT INTO student(studentName, address, phone, status, classID) VALUE ("Lê Bá Lộc", "Thừa Thiên Huế", "0987654322",1,1);
INSERT INTO student(studentName, address, phone, status, classID) VALUE ("Võ Văn Tài", "Hà Tĩnh", "0987654323",0,2);
INSERT INTO student(studentName, address, phone, status, classID) VALUE ("Nguyễn Văn Quý", "Quảng Trị", "0987654326",0,3);
INSERT INTO student(studentName, address, phone, status, classID) VALUE ("Trần Văn Hướng", "Quảng Bình", "0987654329",0,4);

INSERT INTO subject(subName, credit, status) VALUE ("Java",1,1);
INSERT INTO subject(subName, credit, status) VALUE ("HTML",2,1);
INSERT INTO subject(subName, credit, status) VALUE ("CSS",3,1);
INSERT INTO subject(subName, credit, status) VALUE ("JS",4,1);

INSERT INTO mark(subID, studentID, mark, examTimes) VALUE (1,1,9.8,9);
INSERT INTO mark(subID, studentID, mark, examTimes) VALUE (2,2,9.9,9);
INSERT INTO mark(subID, studentID, mark, examTimes) VALUE (3,3,5,9);
INSERT INTO mark(subID, studentID, mark, examTimes) VALUE (4,5,10,8);