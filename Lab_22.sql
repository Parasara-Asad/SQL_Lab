CREATE TABLE CUSTOMER_ALL (
    ORDERID INT,
    CNAME VARCHAR(50),
    PRODUCT VARCHAR(50),
    CATEGORY VARCHAR(50),
    AMOUNT INT,
    ORDERYEAR INT,
    CITY VARCHAR(50)
);

INSERT INTO CUSTOMER_ALL VALUES
(101, 'RAHUL', 'LAPTOP', 'ELECTRONICS', 65000, 2024, 'RAJKOT'),
(102, 'PRIYA', 'MOBILE', 'ELECTRONICS', 25000, 2023, 'SURAT'),
(103, 'AMIT', 'TABLE', 'FURNITURE', 12000, 2022, 'AHMEDABAD'),
(104, 'NEHA', 'CHAIR', 'FURNITURE', 8000, 2024, 'BARODA'),
(105, 'VISHAL', 'TV', 'ELECTRONICS', 45000, 2025, 'MORBI'),
(106, 'RIYA', 'SOFA', 'FURNITURE', 30000, 2023, 'SURAT'),
(107, 'MEHUL', 'AC', 'ELECTRONICS', 40000, 2022, 'RAJKOT'),
(108, 'KRUNAL', 'BED', 'FURNITURE', 40000, 2025, 'JAMNAGAR');


--Part – A: 
--1. Display top 3 highest amount orders. 

WITH RankedOrders AS
    (
        SELECT *, 
        DENSE_RANK() OVER(ORDER BY AMOUNT DESC) as [Rank]
        FROM CUSTOMER_ALL
    )
SELECT * FROM RankedOrders WHERE [Rank] <= 3


--2. Display second highest order amount. 

WITH RankedOrders AS
    (
        SELECT *, 
        DENSE_RANK() OVER(ORDER BY AMOUNT DESC) as [Rank]
        FROM CUSTOMER_ALL
    )
SELECT * FROM RankedOrders
WHERE [Rank] = 2



--3. Display customers whose order amount is greater than category average amount. 

WITH CategoryAvg AS 
        (
            SELECT CATEGORY, AVG(AMOUNT) as AVG_AMOUNT
            FROM CUSTOMER_ALL
            GROUP BY CATEGORY
        )
SELECT c.CNAME, c.PRODUCT, c.AMOUNT, c.CATEGORY
FROM CUSTOMER_ALL c
JOIN CategoryAvg a ON c.CATEGORY = a.CATEGORY
WHERE c.AMOUNT > a.AVG_AMOUNT

--4. Display categories having average amount greater than 30000. 

WITH CategoryAvg AS 
        (
            SELECT CATEGORY, AVG(AMOUNT) as AVG_AMOUNT
            FROM CUSTOMER_ALL
            GROUP BY CATEGORY
        )
SELECT *
FROM CategoryAvg 
WHERE AVG_AMOUNT > 30000

--5. Display highest amount order from each category. 

WITH CategoryAvg AS 
        (
            SELECT CATEGORY, MAX(AMOUNT) as MAX_AMOUNT
            FROM CUSTOMER_ALL
            GROUP BY CATEGORY
        )
SELECT *
FROM CategoryAvg 



--6. Display lowest amount order from each category. 

WITH LOW_ORDER AS 
        (
            SELECT CATEGORY, MIN(AMOUNT) as MIN_AMOUNT
            FROM CUSTOMER_ALL
            GROUP BY CATEGORY
        )
SELECT *
FROM LOW_ORDER 

--7. Display categories having more than 3 orders.

WITH CategoryCount AS 
    (
        SELECT CATEGORY, COUNT(ORDERID) AS ORDER_MORE
        FROM CUSTOMER_ALL
        GROUP BY CATEGORY
    )
SELECT CATEGORY FROM CategoryCount 
WHERE ORDER_MORE > 3


--8. Display city-wise total order amount. 

WITH CategoryBYCITY AS 
    (
        SELECT CITY, SUM(AMOUNT) AS SUM_ALL
        FROM CUSTOMER_ALL
        GROUP BY CITY
    )
SELECT * FROM CategoryBYCITY 

--9. Display category having highest average order amount. 

WITH CATEGORY_AVG AS
(
    SELECT CATEGORY, AVG(AMOUNT) AS AVG_AMOUNT
    FROM CUSTOMER_ALL
    GROUP BY CATEGORY
)
SELECT CATEGORY, AVG_AMOUNT
FROM CATEGORY_AVG
WHERE AVG_AMOUNT = (SELECT MAX(AVG_AMOUNT) FROM CATEGORY_AVG);

--10. Display cumulative order amount in ascending order of amount. 


