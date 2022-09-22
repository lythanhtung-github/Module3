USE quanlysinhvien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT * FROM subject 
WHERE credit = (SELECT MAX(credit) FROM subject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT * FROM subject 
WHERE subID = (
SELECT subID FROM mark 
WHERE mark = (SELECT MAX(mark) FROM mark)
);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần.
SELECT *, AVG(m.mark) FROM student s 
INNER JOIN mark m ON s.studentID = m.studentID
GROUP BY s.studentID
ORDER BY AVG(m.mark) DESC;