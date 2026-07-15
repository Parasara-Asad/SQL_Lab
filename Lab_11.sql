--Write a query to display the current date & time. Label the column Today_Date. 

SELECT GETDATE() AS Today_Date;

-- Write a query to find new date after 365 day with reference to today. 

SELECT DATEADD(DAY, 365, GETDATE()) AS New_Date;

-- Display the current date in a format that appears as may 5 1994 12:00AM. 

SELECT FORMAT(GETDATE(), 'MMM d yyyy hh:mm');

--Display the current date in a format that appears as 03 Jan 1995.

SELECT FORMAT(GETDATE(), 'dd MMM yyyy');

-- Display the current date in a format that appears as Jan 04, 96. 

SELECT FORMAT(GETDATE(), 'MMM dd,yy');

--Write a query to find out total number of months between 31-Dec-08 and 31-Mar-09. 

SELECT DATEDIFF(MONTH, '2008-12-31', '2009-03-31') AS Total_Months;

--Write a query to find out total number of hours between 25-Jan-12 7:00 and 26-Jan-12 10:30. 

SELECT DATEDIFF(HOUR, '25-Jan-12 7:00', '26-Jan-12 10:30') AS TOTAL_NUMBER_HOUR;

--8. Write a query to extract Day, Month, Year from given date 12-May-16. 

SELECT
    DAY('2016-05-12') AS Day,
    MONTH('2016-05-12') AS Month,
    YEAR('2016-05-12') AS Year;

--Write a query that adds 5 years to current date. 

SELECT DATEADD(YEAR, 5, GETDATE()) AS New_Date;

--Write a query to subtract 2 months from current date. 

SELECT DATEADD(MONTH,-2,GETDATE());

-- Extract month from current date using datename () and datepart () function.

SELECT DATENAME(MONTH, GETDATE()) AS Month_Name,
       DATEPART(MONTH, GETDATE()) AS Month_Number;

--Write a query to find out last date of current month. 

SELECT EOMONTH(GETDATE());

--Calculate your age in years and months. 

SELECT DATEDIFF(YY,'2007-02-05',GETDATE()) AS AGE,
       DATEDIFF(mm,'2007-02-05',GETDATE()) AS MONTHS,
       DATEDIFF(dd,'2007-02-05',GETDATE()) AS DAY,


--  Display all records where account date is in the year 2025

SELECT * FROM DEPOSIT
WHERE YEAR(ADATE) = 2025;

--Display all records where account date is in the month of March. 

SELECT * FROM DEPOSIT
WHERE MONTH(ADATE) = 03;

--Display records where account date is after ‘01-Jan-2025’.

SELECT * FROM DEPOSIT
WHERE ADATE > '2025-01-01';

--Display records where account date is before ‘01-Jan-2025’. 

SELECT * FROM DEPOSIT
WHERE ADATE < '2025-01-01';

-- Display records where day of account date is 1.

SELECT * FROM DEPOSIT
WHERE DAY(ADATE) = 1

-- Display records where month of account date is greater than 6. 

SELECT * FROM DEPOSIT
WHERE MONTH(ADATE) >6

--Display records where year of account date is 2026. 

SELECT * FROM DEPOSIT
WHERE YEAR(ADATE) = 2026

--Display number of accounts opened in each year

SELECT DISTINCT
YEAR(ADATE),COUNT(*) FROM DEPOSIT
GROUP BY YEAR(ADATE);

--Display number of accounts opened in each month. 

SELECT DISTINCT
MONTH(ADATE)AS MONTHS,COUNT(*) AS TOTAL FROM DEPOSIT
GROUP BY MONTH(ADATE);

--Display maximum amount deposited in each year.

SELECT DISTINCT
YEAR(ADATE)AS YEARS,MIN(AMOUNT) AS TOTAL FROM DEPOSIT
GROUP BY YEAR(ADATE);

--. Display minimum amount deposited in each month. 

SELECT DISTINCT
MONTH(ADATE)AS MONTHS,MIN(AMOUNT) AS TOTAL FROM DEPOSIT
GROUP BY MONTH(ADATE);

--  Display total amount deposited in each year.

SELECT DISTINCT
YEAR(ADATE)AS YEARS,SUM(AMOUNT) AS TOTAL FROM DEPOSIT
GROUP BY YEAR(ADATE);

--Display records where account date is between ‘01-Mar-2025’ and ‘31-Dec-2025’.

SELECT * FROM DEPOSIT
WHERE ADATE BETWEEN '2025-03-01' AND '2025-12-31'

--Display records where account date is in the current year.

SELECT * FROM DEPOSIT
WHERE YEAR(ADATE) = YEAR(GETDATE())

--Display difference in days between today’s date and account date. 

SELECT ABS(DATEDIFF(dd,GETDATE(),ADATE)) FROM DEPOSIT










