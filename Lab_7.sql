-- Display employees detail whose FIRSTNAME starts with ‘H’

SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE 'H%';

--Display employees detail whose FIRSTNAME consists of exactly 5 characters. 

SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE '_____';

--Display employees detail whose CITY ends with ‘T’ and has 6 characters.

SELECT * FROM EMPLOYEE
WHERE CITY LIKE '_____T';

--Display employees detail whose LASTNAME ends with ‘EL’.

SELECT * FROM EMPLOYEE
WHERE LASTNAME LIKE '%EL';

--Display employees detail whose FIRSTNAME starts with ‘R’ and ends with ‘A’.

SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE 'R%A'

--Display employees detail whose FIRSTNAME starts with ‘V’ and third character is ‘S’. 

SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE 'V_S%';

-- Display employees detail whose CITY is NULL and FIRSTNAME has 6 characters.

SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE '______' AND CITY IS NULL;

--Display employees detail whose FIRSTNAME contains ‘AR’.

SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE '%AR%'

-- Display employees detail whose CITY starts with ‘R’ or ‘B’.

SELECT * FROM EMPLOYEE
WHERE CITY LIKE '[RB]%'

--Display employees detail whose DEPARTMENT is NOT NULL. 

SELECT * FROM EMPLOYEE
WHERE DEPARTMENT LIKE '%';

--Display employees detail whose FIRSTNAME starts from alphabet A to H. 

SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE '[A-H]%';

--Display employees detail whose second character of FIRSTNAME is a vowel. 

SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE '_[AEIOU]%';

--Display employees detail whose FIRSTNAME length ≥ 5. 

SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE '_____%';

-- Display employees detail whose LASTNAME starts with ‘PA’

SELECT * FROM EMPLOYEE
WHERE LASTNAME LIKE 'PA%';

-- Display employees detail whose CITY does not start with ‘B’. 

SELECT * FROM EMPLOYEE
WHERE CITY LIKE '[^B]%';

--Display employees whose second character of FIRSTNAME is a not vowel. 

SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE '_[^AEIOU]%';

--Display employees whose JOINING YEAR last digit is 4 or 6. 

SELECT * FROM EMPLOYEE
WHERE JOININGYEAR LIKE '%[46]';

--Display employees detail whose FIRSTNAME starts with ‘H’, ends with ‘I’, and CITY contains ‘RA’. 

SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE 'H%I' AND CITY LIKE '%RA%' ;

-- Display employees detail whose FIRSTNAME contains ‘A’, CITY ends with ‘D’, and DEPARTMENT is NOT NULL. 

SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE '%A%' AND CITY LIKE '%D' AND  DEPARTMENT LIKE '%';

-- Display employees whose second and third characters of FIRSTNAME are vowels and CITY starts with ‘R

SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE '_[AEIOU][AEIOU]%' AND CITY LIKE 'R%';

--Display employees whose CITY contains ‘RA’ and salary less than 13000 and joining year last digit is 6. 

SELECT * FROM EMPLOYEE
WHERE CITY LIKE '%RA%' AND SALARY < 13000 AND JOININGYEAR LIKE '%6';

--Display employees whose SALARY between 10000 and 15000 and CITY name contains 'KO' and FIRSTNAME start with H

SELECT * FROM EMPLOYEE
WHERE CITY LIKE '%KO%' AND FIRSTNAME LIKE 'H%' AND SALARY BETWEEN 10000 AND 150000;

--Display employees whose FIRSTNAME starts with ‘A’ or ‘D’ and SALARY greater than 12000. 

SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE '[AD]%' AND SALARY > 12000;

-- Display employees whose CITY contains ‘N’ and SALARY less than 15000. 

SELECT * FROM EMPLOYEE
WHERE CITY LIKE '%N%' AND SALARY < 15000;

-- Display employees whose FIRSTNAME length = 6 and CITY ends with ‘AR’.

SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE '______' AND CITY LIKE '%AR';

-- Display employees whose FIRSTNAME ends with a vowel, department name start with vowel, and SALARY is between 10000 and 15000. 

SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE '%[AEIOU]' AND DEPARTMENT LIKE '[AEIOU]%' AND SALARY BETWEEN 10000 AND 150000 ;

--Display employees whose LASTNAME contains ‘A’ at least twice, gender is male, and SALARY is not equal to 14000. 

SELECT * FROM EMPLOYEE
WHERE LASTNAME LIKE '%A%A%' AND GENDER LIKE 'MALE' AND SALARY <> 14000;

--Display employees whose FIRSTNAME second character is vowel and LASTNAME ends with ‘R’ and SALARY less than 12000. 

SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE '_[AEIOU]%' AND LASTNAME LIKE '%R' AND SALARY < 12000;

--Display employees whose CITY is NOT NULL and FIRSTNAME does not start with vowel and DEPARTMENT not in (‘HR’, ‘IT’).

SELECT * FROM EMPLOYEE
WHERE CITY LIKE '%' AND FIRSTNAME LIKE '[^AEIOU]%' AND DEPARTMENT NOT IN ('HR','IT');

--Display employees whose CITY is not NULL, FIRSTNAME ends with vowels, and DEPARTMENT is neither ‘HR’ nor ‘IT’.

SELECT *FROM EMPLOYEE
WHERE CITY LIKE '%' AND FIRSTNAME LIKE '%[AEIOU]' AND DEPARTMENT NOT IN ('HR', 'IT');;



