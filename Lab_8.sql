--Display the Highest, Lowest Salary and Label the columns Maximum, Minimum respectively.

SELECT MAX(SALARY) AS Maximum,MIN(SALARY) AS Minimum
FROM EMPLOYEE;

--Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal,respectively. 

SELECT SUM(SALARY) AS Total_Sal,AVG(SALARY) AS Average_Sal
FROM EMPLOYEE;

--Find total number of employees of EMPLOYEE table. 

SELECT COUNT(*) AS EMPLOYEE_COUNT
FROM EMPLOYEE;

--Find highest salary from Rajkot city.

SELECT MAX(SALARY) AS  highest_salary 
FROM EMPLOYEE
WHERE CITY = 'RAJKOT';

--Give maximum salary from IT department. 

SELECT MAX(SALARY) AS  highest_salary 
FROM EMPLOYEE
WHERE DEPARTMENT = 'IT';

--Count employee department is HR. 

SELECT COUNT(*) AS HR_COUNT
FROM EMPLOYEE
WHERE DEPARTMENT = 'HR';

--Display average salary of Admin department. 

SELECT AVG(SALARY) AS ADMIN_AVG_SALARY
FROM EMPLOYEE
WHERE DEPARTMENT = 'ADMIN';

--Display total salary of HR department. 

SELECT SUM(SALARY) AS HR_SALARY_SUM
FROM EMPLOYEE
WHERE DEPARTMENT = 'HR';

--Count total number of cities of employee without duplication

SELECT COUNT(DISTINCT CITY) AS CITY
FROM EMPLOYEE;

--Count unique departments. 

SELECT COUNT(DISTINCT DEPARTMENT) AS CITY
FROM EMPLOYEE

-- Display minimum salary of employee who belongs to Ahmedabad. 

SELECT MIN(SALARY) AS minimum_SALARY
FROM EMPLOYEE
WHERE CITY = 'AHMEDABAD';

--Find city wise highest salary.

SELECT CITY,MAX(SALARY) AS HIGHEST_SALARY
FROM EMPLOYEE
GROUP BY CITY;

--Find department wise lowest salary

SELECT DEPARTMENT,MIN(SALARY) AS HIGHEST_SALARY
FROM EMPLOYEE
GROUP BY DEPARTMENT;

--Display minimum salary in each city. 

SELECT CITY,MIN(SALARY) AS MIN_SALARY
FROM EMPLOYEE
GROUP BY CITY;

--Display average salary of employees from Surat.

SELECT CITY,AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEE
WHERE CITY = 'SURAT';

--Display total salary of female employees. 

SELECT GENDER,SUM(SALARY) AS AVG_SALARY_FEMALE
FROM EMPLOYEE
WHERE GENDER = 'FEMALE'
GROUP BY GENDER;

--Count number of male employees

SELECT GENDER,COUNT(SALARY) AS AVG_SALARY_FEMALE
FROM EMPLOYEE
WHERE GENDER = 'MALE'
GROUP BY GENDER;

--Display city with the total number of employees belonging to each city. 

SELECT CITY,COUNT(*) AS TOTAL_EMPLOYEES
FROM EMPLOYEE
GROUP BY CITY;

-- Count number of employees in each city where gender is MALE. 

SELECT CITY,COUNT(*) AS MALE_EMPLOYEES_COUNT
FROM EMPLOYEE
WHERE GENDER = 'MALE'
GROUP BY CITY;

--Display maximum salary in each department where city is not Ahmedabad. 

SELECT DEPARTMENT,MAX(SALARY) AS MALE_EMPLOYEES_COUNT
FROM EMPLOYEE
WHERE DEPARTMENT <> 'AHMEDABAD'
GROUP BY DEPARTMENT;

--Display minimum salary in each city where gender is FEMALE. 

SELECT CITY,MIN(SALARY) AS MIN_EMPLOYEES
FROM EMPLOYEE
WHERE GENDER = 'FEMALE'
GROUP BY CITY;

--Give total salary of each department of EMPLOYEE table. 

SELECT DEPARTMENT,SUM(SALARY) AS DEPARTMENT
FROM EMPLOYEE
GROUP BY DEPARTMENT;

--Give average salary of each department of EMPLOYEE table without displaying the respective department name. 

SELECT DEPARTMENT,AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEE
GROUP BY DEPARTMENT;

--Count the number of employees for each department in every city.

SELECT DEPARTMENT,CITY,COUNT(*) AS COUNT_DEPARTMENT
FROM EMPLOYEE
GROUP BY CITY,DEPARTMENT;

--Calculate the total salary distributed to male and female employees. 

SELECT GENDER,SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEE
GROUP BY GENDER;

--Give city wise maximum and minimum salary of female employees.

SELECT CITY,MIN(SALARY) AS MIN_SALARY , MAX(SALARY) AS MAX_SALARY
FROM EMPLOYEE
GROUP BY CITY;

--Calculate department, city, and gender wise average salary. 

SELECT DEPARTMENT,GENDER,CITY,AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEE
GROUP BY CITY,DEPARTMENT,GENDER;

-- Display the difference between the highest and lowest salaries. Label the column DIFFERENCE. 

SELECT DIFFERENCE(MAX(SALARY),MIN(SALARY)) AS DIFFERENCE_MAX_MIN 
FROM EMPLOYEE;

--Display sum of salaries of department wise where department name consist 5 letter

SELECT DEPARTMENT,SUM(SALARY)  AS CONSIST_5_LETTER
FROM EMPLOYEE
WHERE DEPARTMENT LIKE '_____'
GROUP BY DEPARTMENT;

--Find the Maximum salary department & city wise in which city name starts with ‘R’

SELECT DEPARTMENT,MAX(SALARY) AS MAX_SALARY
FROM EMPLOYEE
WHERE CITY LIKE 'R%'
GROUP BY DEPARTMENT;