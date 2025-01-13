-- 51. List the Emps who are senior to their own MGRS. (emp(Hiredate) > mgr(hiredate))
SELECT E1.* FROM EMP E1 JOIN EMP E2 ON E1.MGR=E2.EMPNO WHERE E1.HIREDATE>E2.HIREDATE; 

SELECT e1.* FROM EMP e1, EMP e2 WHERE e1.MGR=e2.EMPNO AND e1.HIREDATE>e2.HIREDATE;
-- 52. List the Emps of Deptno 20 whose Jobs are same as Deptno10.
SELECT DISTINCT e1.* FROM EMP e1 JOIN EMP e2 ON e1.JOB=e2.JOB WHERE e1.DEPTNO=10 AND e2.DEPTNO = 20;

-- 53. List the Emps whose Sal is same as FORD or SMITH in desc order of Sal.
SELECT * FROM EMP WHERE SAL IN( SELECT SAL FROM EMP WHERE ENAME IN('FORM','SNITH'));
-- 54. List the emps Whose Jobs are same as MILLER or Sal is more than ALLEN.
SELECT * FROM EMP WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'MILLER') OR SAL > (SELECT SAL FROM EMP WHERE ENAME = 'ALLEN');
-- 55. List the Emps whose Sal is > the total remuneration of the SALESMAN.
SELECT * FROM EMP WHERE SAL > (SELECT SUM(SAL) FROM EMP WHERE JOB = 'SALESMAN');
-- 56. List the emps who are senior to BLAKE working at CHICAGO & BOSTON.
SELECT * FROM EMP,DEPT WHERE HIREDATE > (SELECT HIREDATE FROM EMP WHERE ENAME = 'BLAKE') AND LOC IN ('CHICAGO','BOSTON');
/* 57. List the Emps of Grade 3,4 belongs to the dept ACCOUNTING and
RESEARCH whose Sal is more than ALLEN and exp more than SMITH in the
asc order of EXP. */
SELECT * FROM EMP E, SALGRADE S 
WHERE S.GRADE IN (3,4)
AND E.DNAME IN ('ACCOUNTING','RESEARCH')
AND E.SAL > (SELECT SAL FROM EMP WHERE ENAME = 'ALLEN')
AND (CURRENT_DATE()-E.HIREDATE AS EXP)> (SELECT CURRENT_DATE()-HIREDATE AS EXP FROM EMP WHERE ENAME = 'SMITH')
ORDER BY EXP ASC; 
-- 58. List the emps whose jobs same as SMITH or ALLEN.
SELECT * FROM EMP WHERE JOB IN (SELECT JOB FROM EMP WHERE ENAME IN ('SMITH','ALLEN'));
/* 59. Write a Query to display the details of emps whose Sal is same as of
a) Employee Sal of EMP1 table.
b) ¾ Sal of any Mgr of EMP2 table.
c) The sal of any person with exp of 5 years belongs to the sales dept of emp3 table.
d) Any grade 2 employee of emp4 table.
e) Any grade 2 and 3 employee working fro sales dept or operations dept joined in 89. */

-- 60. Any jobs of deptno 10 those that are not found in deptno 20.
SELECT JOB FROM EMP WHERE DEPTNO = 10 AND JOB NOT IN (SELECT JOB FROM EMP WHERE DEPTNO = 20);