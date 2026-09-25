--Part – A: 
--1. Create a table valued function to display all student records. 

CREATE OR ALTER FUNCTION DISPLAY_ALL_STD()
RETURNS TABLE
AS
RETURN
(
    SELECT * 
    FROM Student
);

SELECT * FROM DBO.DISPLAY_ALL_STD()

--2. Create a table valued function that accepts CITY and returns all students from that city. 

CREATE OR ALTER FUNCTION FIND_CITY
(
@CITY VARCHAR(30)
)
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM Student
    WHERE @CITY = CITY
);

SELECT * FROM DBO.FIND_CITY('RAJKOT')

--3. Create a table valued function that accepts BRANCH and returns all students of that branch. 

CREATE OR ALTER FUNCTION FIND_BRANCH
(
@BRANCH VARCHAR(30)
)
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM Student
    WHERE @BRANCH = BRANCH
);

SELECT * FROM DBO.FIND_BRANCH('EC')

--4. Create a table valued function that accepts SPI and returns students whose SPI is greater than entered SPI. 

CREATE OR ALTER FUNCTION FIND_GREATER_SPI
(
    @SPI DECIMAL(4,2)
)
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM Student
    WHERE @SPI < SPI
);

SELECT * FROM DBO.FIND_GREATER_SPI(9)

--5. Create a table valued function that accepts MIN_SPI and MAX_SPI and returns students whose SPI lies between given range. 

CREATE OR ALTER FUNCTION MAX_MIN_RANGE
(
    @MIN DECIMAL(4,2),
    @MAX DECIMAL(4,2)
)
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM Student
    WHERE SPI BETWEEN @MIN AND @MAX
);

SELECT * FROM DBO.MAX_MIN_RANGE(8,9);

--Part – B:  
--6. Create a table valued function that accepts STDID and returns details of that student. 

CREATE OR ALTER FUNCTION STD_DETAILS
(
    @STDID INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM STUDENT
    WHERE STDID = @STDID
);

SELECT * FROM DBO.STD_DETAILS(101)

--7. Create a table valued function that accepts CITY and returns students whose SPI is greater than 7 from that city. 

CREATE OR ALTER FUNCTION SPI_GREATER_7
(
    @CITY VARCHAR(30)
)
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM STUDENT
    WHERE CITY = @CITY  AND SPI > 7
);

SELECT * FROM DBO.SPI_GREATER_7('RAJKOT')

--8. Create a table valued function that accepts BRANCH and returns students whose SPI is less than 8 from that branch. 

CREATE OR ALTER FUNCTION BRANCH_LESS_8
(
    @BRANCH VARCHAR(30)
)
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM STUDENT
    WHERE BRANCH = @BRANCH  AND SPI < 8
);

SELECT * FROM DBO.BRANCH_LESS_8('COMPUTER')

--9. Create a table valued function that accepts TOP N and returns top N students based on SPI. 

CREATE OR ALTER FUNCTION TOP_N_STUDENT
(
    @NUM INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT TOP (@NUM) * FROM STUDENT
    ORDER BY SPI DESC
);

SELECT  * FROM DBO.TOP_N_STUDENT(2)

--10. Create a table valued function that accepts BRANCH and returns highest SPI student from that branch. 

CREATE OR ALTER FUNCTION BRANCH_HIGHEST_SPI
(
    @BRANCH VARCHAR(30)
)
RETURNS TABLE
AS
RETURN
(
   SELECT TOP 1 * FROM STUDENT
   WHERE BRANCH = @BRANCH
   ORDER BY SPI DESC
);

SELECT  * FROM DBO.BRANCH_HIGHEST_SPI('COMPUTER')

--Part – C: 
--11. Create a table valued function that accepts CITY and returns total students from that city.

CREATE OR ALTER FUNCTION SCALAR_CITY_TOTAL_STD
(
    @CITY VARCHAR(30)
)
RETURNS INT
AS
BEGIN
    DECLARE @Total INT;
    SELECT @Total = COUNT(*) 
    FROM Student 
    WHERE City = @CITY;

    RETURN @Total;
END;


SELECT dbo.SCALAR_CITY_TOTAL_STD('Rajkot')

--12. Create a table valued function that accepts BRANCH and returns students ordered by SPI in descending order. 

CREATE OR ALTER FUNCTION BRANCH_SPI_DEC
(
    @BRANCH VARCHAR(30)
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        *,
        ROW_NUMBER() OVER (ORDER BY SPI DESC) AS RK 
    FROM Student
    WHERE BRANCH = @BRANCH
);

SELECT * FROM dbo.BRANCH_SPI_DEC('COMPUTER')
ORDER BY SPI DESC;


--13. Create a table valued function that accepts CITY and returns top 3 student from that city based on SPI. 

CREATE OR ALTER FUNCTION TOP_3_STD_BY_CITY
(
    @CITY VARCHAR(30)
)
RETURNS TABLE
AS
RETURN
(
    SELECT TOP 3 *
    FROM STUDENT
    WHERE CITY = @CITY
    ORDER BY SPI DESC
);

SELECT * FROM dbo.TOP_3_STD_BY_CITY('Rajkot');

--14. Create a table valued function that accepts STDID and returns student rank based on SPI (RANK). 

CREATE OR ALTER FUNCTION GET_STD_RANK_BY_ID
(
    @STDID INT
)
RETURNS TABLE
AS
RETURN
(
    WITH RankedStudents AS
    (
        SELECT 
            *,
            RANK() OVER (ORDER BY SPI DESC) AS StudentRank
        FROM Student
    )
    SELECT *
    FROM RankedStudents
    WHERE STDID = @STDID 
);

SELECT * FROM dbo.GET_STD_RANK_BY_ID(101);

--15. Create a table valued function that accepts BRANCH and returns students having second highest SPI . 

CREATE OR ALTER FUNCTION SECOND_HIGHEST_SPI_BY_BRANCH
(
    @BRANCH VARCHAR(30)
)
RETURNS TABLE
AS
RETURN
(
    WITH BranchRanking AS
    (
        SELECT 
            *,
            DENSE_RANK() OVER (ORDER BY SPI DESC) AS Rk
        FROM Student
        WHERE Branch = @BRANCH
    )
    SELECT *
    FROM BranchRanking
    WHERE Rk = 2
);

SELECT * FROM dbo.SECOND_HIGHEST_SPI_BY_BRANCH('COMPUTER');