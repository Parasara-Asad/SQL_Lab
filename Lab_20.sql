--Part – A: 
--1. Display rank of students based on SPI. 

SELECT * ,
RANK() OVER(ORDER BY SPI DESC) AS SPI_RANK
FROM STUDENT

--2. Display dense rank of students based on SPI. 

SELECT *,
DENSE_RANK() OVER(ORDER BY SPI) AS DENSE_RANK
FROM STUDENT

--3. Display sequential number for each student record. 

SELECT *,
ROW_NUMBER() OVER(ORDER BY SPI) AS ROW_RANK
FROM STUDENT

--4. Display branch-wise rank of students. 

SELECT *,
ROW_NUMBER() OVER(PARTITION BY BRANCH ORDER BY SPI)
FROM STUDENT


--5. Display branch-wise dense ranking of students. 

SELECT *,
DENSE_RANK() OVER(PARTITION BY BRANCH ORDER BY SPI) 
FROM STUDENT


--6. Display branch-wise sequential numbering of students. 

SELECT *,
ROW_NUMBER() OVER(PARTITION BY BRANCH ORDER BY SPI) 
FROM STUDENT

--7. Display SNAME, Current SPI, Previous SPI and SPI Difference with previous student in ascending order of SPI. 

SELECT SNAME,SPI,
			LAG(SPI)OVER(ORDER BY SPI ASC) AS PREVIOUS ,
			SPI-LAG(SPI)OVER(ORDER BY SPI ASC) AS DIFRRERENCE
FROM STUDENT

--8. Display SNAME, Current SPI, Next SPI and SPI Difference with next student in descending order of SPI.  

SELECT SNAME,SPI,
			LEAD(SPI)OVER(ORDER BY SPI DESC) AS Current_SPI ,
			SPI-LAG(SPI)OVER(ORDER BY SPI DESC) AS DIFRRERENCE
FROM STUDENT


--9. Display top 3 students based on SPI. 

SELECT * FROM 
	(
	SELECT STDID,SNAME,BRANCH,SPI,
	RANK()OVER(ORDER BY SPI DESC) AS RK
	FROM STUDENT
	) AS R
WHERE RK<=3


--10. Display top 2 students from each branch.

SELECT * FROM 
	(
	SELECT STDID,SNAME,BRANCH,SPI,
	RANK()OVER(PARTITION BY BRANCH ORDER BY SPI DESC) AS RK
	FROM STUDENT
	) AS R
WHERE RK<=2


--Part – B: 
--11. Display 5th highest SPI. 

SELECT * FROM 
	(
	SELECT STDID,SNAME,BRANCH,SPI,
	DENSE_RANK() OVER (ORDER BY SPI DESC) AS RK
	FROM STUDENT
	) AS R
WHERE RK=5

--12. Display 6th highest SPI.

SELECT * FROM 
	(
	SELECT STDID,SNAME,BRANCH,SPI,
	DENSE_RANK() OVER (ORDER BY SPI DESC) AS RK
	FROM STUDENT
	) AS R
WHERE RK=6

--13. Display students having same ranking. 

SELECT STDID,SNAME,BRANCH,SPI,
	RANK()OVER(ORDER BY SPI DESC) AS RK
	FROM STUDENT
	WHERE SPI IN 
	(
	SELECT SPI FROM STUDENT
	GROUP BY SPI
	HAVING COUNT(*)>1
	)

--14. Display SNAME, Previous SPI, Current SPI and Next SPI based on ascending order of SPI. 

SELECT SNAME,SPI,
			LAG(SPI)OVER(ORDER BY SPI ASC) AS PREVIOUS ,
			LEAD(SPI)OVER(ORDER BY SPI ASC) AS Next_SPI
FROM STUDENT


--15. Display topper of each branch. 

SELECT * FROM 
	(
	SELECT STDID,SNAME,BRANCH,SPI,
	DENSE_RANK() OVER (PARTITION BY BRANCH ORDER BY SPI) AS RK
	FROM STUDENT
	) AS R
WHERE RK=1

--Part – C: 
--16. Display students whose SPI is greater than the previous student and less than the next student. 

SELECT * FROM
	(
			SELECT SNAME,SPI,
			LAG(SPI)OVER(ORDER BY SPI ASC) AS PREVIOUS,
			LEAD(SPI)OVER(ORDER BY SPI ASC) AS Next_SPI
			FROM STUDENT
	) AS E
WHERE SPI > PREVIOUS AND SPI < Next_SPI

--17. Display branch-wise second topper students. 

SELECT * FROM 
	(
	SELECT STDID,SNAME,BRANCH,SPI,
	DENSE_RANK() OVER (PARTITION BY BRANCH ORDER BY SPI) AS RK
	FROM STUDENT
	) AS R
WHERE RK=2

--18. Display students whose rank and dense rank are different. 
SELECT SNAME,SPI,RN,RK FROM 
	(
	SELECT SNAME,SPI,
	RANK() OVER  (ORDER BY SPI DESC) AS RN,
	DENSE_RANK() OVER ( ORDER BY SPI DESC) AS RK
	FROM STUDENT
	) AS R
WHERE RK<>RN


--19. Display consecutive students having same branch ordered by SPI. 



--20. Display students whose SPI difference with previous student is maximum. 


