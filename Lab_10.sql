--Display the result of 5 multiply by 30

SELECT 5*30 AS RESULT

--Find out the absolute value of -25, 25, -50 and 50. 

SELECT ABS(-25) AS absolute_VALUE
SELECT ABS(25) AS absolute_VALUE
SELECT ABS(-50) AS absolute_VALUE
SELECT ABS(50) AS absolute_VALUE

--Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2.

SELECT 
    CEILING(25.2) AS value1,
    CEILING(25.7) AS value2,
    CEILING(-25.2) AS value3;

--Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2.

SELECT 
    FLOOR(25.2) AS value1,
    FLOOR(25.7) AS value2,
    FLOOR(-25.2) AS value3;

-- Find out remainder of 5 divided 2 and 5 divided by 3. 

SELECT 5 % 2 AS remainder, 
       5 % 3 AS remainder;

--Find out value of 3 raised to 2nd power and 4 raised 3rd power. 

SELECT POWER(3,2) AS POWER_3_2,
         POWER(4,3) AS POWER_4_3;

--Find out the square root of 25, 30 and 50. 

SELECT SQRT(25),
        SQRT(30),
        SQRT(50);

--Find out the square of 5, 15, and 25. 

SELECT SQUARE(5),
        SQUARE(15),
        SQUARE(25);
       
--Find out the value of PI.

SELECT PI() AS PI_VALUE

--Find out round value of 157.732 for 2, 0 and -2 decimal points.

SELECT ROUND(157.732,2),
        ROUND(157.732,0),
        ROUND(157.732,-2);

--Find out exponential value of 2 and 3. 

SELECT EXP(2),EXP(3);

-- Find out logarithm having base e of 10 and 2.

SELECT LOG10(2),LOG(2);

--Find logarithm base 10 of 5 and 100 

SELECT LOG10(5),LOG10(100);

--Find sine, cosine and tangent of 3.1415. 

SELECT 
    SIN(3.1415) AS sine_val,
    COS(3.1415) AS cosine_val,
    TAN(3.1415) AS tangent_val;

-- Find sign of -25, 0 and 25. 

SELECT SIGN(-25),SIGN(0),SIGN(25);

--Generate random number using function. 

SELECT RAND();

--Find the length of following. (I) NULL    (II) ‘   hello     ’   (III)  Blank 

SELECT LEN(NULL),LEN('HELLO'),LEN('');

--Display your name in lower & upper case. 

SELECT LOWER('ASAD'),UPPER('asad');

--Display first three characters of your name.

SELECT LEFT('ASAD',3);

--Display 3rd to 10th character of your name. 

SELECT SUBSTRING('PARASARA ASAD',3,10)

--Write a query to convert ‘abc123efg’ to ‘abcXYZefg’ & ‘abcabcabc’ to ‘ab5ab5ab5’ using REPLACE.

SELECT 
    REPLACE('abc123efg', '123', 'XYZ'),
    REPLACE('abcabcabc', 'c', '5');

--Write a query to display ASCII code for ‘a’,’A’,’z’,’Z’, 0, 9. 

SELECT ASCII('a'),ASCII('A'),ASCII('z'),ASCII('Z'),ASCII(0),ASCII(9);

--Write a query to display character based on number 97, 65,122,90,48,57.

SELECT CHAR(97),CHAR(65),CHAR(122),CHAR(90),CHAR(48),CHAR(57);

--Write a query to remove spaces from left of a given string ‘ hello world 

SELECT LTRIM('    HELLO WORLD');

--Write a query to remove spaces from right of a given string ‘ hello world 

SELECT RTRIM('HELLO WORLD          ');

--Write a query to display first 4 & Last 5 characters of ‘SQL Server’. 

SELECT 
    LEFT('SQL Server', 4),
    RIGHT('SQL Server', 5);

--. Write a query to convert a string ‘1234.56’ to number (Use cast and convert function).

SELECT CAST('1234.56' AS DECIMAL(6,2))

--Write a query to convert a float 10.58 to integer (Use cast and convert function). 

SELECT CAST(10.58 AS INT)

-- Put 10 space before your name using function.

SELECT SPACE(10)+'ASAD';

--Combine two strings using + sign as well as CONCAT (). 

SELECT CONCAT('ASAD',' ','PARASARA');

SELECT 'ASAD' + ' ' +'PARASARA';

-- Find reverse of “Darshan”.

SELECT REVERSE('Darshan')

--Repeat your name 3 times. 

SELECT REPLICATE('ASAD ',3);

--Display FIRSTNAME and LASTNAME in lowercase and uppercase. 

SELECT LOWER(FIRSTNAME),LOWER(LASTNAME),UPPER(FIRSTNAME),UPPER(LASTNAME) FROM EMPLOYEE;

--Display full name by combining FIRSTNAME and LASTNAME. 

SELECT CONCAT(FIRSTNAME,' ',LASTNAME) FROM EMPLOYEE

-- Display FIRSTNAME with first 3 characters only. 

SELECT LEFT(FIRSTNAME,3)FROM EMPLOYEE;

-- Display LASTNAME with last 2 characters only. 

SELECT RIGHT(LASTNAME,2)FROM EMPLOYEE;

--Display length of each employee’s FIRSTNAME.

SELECT LEN(FIRSTNAME) FROM EMPLOYEE;

--Display FIRSTNAME after replacing ‘A’ with ‘@’.

SELECT REPLACE(FIRSTNAME,'A','@') FROM EMPLOYEE

-- Display FIRSTNAME and LASTNAME with - between them using CONCAT. 
SELECT CONCAT(FIRSTNAME,'-',LASTNAME) FROM EMPLOYEE

-- Display FIRSTNAME without first and last character.

SELECT SUBSTRING(FIRSTNAME,2,LEN(FIRSTNAME)-2) FROM EMPLOYEE

-- Display employees where combined length of FIRSTNAME and LASTNAME is greater than 10. 

SELECT * FROM EMPLOYEE
WHERE LEN(CONCAT(FIRSTNAME,' ',LASTNAME)) > 10;

--Display FIRSTNAME and its reverse.

SELECT FIRSTNAME,REVERSE(FIRSTNAME) FROM EMPLOYEE;

--Display employees whose FIRSTNAME and LASTNAME start with same character using LEFT() 

SELECT * FROM EMPLOYEE
WHERE LEFT(FIRSTNAME,1) = LEFT(LASTNAME,1);