-- 51. List the Emps who are senior to their own MGRS. (emp(Hiredate) > mgr(hiredate))
SELECT E1.* FROM EMP E1 JOIN EMP E2 ON E1.MGR=E2.EMPNO WHERE E1.HIREDATE>E2.HIREDATE; 
/*              or              */
SELECT e1.* FROM EMP e1, EMP e2 WHERE e1.MGR=e2.EMPNO AND e1.HIREDATE>e2.HIREDATE;
-- 52. List the Emps of Deptno 20 whose Jobs are same as Deptno10.
SELECT DISTINCT e1.* FROM EMP e1 JOIN EMP e2 ON e1.JOB=e2.JOB WHERE e1.DEPTNO=20 AND e2.DEPTNO = 10;
/*              or              */
select * from emp e ,dept d 
where d.deptno = 20 
and e.deptno = d.deptno 
and e.job in ( 
    select e.job 
    from emp e,dept d 
    where e.deptno = d.deptno 
    and d.deptno=10
);
-- 53. List the Emps whose Sal is same as FORD or SMITH in desc order of Sal.
SELECT * FROM EMP WHERE SAL IN( SELECT SAL FROM EMP WHERE ENAME IN('FORD','SMITH')) ORDER BY SAL DESC;
-- 54. List the emps Whose Jobs are same as MILLER or Sal is more than ALLEN.
SELECT * FROM EMP WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'MILLER') OR SAL > (SELECT SAL FROM EMP WHERE ENAME = 'ALLEN');
-- 55. List the Emps whose Sal is > the total remuneration of the SALESMAN.
SELECT * FROM EMP WHERE SAL > (SELECT SUM(SAL+COMM) FROM EMP WHERE JOB = 'SALESMAN');
/*              or              */
SELECT * 
FROM EMP 
WHERE SAL > (
    SELECT SUM(IF(COMM IS NOT NULL, SAL + COMM, SAL)) 
    FROM EMP 
    WHERE JOB = 'SALESMAN'
);
/*              or              */
SELECT * 
FROM EMP 
WHERE SAL > (
    SELECT SUM(CASE 
                 WHEN COMM IS NOT NULL THEN SAL + COMM 
                 ELSE SAL 
               END) 
    FROM EMP 
    WHERE JOB = 'SALESMAN'
);
/*              ORACLE SYNTAX              */
select * from EMP 
where sal >(
    select sum(nvl2(comm,sal+comm,sal)) 
    from EMP 
    where job = 'SALESMAN');
-- 56. List the emps who are senior to BLAKE working at CHICAGO & BOSTON.
SELECT * FROM EMP E,DEPT D WHERE E.DEPTNO = D.DEPTNO AND HIREDATE > (SELECT HIREDATE FROM EMP WHERE ENAME = 'BLAKE') AND LOC IN ('CHICAGO','BOSTON');
/* 57. List the Emps of Grade 3,4 belongs to the dept ACCOUNTING and
RESEARCH whose Sal is more than ALLEN and exp more than SMITH in the
asc order of EXP. */
SELECT *,(CURRENT_DATE()-E.HIREDATE) AS EXP FROM EMP E, SALGRADE S , DEPT D
WHERE E.DEPTNO = D.DEPTNO 
AND E.SAL<S.HIGHSAL AND E.SAL>S.LOWSAL
AND S.GRADE IN (3,4)
AND D.DNAME IN ('ACCOUNTING','RESEARCH')
AND E.SAL > (SELECT SAL FROM EMP WHERE ENAME = 'ALLEN')
AND (CURRENT_DATE()-E.HIREDATE)> (SELECT CURRENT_DATE()-HIREDATE AS EXP FROM EMP WHERE ENAME = 'SMITH')
ORDER BY EXP; 
/*              or              */
SELECT E.*, D.DNAME, S.GRADE, 
       DATEDIFF(CURRENT_DATE(), E.HIREDATE) AS EXP
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
JOIN SALGRADE S ON E.SAL BETWEEN S.LOWSAL AND S.HIGHSAL
WHERE S.GRADE IN (3, 4)
  AND D.DNAME IN ('ACCOUNTING', 'RESEARCH')
  AND E.SAL > (SELECT SAL FROM EMP WHERE ENAME = 'ALLEN')
  AND DATEDIFF(CURRENT_DATE(), E.HIREDATE) > (
      SELECT DATEDIFF(CURRENT_DATE(), HIREDATE) 
      FROM EMP 
      WHERE ENAME = 'SMITH'
  )
