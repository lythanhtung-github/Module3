USE quanlysinhvien;

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
SELECT * FROM student WHERE studentName like "h%";

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 09.
SELECT * FROM student s INNER JOIN class c ON s.classID = c.classID  WHERE c.startDate like "%-09-%";

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
SELECT * FROM subject WHERE credit BETWEEN 3 AND 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
UPDATE student SET classID = 2 WHERE studentName = 'Hung';

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
SELECT student.StudentName as "Họ tên" , subject.SubName as "Môn học", mark.Mark as "Điểm" 
FROM student, subject, mark
ORDER BY mark DESC, studentName ASC ;