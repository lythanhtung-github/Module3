USE quanlysinhvien;

SELECT * FROM class;

SELECT * FROM student;

SELECT * FROM subject;

SELECT * FROM mark;

SELECT * FROM student WHERE Status = true;

SELECT * FROM Subject WHERE credit < 2 OR credit >3;

SELECT * FROM student s JOIN class c ON s.classID = c.classID;

SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID
WHERE C.ClassName = 'C0622G1';

SELECT S.StudentId AS "ID", S.StudentName AS "Họ tên", Sub.SubName AS "Môn học", M.Mark AS "Điểm"
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId;

SELECT S.StudentId AS "ID", S.StudentName AS "Họ tên", Sub.SubName AS "Môn học", M.Mark AS "Điểm"
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = "JS";