WITH CumulativeAmt AS 
        (
                SELECT ORDERID, CNAME, AMOUNT, 
                SUM(AMOUNT) OVER(ORDER BY AMOUNT ASC) as cumulative_amount
                FROM CUSTOMER_ALL
        )
SELECT * FROM CumulativeAmt


--Part – B: 
--11. Display category-wise top 2 highest amount orders. 

WITH TOP_2_AMOUNT_ORDER AS
    (
        SELECT *, 
        DENSE_RANK() OVER(PARTITION BY CATEGORY ORDER BY AMOUNT DESC) as [Rank]
        FROM CUSTOMER_ALL
    )
SELECT * FROM TOP_2_AMOUNT_ORDER
WHERE [Rank] <= 2

--12. Display customers whose amount is closest to category average amount. 

WITH CATEGORY_AVG_AMOUNT
As(
SELECT *,AVG(AMOUNT) OVER( PARTITION BY CATEGORY) AS A
FROM CUSTOMER_ALL
)
SELECT * FROM CATEGORY_AVG_AMOUNT AS C
WHERE ABS(AMOUNT-(A))=
        (
            SELECT MIN(ABS(AMOUNT-A)) FROM CATEGORY_AVG_AMOUNT  D WHERE D.CATEGORY=C.CATEGORY
        )

--13. Display previous, current and next order amount together. 

WITH CTE AS
(
    SELECt * ,
        LAG(Amount) OVER (ORDER BY OrderID) AS PreviousAmount,
        LEAD(Amount) OVER (ORDER BY OrderID) AS NextAmount
    FROM CUSTOMER_ALL
)
SELECT *,
    Amount AS CurrentAmount,
    NextAmount
FROM CTE;

--14. Display customers whose amount is greater than previous customer's amount. 

WITH CTE AS
(
    SELECT *,
        LAG(Amount) OVER (ORDER BY OrderID) AS PreviousAmount
    FROM CUSTOMER_ALL
)
SELECT *
FROM CTE
WHERE Amount > PreviousAmount;

--15. Display customers whose rank and dense rank are different.

WITH CTE AS
(
    SELECT *,
        RANK() OVER (ORDER BY Amount DESC) AS Rk,
        DENSE_RANK() OVER (ORDER BY Amount DESC) AS DRk
    FROM CUSTOMER_ALL
)
SELECT * FROM CTE
WHERE RK <> DRk;

--Part – C: 
--16. Display orders whose amount is neither highest nor lowest in their category. 

WITH CTE AS
(
    SELECT *,
        MAX(AMOUNT) OVER (PARTITION BY Category) AS MaxAmount,
        MIN(AMOUNT) OVER (PARTITION BY Category) AS MinAmount
    FROM CUSTOMER_ALL
)
SELECT * FROM CTE
WHERE Amount <> MaxAmount
  AND Amount <> MinAmount;

--17. Display category-wise difference between highest and lowest amount. 

WITH CTE AS
(
    SELECT *,
        MAX(Amount) OVER (PARTITION BY Category) AS MaxAmount,
        MIN(Amount) OVER (PARTITION BY Category) AS MinAmount
    FROM CUSTOMER_ALL
)
SELECT DISTINCT *,
    MaxAmount - MinAmount AS Difference
FROM CTE;

--18. Display customers whose amount is greater than all FURNITURE category orders.

WITH CTE AS
(
    SELECT * FROM CUSTOMER_ALL
)
SELECT *FROM CTE
WHERE Amount > ALL
(
    SELECT Amount
    FROM CUSTOMER_ALL
    WHERE Category = 'FURNITURE'
);

--19. Display categories where all orders are above 10000. 

WITH CTE AS
(
    SELECT
        Category,
        MIN(Amount) AS MinimumAmount
    FROM CUSTOMER_ALL
    GROUP BY Category
)
SELECT *
FROM CTE
WHERE MinimumAmount > 10000;

--20. Display customers whose amount difference from category topper is minimum. 

WITH CTE AS
(
    SELECT
        CustomerID,
        Category,
        Amount,
        MAX(Amount) OVER(PARTITION BY Category) AS CategoryTopper
    FROM CUSTOMER_ALL
),
CTE2 AS
(
    SELECT
        CustomerID,
        Category,
        Amount,
        CategoryTopper,
        CategoryTopper - Amount AS Difference
    FROM CTE
),
CTE3 AS
(
    SELECT
        *,
        MIN(Difference) OVER(PARTITION BY Category) AS MinimumDifference
    FROM CTE2
)
SELECT
    CustomerID,
    Category,
    Amount,
    CategoryTopper,
    Difference
FROM CTE3
WHERE Difference = MinimumDifference;