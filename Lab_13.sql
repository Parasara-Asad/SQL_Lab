--Part – A:
--1. Combine information from Student and Result table using cross join (Cartesian product). 

SELECT * 
FROM STUDENT_INFO CROSS JOIN RESULT

--2. Perform inner join on Student and Result tables

SELECT * 
FROM STUDENT_INFO AS S JOIN RESULT AS R
ON S.RNO = R.RNO;

--3. Perform the left outer join on Student and Result tables

SELECT * 
FROM STUDENT_INFO AS S LEFT OUTER JOIN RESULT AS R
ON S.RNO = R.RNO;

--4. Perform the right outer join on Student and Result tables

SELECT * 
FROM STUDENT_INFO AS S RIGHT OUTER JOIN RESULT AS R
ON S.RNO = R.RNO;

--5. Perform the full outer join on Student and Result tables. 

SELECT * 
FROM STUDENT_INFO AS S FULL OUTER JOIN RESULT AS R
ON S.RNO = R.RNO;

--6. Display Rno, Name, Branch and SPI of all students.

SELECT * FROM RESULT;
SELECT * FROM STUDENT_INFO

SELECT S.RNO,S.NAME,S.BRANCH,R.SPI
FROM STUDENT_INFO AS S JOIN RESULT AS R
ON S.RNO = R.RNO

--7. Display Rno, Name, Branch and SPI of CE branch students only. 

SELECT S.RNO,S.NAME,S.BRANCH,R.SPI
FROM STUDENT_INFO AS S JOIN RESULT AS R
ON S.RNO = R.RNO
WHERE BRANCH='CE';

--8. Display Rno, Name, Branch and SPI of students other than EC branch. 

SELECT S.RNO,S.NAME,S.BRANCH,R.SPI
FROM STUDENT_INFO AS S JOIN RESULT AS R
ON S.RNO = R.RNO
WHERE BRANCH<>'EC';

--9. Display Rno, Name and SPI of students whose SPI is greater than 8. 

SELECT S.RNO,S.NAME,S.BRANCH,R.SPI
FROM STUDENT_INFO AS S JOIN RESULT AS R
ON S.RNO = R.RNO
WHERE R.SPI > 8;

--10. Display Rno, Name and Branch of students whose SPI is less than 8. 

SELECT S.RNO,S.NAME,S.BRANCH,R.SPI
FROM STUDENT_INFO AS S JOIN RESULT AS R
ON S.RNO = R.RNO
WHERE R.SPI < 8;

--11. Display average result of each branch.

SELECT S.BRANCH,AVG(SPI)
FROM STUDENT_INFO AS S JOIN RESULT AS R
ON R.RNO = S.RNO
GROUP BY S.BRANCH;

--12. Display average result of CE and ME branch. 

SELECT S.BRANCH,AVG(SPI)
FROM STUDENT_INFO AS S JOIN RESULT AS R
ON R.RNO = S.RNO
WHERE S.BRANCH = 'CE' OR S.BRANCH='ME'
GROUP BY S.BRANCH;

--13. Display maximum and minimum SPI of each branch

SELECT S.BRANCH,MAX(SPI) AS MAX_SPI,MIN(SPI) AS MIN_SPI
FROM STUDENT_INFO AS S JOIN RESULT AS R
ON R.RNO = S.RNO
GROUP BY S.BRANCH;


--14. Display branch-wise student count in descending order. 

SELECT STUDENT_INFO.BRANCH, COUNT(*) AS TOTAL_STUDENT 
FROM STUDENT_INFO JOIN RESULT
ON STUDENT_INFO.RNO=RESULT.RNO
GROUP BY BRANCH 
ORDER BY COUNT(*) DESC

--15. Display branch-wise total SPI of students. 

SELECT STUDENT_INFO.BRANCH, SUM(RESULT.SPI) AS TOTAL_SPI 
FROM STUDENT_INFO INNER JOIN RESULT
ON STUDENT_INFO.RNO=RESULT.RNO
GROUP BY BRANCH

--Part – B:

--16. Display branch-wise number of students having SPI greater than 8.

SELECT S.BRANCH, COUNT(*) AS TOTAL_STUDENT
FROM STUDENT_INFO AS S INNER JOIN RESULT AS R
ON S.RNO=R.RNO 
WHERE SPI > 8
GROUP BY BRANCH

--17. Display branch-wise number of students having SPI less than 8.

SELECT S.BRANCH, COUNT(*) AS TOTAL_STUDENT
FROM STUDENT_INFO AS S INNER JOIN RESULT AS R
ON S.RNO=R.RNO 
WHERE SPI < 8
GROUP BY BRANCH

--18. Display branch-wise average SPI greater than 7.

SELECT S.BRANCH,AVG(SPI) AS AVG_SPI
FROM STUDENT_INFO AS S JOIN RESULT AS R
ON R.RNO = S.RNO
WHERE R.SPI>7
GROUP BY S.BRANCH;

--19. Display branches having more than 1 students

SELECT S.BRANCH, COUNT(*)
FROM STUDENT_INFO AS S INNER JOIN RESULT AS R
ON S.RNO=R.RNO 
GROUP BY BRANCH
HAVING COUNT(*) > 1


--20. Display branches where maximum SPI is greater than 9. 

SELECT S.BRANCH,MAX(SPI) AS MAX_SPI
FROM STUDENT_INFO AS S JOIN RESULT AS R
ON R.RNO = S.RNO
GROUP BY S.BRANCH
HAVING MAX(SPI) > 9;

--Part – C:

--21. Display average result of each branch and sort them in ascending order by SPI. 

SELECT S.BRANCH,AVG(SPI) AS AVG_SPI
FROM STUDENT_INFO AS S JOIN RESULT AS R
ON R.RNO = S.RNO
GROUP BY S.BRANCH
ORDER BY AVG(SPI) ASC

--22. Display highest SPI from each branch and sort them in descending order.

SELECT S.BRANCH,MAX(SPI) AS MAX_SPI
FROM STUDENT_INFO AS S JOIN RESULT AS R
ON R.RNO = S.RNO
GROUP BY S.BRANCH
ORDER BY MAX(SPI) DESC;

--23. Display average result of each branch and sort them in ascending order by SPI. 

SELECT S.BRANCH,AVG(SPI) AS AVG_SPI
FROM STUDENT_INFO AS S JOIN RESULT AS R
ON R.RNO = S.RNO
GROUP BY S.BRANCH
ORDER BY AVG(SPI) ASC

--24. Display highest SPI from each branch and sort them in descending order. 

SELECT S.BRANCH,MAX(SPI) AS MAX_SPI
FROM STUDENT_INFO AS S JOIN RESULT AS R
ON R.RNO = S.RNO
GROUP BY S.BRANCH
ORDER BY MAX(SPI) DESC;

--25. Display branches where difference between max and min SPI is greater than 1

SELECT S.BRANCH
FROM STUDENT_INFO AS S INNER JOIN RESULT AS R
ON S.RNO=R.RNO
GROUP BY BRANCH
HAVING MAX(SPI) - MIN(SPI) > 1