ORDER BY EXP;
/*              or              */
select * from EMP e where e.deptno in (select d.deptno from DEPT d where
d.dname IN ('ACCOUNTING','RESEARCH') ) and
e.sal >(select sal from EMP where ename = 'ALLEN') and
e.hiredate <( select hiredate from EMP where ename = 'SMITH') and
e.empno in (select e.empno from EMP e ,SALGRADE s where e.sal between s.lowsal
and s.highsal and s.grade in (3,4) )
order by e.hiredate DESC;
-- 58. List the emps whose jobs same as SMITH or ALLEN.
SELECT * FROM EMP WHERE JOB IN (SELECT JOB FROM EMP WHERE ENAME IN ('SMITH','ALLEN'));
/* 59. Write a Query to display the details of emps whose Sal is same as of
a) Employee Sal of EMP1 table.
b) ¾ Sal of any Mgr of EMP2 table.
c) The sal of any person with exp of 5 years belongs to the sales dept of emp3 table.
d) Any grade 2 employee of emp4 table.
e) Any grade 2 and 3 employee working fro sales dept or operations dept joined in 89. */

-- Employee Sal of EMP1 table.
SELECT * FROM EMP WHERE SAL IN(SELECT SAL FROM EMP GROUP BY SAL HAVING COUNT(SAL)>1);
SELECT DISTINCT E1.* 
FROM EMP E1
JOIN EMP E2 
  ON E1.SAL = E2.SAL 
  AND E1.EMPNO <> E2.EMPNO;

-- ¾ Sal of any Mgr of EMP2 table.
SELECT * FROM EMP WHERE SAL IN (SELECT ROUND(3*(SAL)/4,-2) AS SAL FROM EMP WHERE JOB = 'MANAGER');
SELECT * FROM EMP WHERE SAL IN (SELECT DISTINCT ROUND(3*(E1.SAL)/4,-2) AS nSAL FROM EMP E1,EMP E2 WHERE E1.EMPNO=E2.MGR);

SELECT DISTINCT E.*
FROM EMP E
JOIN EMP EMP2 ON E.SAL = 0.75 * EMP2.SAL
WHERE EMP2.JOB = 'MANAGER';
-- The sal of any person with exp of 5 years belongs to the sales dept of emp3 table.
SELECT *,YEAR(CURRENT_DATE())-YEAR(HIREDATE) AS EXP FROM EMP WHERE SAL IN (SELECT E.SAL FROM EMP E,DEPT D WHERE E.DEPTNO=D.DEPTNO AND YEAR(CURRENT_DATE())-YEAR(HIREDATE) > 5 AND D.DNAME='SALES');

SELECT DISTINCT E.*
FROM EMP E
JOIN EMP EMP3 ON E.SAL = EMP3.SAL
JOIN DEPT D ON EMP3.DEPTNO = D.DEPTNO
WHERE D.DNAME = 'SALES'
  AND DATEDIFF(CURRENT_DATE(), EMP3.HIREDATE) >= 5 * 365;


-- Any grade 2 employee of emp4 table.
SELECT * FROM EMP WHERE SAL IN (SELECT E.SAL FROM EMP E,SALGRADE S WHERE E.SAL BETWEEN S.LOWSAL AND S.HIGHSAL AND S.GRADE =2);

SELECT DISTINCT E.*
FROM EMP E
JOIN EMP EMP4 ON E.SAL = EMP4.SAL
JOIN SALGRADE S ON EMP4.SAL BETWEEN S.LOWSAL AND S.HIGHSAL
WHERE S.GRADE = 2;

-- Any grade 2 and 3 employee working for sales dept or operations dept joined in 89.
SELECT * FROM EMP WHERE SAL IN (SELECT E.SAL FROM EMP E,SALGRADE S,DEPT D WHERE E.SAL BETWEEN S.LOWSAL AND S.HIGHSAL AND E.DEPTNO=D.DEPTNO AND GRADE IN(2,3) AND YEAR(E.HIREDATE)=1989 AND D.DNAME IN('OPERATION','SALES'));

SELECT DISTINCT E.*
FROM EMP E
JOIN EMP EMP4 ON E.SAL = EMP4.SAL
JOIN SALGRADE S ON EMP4.SAL BETWEEN S.LOWSAL AND S.HIGHSAL
JOIN DEPT D ON EMP4.DEPTNO = D.DEPTNO
WHERE S.GRADE IN (2, 3)
  AND D.DNAME IN ('SALES', 'OPERATIONS')
  AND YEAR(EMP4.HIREDATE) = 1989;

-- 60. Any jobs of deptno 10 those that are not found in deptno 20.
SELECT JOB FROM EMP WHERE DEPTNO = 10 AND JOB NOT IN (SELECT JOB FROM EMP WHERE DEPTNO = 20);