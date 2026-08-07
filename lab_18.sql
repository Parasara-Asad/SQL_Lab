--Part – A:
--1. Display the details of students whose SPI is greater than the average SPI.

SELECT * FROM STUDENT
WHERE SPI > (
				SELECT AVG(SPI) FROM STUDENT
			);

--2. Display the names of students whose SPI is less than the average SPI.

SELECT * FROM STUDENT
WHERE SPI < (
				SELECT AVG(SPI) FROM STUDENT
			);

--3. Display the student details who has the highest SPI. 

SELECT * FROM STUDENT
WHERE SPI = (
				SELECT MAX(SPI) FROM STUDENT
			);

--4. Display the student details who has the lowest SPI.

SELECT * FROM STUDENT
WHERE SPI = (
				SELECT MIN(SPI) FROM STUDENT
			);


--5. Display the students whose SPI is greater than SPI of student DHARMIK.

SELECT * FROM STUDENT
WHERE SPI > (
				SELECT SPI FROM STUDENT
				WHERE SNAME='DHARMIK'
			);

--6. Display the students whose SPI is less than SPI of student RIYA.

SELECT * FROM STUDENT
WHERE SPI < (
				SELECT SPI FROM STUDENT
				WHERE SNAME='RIYA'
			);

--7. Display the students who belong to the same branch as KRUNAL.

SELECT * FROM STUDENT
WHERE BRANCH IN (
				SELECT BRANCH FROM STUDENT
				WHERE SNAME='KRUNAL'
			);

--8. Display the students whose branch is different from HETVI.

SELECT * FROM STUDENT
WHERE BRANCH NOT IN (
				SELECT BRANCH FROM STUDENT
				WHERE SNAME='HETVI'
			);

--9. Display the second highest SPI from RESULT table.

SELECT MAX(SPI) FROM RESULT
WHERE SPI < (
				SELECT MAX(SPI) FROM RESULT
			);

--10. Display the second lowest SPI from RESULT table.

SELECT MIN(SPI) FROM RESULT
WHERE SPI > (
				SELECT MIN(SPI) FROM RESULT
			);

--11. Display the names of students whose SPI is above branch-wise average SPI.

SELECT SNAME,BRANCH FROM STUDENT
	WHERE SPI > (
					SELECT AVG(SPI) FROM STUDENT
				)
	GROUP BY BRANCH,SNAME

--12. Display the branch having maximum average SPI.

SELECT BRANCH FROM STUDENT
GROUP BY BRANCH
HAVING AVG(SPI) = (
					SELECT TOP 1 AVG(SPI) FROM STUDENT
					GROUP BY BRANCH
					ORDER BY AVG(SPI) DESC
				)
				

--13. Display the branch having minimum average SPI. 

SELECT BRANCH FROM STUDENT
GROUP BY BRANCH
HAVING AVG(SPI) = (
					SELECT TOP 1 AVG(SPI) FROM STUDENT
					GROUP BY BRANCH
					ORDER BY AVG(SPI) 
				)

--Part – B:
--14. Display the students whose SPI is greater than all students of ME branch. 

SELECT S.RNO, S.NAME, S.BRANCH, R.SPI
FROM 
STUDENT_INFO AS S JOIN RESULT AS R
ON S.RNO = R.RNO
WHERE R.SPI > ALL  (
					SELECT R1.SPI
					FROM 
					STUDENT_INFO AS S1 JOIN RESULT R1
					ON S1.RNO = R1.RNO
					WHERE S1.BRANCH = 'ME'
				);


--15. Display the students whose SPI is less than any student of ME branch.

SELECT S.RNO, S.NAME, S.BRANCH, R.SPI
FROM 
STUDENT_INFO AS S JOIN RESULT AS R
ON S.RNO = R.RNO
WHERE R.SPI < ALL (
					SELECT R1.SPI
					FROM 
					STUDENT_INFO AS S1 JOIN RESULT R1
					ON S1.RNO = R1.RNO
					WHERE S1.BRANCH = 'ME'
				);


--16. Display the student details whose SPI is not equal to any SPI of EC branch students. 

SELECT S.RNO, S.NAME, S.BRANCH, R.SPI
FROM 
STUDENT_INFO AS S JOIN RESULT AS R
ON S.RNO = R.RNO
WHERE R.SPI NOT IN (
					SELECT R1.SPI
					FROM 
					STUDENT_INFO AS S1 JOIN RESULT R1
					ON S1.RNO = R1.RNO
					WHERE S1.BRANCH = 'EC'
				);

--17. Display the names of students who scored higher SPI than student of RNO 103.

SELECT S.RNO, S.NAME, S.BRANCH, R.SPI
FROM 
STUDENT_INFO AS S JOIN RESULT AS R
ON S.RNO = R.RNO
WHERE R.SPI > (
					SELECT R1.SPI
					FROM 
					STUDENT_INFO AS S1 JOIN RESULT R1
					ON S1.RNO = R1.RNO
					WHERE S1.RNO = 103
				);

--18. Display the students whose SPI is greater than average SPI of their own branch. 



select * from STUDENT;
select * from STUDENT_INFO
SELECT * FROM RESULT