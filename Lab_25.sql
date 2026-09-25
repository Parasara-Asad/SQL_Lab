--From the table STUDENT perform the following queries:  
--Part – A: 
--1. Implement scalar function to return "Welcome to DBMS Lab".

CREATE OR ALTER FUNCTION WELCOME_MSG()
RETURNS VARCHAR(30)
AS 
BEGIN
	RETURN 'Welcome to DBMS Lab'
END

SELECT DBO.WELCOME_MSG();

-- 2. Implement scalar function to calculate simple interest

CREATE OR ALTER FUNCTION SIMPLE_INTEREST
(
    @P INT,
    @R INT,
    @T INT
)
RETURNS INT
AS
BEGIN
    DECLARE @ANS INT;

    SET @ANS = (@P * @R * @T) / 100;

    RETURN @ANS;
END;

SELECT DBO.SIMPLE_INTEREST(10,10,10)

-- 3. Implement scalar function to find difference in days between two dates

CREATE OR ALTER FUNCTION DAY_DIFFERENCE
(
    @DATE1 DATE,
    @DATE2 DATE
)
RETURNS INT
AS
BEGIN
    DECLARE @ANS INT;

    SET @ANS = DATEDIFF(DAY, @DATE1, @DATE2);

    RETURN @ANS;
END;

SELECT DBO.DAY_DIFFERENCE('2025-06-02','2025-06-5')

--4. Implement scalar function to check whether number is odd or even. 

CREATE OR ALTER FUNCTION NUM_EVEN_ODD
(
    @NUM INT
)
RETURNS VARCHAR(30)
AS
BEGIN
    DECLARE @ANS VARCHAR(30);
    IF(@NUM % 2 = 0)
        SET @ANS = 'NUMBER IS EVEN'
    ELSE
        SET @ANS = 'NUMBER IS ODD'
    RETURN @ANS;
END;

SELECT DBO.NUM_EVEN_ODD(11)

-- 5. Implement scalar function to print numbers from 1 to N

CREATE OR ALTER FUNCTION PRINT_NUMBER_1_TO_N
(
    @NUM INT
)
RETURNS VARCHAR(8000)
AS
BEGIN
          DECLARE @I INT = 1;
    DECLARE @ANS VARCHAR(8000) = '';

    WHILE (@I <= @NUM)
    BEGIN
        SET @ANS = @ANS + CAST(@I AS VARCHAR(10)) + ' ';
        SET @I = @I + 1;
    END

    RETURN @ANS;
END;

SELECT DBO.PRINT_NUMBER_1_TO_N(12)


--Part – B:  
-- 6. Implement scalar function to calculate factorial of given number

CREATE OR ALTER FUNCTION FIND_FACT
(
    @NUM INT
)
RETURNS INT
AS
BEGIN
    DECLARE @I INT = 1;
    DECLARE @ANS INT = 1;

    WHILE (@I <= @NUM)
    BEGIN
        SET @ANS = @ANS * @I;
        SET @I = @I + 1;
    END

    RETURN @ANS;
END;

SELECT DBO.FIND_FACT(5)

-- 7. Implement scalar function to check palindrome number

CREATE OR ALTER FUNCTION FIND_PALINDROME
(
    @NUM INT
)
RETURNS VARCHAR(30)
AS
BEGIN
    DECLARE @ANS VARCHAR(30);
    DECLARE @REM INT;
    DECLARE @REV INT = 0;
    DECLARE @TEMP INT = @NUM;

    WHILE (@NUM <> 0)
    BEGIN
        SET @REM = @NUM % 10;
        SET @REV = @REV * 10 + @REM;
        SET @NUM = @NUM / 10;
    END

    IF (@TEMP = @REV)
        SET @ANS = 'Palindrome number';
    ELSE
        SET @ANS = 'NOT palindrome number';

    RETURN @ANS;
END;

SELECT DBO.FIND_PALINDROME(121)

--8. Implement scalar function to find maximum of three numbers. 

CREATE OR ALTER FUNCTION FIND_MAX_OF_THREE
(
    @NUM1 INT,
    @NUM2 INT,
    @NUM3 INT
)
RETURNS INT
AS
BEGIN
    DECLARE @ANS INT;

    IF(@NUM1 >= @NUM2 AND @NUM1 >= @NUM3)
        SET @ANS = @NUM1;
    ELSE IF(@NUM2 >= @NUM1 && @NUM2 >= @NUM3)
        SET @ANS = @NUM2;
    ELSE
        SET @ANS = @NUM3;

    RETURN @ANS
END;

SELECT DBO.FIND_MAX_OF_THREE(1,2,5)

--9. Implement scalar function to calculate square and cube of a number.