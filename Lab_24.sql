--From the table EMPLOYEE perform the following queries:  
--Part – A:  

--1. Create a stored procedure to generate department-wise salary statistics like total salary, average 
--salary, minimum salary, and maximum salary. (User enter only department name)

CREATE PROC PR_DEPARTMENT_SALARY
    @DEPARTMENT VARCHAR(50)
AS
BEGIN
    SELECT 
        DEPARTMENT,
        SUM(SALARY) AS TOTAL_SALARY,
        AVG(SALARY) AS AVG_SALARY,
        MIN(SALARY) AS MIN_SALARY,
        MAX(SALARY) AS MAX_SALARY
    FROM EMPLOYEE
    WHERE DEPARTMENT = @DEPARTMENT
    GROUP BY DEPARTMENT;
END


EXEC PR_DEPARTMENT_SALARY 'IT'



--2. Create a stored procedure that accepts a joining year and displays employees who joined that year.

CREATE PROC PR_JOINED_YEAR
    @JOIN_YEAR INT
    AS
BEGIN
    SELECT * FROM EMPLOYEE
    WHERE @JOIN_YEAR = JOININGYEAR;
END

EXEC PR_JOINED_YEAR 2026

--3. Create a stored procedure for dynamic employee search using parameters (User may enter partial city name). 


CREATE OR ALTER PROC PR_SEARCH_EMPLOYEE
    @CITY VARCHAR(10)
    AS
BEGIN
    SELECT * FROM EMPLOYEE
    WHERE CITY LIKE  @CITY +'%'
END

EXEC PR_SEARCH_EMPLOYEE 'RA'


SELECT * FROM EMPLOYEE

--4. Create a stored procedure that accepts a salary amount and displays employees earning more than the entered salary.

CREATE PROC PR_SALARY_AMOUNT
    @SALARY DECIMAL(7,2)
    AS
BEGIN
    SELECT * FROM EMPLOYEE
    WHERE SALARY > @SALARY
END

EXEC PR_SALARY_AMOUNT 12000.00

SELECT * FROM EMPLOYEE

--5. Create a stored procedure to display top N highest paid employees from each department (Value of N is entered by user). 

CREATE OR ALTER PROC PR_TOP_PAID_EMPLOYEES
    @TOP INT
AS
BEGIN
    SELECT * FROM
    (
        SELECT *,
            DENSE_RANK() OVER
            (
                PARTITION BY DEPARTMENT
                ORDER BY SALARY DESC
            ) AS RN
        FROM EMPLOYEE
    ) AS T
    WHERE RN <= @TOP;
END

EXEC PR_TOP_PAID_EMPLOYEES 1;

--6. Create a stored procedure to increase salary department-wise by a given percentage. 
--(User Enter Department Name and %, e.g. Computer 10). 

CREATE OR ALTER PROC PR_INCREASE_SALARY
    @DEPARTMENT VARCHAR(50),
    @INCREASE INT
AS
BEGIN
    UPDATE EMPLOYEE
    SET SALARY = SALARY + (SALARY * @INCREASE / 100.0)
    WHERE DEPARTMENT = @DEPARTMENT;
END

EXEC PR_INCREASE_SALARY 'IT', 10;


--7. Create a stored procedure to display employees having experience greater than or equal to the entered years.

CREATE OR ALTER PROC PR_DISPLAY_EXPIENCE
    @EXP INT
AS
BEGIN
    SELECT *
    FROM EMPLOYEE
    WHERE JOININGYEAR >= @EXP;
END

EXEC PR_DISPLAY_EXPIENCE 2025;


SELECT * FROM EMPLOYEE

--8. Create a stored procedure that accepts a number as input and displays details of the last N employees who joinedthe organization.

CREATE OR ALTER PROC PR_LAST_N_EMPLOYEES
    @TOP INT
AS
BEGIN
    SELECT *
    FROM
    (
        SELECT *,
            DENSE_RANK() OVER
            (
                ORDER BY JOININGYEAR DESC
            ) AS RN
        FROM EMPLOYEE
    ) AS T
    WHERE RN <= @TOP;
END

EXEC PR_LAST_N_EMPLOYEES 3;

--From the table AUTHOR, PUBLISHER and BOOK perform the following queries:  
--Part – B:  
--9. Create a stored procedure that accepts an author name and displays all books written by that author.

CREATE OR ALTER PROC PR_AUTHOR_BOOK
    @AUTHOR_NAME VARCHAR(30)
AS
BEGIN
    SELECT 
        A.AUTHORNAME,
        B.TITLE
    FROM AUTHOR A
    INNER JOIN BOOK B
        ON A.AUTHORID = B.AUTHORID
    WHERE A.AUTHORNAME = @AUTHOR_NAME;
END

EXEC PR_AUTHOR_BOOK 'Chetan Bhagat';

--10. Create a stored procedure that accepts a publication year and displays books published after that year. 


SELECT * FROM AUTHOR
SELECT * FROM BOOK
SELECT * FROM  PUBLISHER