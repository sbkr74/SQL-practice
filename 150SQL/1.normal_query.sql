-- 1. Display all the information of the EMP table?
SELECT * FROM EMP;
/* PRACTICALLY ALL COLUMNS NAME SHOULD BE USED */
SELECT EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO FROM EMP;
-- 2. Display unique Jobs from EMP table?
SELECT DISTINCT(JOB) FROM EMP;
-- 3. List the emps in the asc order of their Salaries?
SELECT ENAME,SAL FROM EMP ORDER BY SAL;
-- 4. List the details of the emps in asc order of the Dptnos and desc of Jobs?
SELECT * FROM EMP ORDER BY DEPTNO, JOBS DESC;
-- 5. Display all the unique job groups in the descending order?
SELECT DISTINCT(JOBS) FROM EMP ORDER BY JOBS DESC;
-- 6. Display all the details of all ‘Mgrs’
SELECT * FROM EMP WHERE JOB = 'MANAGER';
-- 7. List the emps who joined before 1981.
SELECT ENAME FROM EMP WHERE YEAR(HIREDATE) < 1981;
-- 8. List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal.
SELECT EMPNO,ENAME,SAL,(SAL/30) AS DailySal FROM EMP ORDER BY (SAL*12);
-- 9. Display the Empno, Ename, job, Hiredate, Exp of all Mgrs
SELECT EMPNO, ENAME, JOB, HIREDATE, YEAR(CURRENT_DATE())-YEAR(HIREDATE) AS EXP FROM EMP WHERE JOB = 'MANAGER';
-- 10. List the Empno, Ename, Sal, Exp of all emps working for Mgr 7369.
SELECT EMPNO,ENAME,SAL,YEAR(CURRENT_DATE())-YEAR(HIREDATE) AS EXP FROM EMP WHERE MGR = 7369;