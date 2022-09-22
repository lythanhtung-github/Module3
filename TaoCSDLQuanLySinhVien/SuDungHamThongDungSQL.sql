USE quanlysinhvien;

-- Hiển thị số lượng sinh viên ở từng nơi
SELECT address, COUNT(address) as "Số lượng học viên" 
FROM student
GROUP BY address;

-- Tính điểm trung bình các môn học của mỗi học viên
SELECT s.studentName, AVG(m.mark) as "Điểm trung bình"
FROM student s
INNER JOIN mark m
ON s.studentID = m.studentID
GROUP BY s.studentName;

-- Hiển thị những bạn học viên có điểm trung bình các môn học lớn hơn 5
SELECT s.studentName as "Tên", AVG(m.mark) as "Điểm trung bình"
FROM student s
INNER JOIN mark m
ON s.studentID = m.studentID
GROUP BY s.studentName
HAVING (AVG(m.mark)>5);

-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
SELECT s.studentName as "Tên", AVG(mark) as "Điểm trung bình"
FROM student s JOIN mark m ON s.studentID = m.studentID	
GROUP BY s.studentName	
HAVING AVG(mark) >= ALL(SELECT AVG(mark) FROM mark GROUP BY mark.studentID);