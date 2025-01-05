-- 1. Display all the information of the EMP table?
SELECT * FROM EMP;
/* PRACTICALLY ALL COLUMNS NAME SHOULD BE USED */
SELECT EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO FROM EMP;
-- 2. Display unique Jobs from EMP table?
SELECT DISTINCT(JOB) FROM EMP;
/*another approach (NOT SUPPORTED BY MySQL)*/
SELECT UNIQUE JOB FROM EMP;
-- 3. List the emps in the asc order of their Salaries?
SELECT * FROM EMP ORDER BY SAL ASC;
-- 4. List the details of the emps in asc order of the Dptnos and desc of Jobs?
SELECT * FROM EMP ORDER BY DEPTNO ASC, JOB DESC;
-- 5. Display all the unique job groups in the descending order?
SELECT DISTINCT(JOB) FROM EMP ORDER BY JOB DESC;
-- 6. Display all the details of all ‘Mgrs’
SELECT * FROM EMP WHERE JOB = 'MANAGER';
/* Subquery */
SELECT * FROM EMP WHERE EMPNO IN (SELECT MGR FROM EMP);
-- 7. List the emps who joined before 1981.
SELECT * FROM EMP WHERE HIREDATE < ('1981-01-01');
/*Using DATE functions*/
SELECT * FROM EMP WHERE YEAR(HIREDATE) < 1981;
-- 8. List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal.
SELECT EMPNO,ENAME,SAL,(SAL/30) AS DailySal,(SAL*12) AS Annsal FROM EMP ORDER BY Annsal;
-- 9. Display the Empno, Ename, job, Hiredate, Exp of all Mgrs
SELECT EMPNO, ENAME, JOB, HIREDATE, YEAR(CURRENT_DATE())-YEAR(HIREDATE) AS EXP FROM EMP WHERE EMPNO IN (SELECT MGR FROM EMP);
/*another approach (NOT SUPPORTED BY MySQL)*/
SELECT EMPNO, ENAME, JOB, HIREDATE, MONTHS_BETWEEN(SYSDATE,HIREDATE) AS EXP FROM EMP WHERE EMPNO IN (SELECT MGR FROM EMP);
-- 10. List the Empno, Ename, Sal, Exp of all emps working for Mgr 7369.
SELECT EMPNO,ENAME,SAL,YEAR(CURRENT_DATE())-YEAR(HIREDATE) AS EXP FROM EMP WHERE MGR = 7369;
/*another approach (NOT SUPPORTED BY MySQL)*/
SELECT EMPNO, ENAME, SAL, MONTHS_BETWEEN(SYSDATE,HIREDATE) AS EXP FROM EMP WHERE MGR = 7369;

--------------------------------------------------------------------------------------------------------
-- 11. Display all the details of the emps whose Comm. Is more than their Sal.
SELECT * FROM EMP WHERE COMM>SAL;
-- 12. List the emps in the asc order of Designations of those joined after the second half of 1981.
SELECT * FROM EMP WHERE MONTH(HIREDATE)>6 AND YEAR(HIREDATE) = 1981 ORDER BY JOB ASC;
/*      or      */
SELECT * FROM EMP WHERE HIREDATE> ('81-06-30') AND HIREDATE < ('82-01-01') ORDER BY JOB ASC;
/*      or      */
SELECT * FROM EMP WHERE HIREDATE BETWEEN ('81-06-30') AND ('82-01-01') ORDER BY JOB ASC;
/*another approach (NOT SUPPORTED BY MySQL)*/
SELECT * FROM EMP WHERE HIREDATE> ('81-06-30') AND to_char(HIREDATE,'YYYY') = 1981 ORDER BY JOB ASC;
-- 13. List the emps along with their Exp and Daily Sal is more than Rs.100.
SELECT *,YEAR(CURRENT_DATE())-YEAR(HIREDATE) AS EXP,(SAL/30) AS DailySal FROM EMP WHERE (SAL/30)>100;
-- 14. List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order.
SELECT * FROM EMP WHERE JOB = 'CLERK' OR JOB = 'ANALYST' ORDER BY JOB DESC;
-- 15. List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in asc order of seniority.
SELECT * FROM EMP WHERE HIREDATE = '81-05-01' OR HIREDATE = '81-12-03' OR HIREDATE ='81-12-17' OR HIREDATE = '80-01-19' ORDER BY HIREDATE DESC;
/*      or      */
SELECT * FROM EMP WHERE HIREDATE IN ('81-05-01','81-12-03','81-12-17','80-01-19') ORDER BY HIREDATE DESC;
-- 16. List the emp who are working for the Deptno 10 or20.
SELECT * FROM EMP WHERE DEPTNO = 10 OR DEPTNO = 20;
/*      or      */
SELECT * FROM EMP WHERE DEPTNO IN (10,20);
-- 17. List the emps who are joined in the year 81.
SELECT * FROM EMP WHERE YEAR(HIREDATE) = 1981;
/*      or      */
SELECT * FROM EMP WHERE HIREDATE > ('80-12-31') AND HIREDATE < ('82-01-01');
/*      or      */
SELECT * FROM EMP WHERE HIREDATE BETWEEN ('80-12-31') AND ('82-01-01');
-- 18. List the emps who are joined in the month of Aug 1980.
SELECT * FROM EMP WHERE YEAR(HIREDATE) = 1980 AND MONTH(HIREDATE) = 08;
/*      or      */
SELECT * FROM EMP WHERE HIREDATE > ('80-07-31') AND HIREDATE < ('80-09-01');
/*      or      */
SELECT * FROM EMP WHERE HIREDATE BETWEEN ('80-07-31') AND ('80-09-01');
-- 19. List the emps Who Annual sal ranging from 22000 and 45000.
SELECT *,(SAL*12) AS Annsal FROM EMP WHERE (SAL*12) BETWEEN 22000 AND 45000;
-- 20. List the Enames those are having five characters in their Names.
