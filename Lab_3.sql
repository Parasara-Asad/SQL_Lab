--Retrieve all data from table STUDENT

SELECT * FROM STUDENT;

--Display Student Name and City from STUDENT

SELECT SNAME,CITY FROM STUDENT;

--Display student details of all students who belongs to COMPUTER branch

SELECT * FROM STUDENT
WHERE BRANCH = 'COMPUTER';

--Display names of students whose ID is less than 105 from STUDENT table

SELECT * FROM STUDENT
WHERE STDID < 105;

--Give Student Name, City and SPI of student whose SPI is greater than 6.50. 

SELECT SNAME,CITY,SPI FROM STUDENT
WHERE SPI > 6.50;

--Give name of Student whose branch is COMPUTER and SPI is greater than 8.00

SELECT SNAME FROM STUDENT
WHERE SPI>8 AND BRANCH = 'COMPUTER';

--Give names of students whose ID is greater than 103 and belongs to Rajkot city

SELECT SNAME FROM STUDENT
WHERE STDID > 103 AND CITY = 'RAJKOT';

--Display names of students who belong to either ‘RAJKOT’ or ‘SURAT’ city (USE OR & IN)

SELECT SNAME FROM STUDENT
WHERE CITY='SURAT' OR CITY = 'RAJKOT';

SELECT SNAME FROM STUDENT
WHERE CITY IN ('RAJKOT','SURAT');

--Display names of students with branch whose SPI is greater than 8.0 and ID is less than 105

SELECT SNAME,BRANCH FROM STUDENT
WHERE SPI > 8 AND STDID < 105;

--Find all students whose SPI is greater than or equal to 7.0 and less than or equal to 9.0 (USE AND &BETWEEN).

SELECT * FROM STUDENT
WHERE SPI >=7 AND SPI <= 9;


SELECT * FROM STUDENT
WHERE SPI BETWEEN 7 AND 9;

--Find all students who do not belong to ‘COMPUTER’ branch

SELECT * FROM STUDENT
WHERE BRANCH <> 'COMPUTER'

--Display Student ID, Name & SPI of students who belong to ‘COMPUTER’, ‘CIVIL’ or ‘CHEMICAL’ branchand ID is less than 104. 

SELECT STDID,SNAME,SPI FROM STUDENT
WHERE BRANCH IN('COMPUTER', 'CIVIL','CHEMICAL') AND STDID < 104;

--Display all student IDs and names who do not belong to ‘COMPUTER’ or ‘CIVIL’ branch (USE NOT IN). 

SELECT  STDID,SNAME FROM STUDENT
WHERE BRANCH <> 'COMPUTER' AND BRANCH <> 'CIVIL';

--Display all student names other than ‘DEEP’ from STUDENT table (USE NOT, <>, !=). 

SELECT SNAME FROM STUDENT
WHERE SNAME <> 'DEEP';

SELECT SNAME FROM STUDENT
WHERE NOT SNAME = 'DEEP';

SELECT SNAME FROM STUDENT
WHERE SNAME != 'DEEP';


-- Display student names whose branch is not available (NULL) in STUDENT table
SELECT SNAME FROM STUDENT
WHERE BRANCH IS NULL;

--Retrieve all unique branches name from STUDENT table

SELECT DISTINCT BRANCH FROM STUDENT

--Retrieve first 50% records from STUDENT table.

SELECT TOP 50 PERCENT * FROM STUDENT;

--Retrieve first five student IDs from STUDENT table

SELECT TOP 5 STDID FROM STUDENT;

--19. Display all the details of first five students from STUDENT table

SELECT TOP 5 * FROM STUDENT;

--Display all the details of first three students whose SPI is greater than 8.0

SELECT TOP 3 * FROM STUDENT 
WHERE SPI > 8;

-- Display Student ID, Name of first five students whose branch does not belong to ‘COMPUTER’ branch. 

SELECT TOP 5 STDID,SNAME FROM STUDENT
WHERE BRANCH <> 'COMPUTER';

-- Select all details with student IDs not in the range 105 to 109. 

SELECT STDID FROM STUDENT
WHERE NOT STDID BETWEEN 105 AND 109;

--Select all records from STUDENT where SPI is greater than 7.0 and less than or equal to 9.0, and studentID is between 102 and 108. 

SELECT * FROM STUDENT
WHERE SPI > 7 AND SPI <= 9 AND STDID BETWEEN 102 AND 108;

--Display all details of students who have SPI more than 8.5 without using * from STUDENT table

SELECT STDID,SNAME,CITY,SPI,BRANCH FROM STUDENT
WHERE SPI <= 8.5;

-- Retrieve names of students whose city is ‘RAJKOT’ and SPI is less than 8.00. 

SELECT SNAME FROM STUDENT
WHERE CITY = 'RAJKOT' AND SPI < 8;

--Retrieve records from STUDENT table where SPI is greater than 8.0 and student ID is less than 105. 

SELECT * FROM STUDENT
WHERE SPI > 8 AND STDID < 105;

--Retrieve records from STUDENT table where SPI is greater than 7.5 and student ID is between 100 and 110 and city is ‘RAJKOT’ or ‘SURAT’.

SELECT * FROM STUDENT
WHERE SPI > 7.5 AND STDID BETWEEN 100 AND 110 AND CITY IN ('RAJKOT','SURAT');

--Display details of students who belong to ‘CIVIL’ or ‘MECHANICAL’ branch and SPI is greater than 8.0

SELECT * FROM STUDENT
WHERE BRANCH IN ('MECHANICAL' , 'CIVIL') AND SPI >8;