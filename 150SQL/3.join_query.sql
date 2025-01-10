/* 41. Display the Empno, Ename, Sal, Dname, Loc, Deptno, Job of all emps
working at CHICAGO or working for ACCOUNTING dept with Ann
Sal>28000, but the Sal should not be=3000 or 2800 who doesn’t belongs to the
Mgr and whose no is having a digit ‘7’ or ‘8’ in 3rd position in the asc order of
Deptno and desc order of job.
*/
SELECT e.EMPNO,e.ENAME,e.SAL,d.DNAME,d.LOC,e.DEPTNO,e.JOB 
FROM EMP e,DEPT d
WHERE d.LOC = 'CHICAGO' OR e.JOB = 'ACCOUNTING'
AND e.SAL*12 > 28000 
AND e.SAL NOT IN (3000,2800) 
AND e.JOB != 'MANAGER'
AND e.EMPNO NOT LIKE '__7%'
AND e.EMPNO NOT LIKE '__8%' 
and e.DEPTNO = d.DEPTNO
ORDER BY e.DEPTNO ASC, e.JOB DESC;
/*              or              */
select E.empno,E.ename,E.sal,D.dname,D.loc,E.deptno,E.job
from EMP E,DEPT D
where (D.loc = 'RANCHI' or D.dname = 'ACCOUNTING') 
and E.deptno=D.deptno 
and E.empno in
(select E.empno from EMP E where (12*E.sal) > 28000 
and E.sal not IN(3000,2800) 
and E.job !='MANAGER'
and ( E.empno like '__7%' or E.empno like '__8%'))
order by E.deptno asc , E.job DESC;
/* 42. Display the total information of the emps along with Grades in the asc order. */
SELECT e.*,s.GRADE 
FROM EMP e, SALGRADE s 
WHERE e.SAL BETWEEN s.LOWSAL AND s.HIGHSAL
ORDER BY s.GRADE;
/*              or              */
SELECT e.*,s.GRADE 
FROM EMP e, SALGRADE s 
WHERE e.SAL >= s.LOWSAL AND e.SAL <= s.HIGHSAL
ORDER BY s.GRADE;
/* 43. List all the Grade2 and Grade 3 emps. */
SELECT e.*,s.GRADE FROM EMP e, SALGRADE s
WHERE e.SAL BETWEEN s.LOWSAL AND s.HIGHSAL
AND GRADE IN (2,3);
/*              or              */
SELECT * from EMP e
 where e.empno in 
 (select e.empno from EMP e ,SALGRADE s 
 where e.sal BETWEEN s.LOWSAL and s.highsal 
 and s.grade in(2,3));

/* 44. Display all Grade 4,5 Analyst and Mgr. */
SELECT * FROM EMP e JOIN SALGRADE s
WHERE e.SAL BETWEEN s.LOWSAL AND s.HIGHSAL
AND GRADE IN (4,5)
AND e.JOB IN ('ANALYST','MANAGER');
/*              or              */
select * from EMP e, SALGRADE s where e.sal between s.lowsal and s.highsal and
s.grade IN (4,5) and e.empno in (select e.empno from EMP e where e.job in
('MANAGER','ANALYST'));
/*45. List the Empno, Ename, Sal, Dname, Grade, Exp, and Ann Sal of emps working for 
Dept10 or20. */
SELECT e.EMPNO,e.ENAME,e.SAL,d.DNAME,s.GRADE,YEAR(CURRENT_DATE())-YEAR(e.HIREDATE) AS EXP,e.SAL*12 AS ANNSAL
FROM EMP e JOIN DEPT d JOIN SALGRADE s 
WHERE e.DEPTNO IN (10,20)
AND e.DEPTNO = d.DEPTNO
AND e.SAL BETWEEN s.LOWSAL AND s.HIGHSAL;

/*another approach (NOT SUPPORTED BY MySQL)*/
select E.empno,E.ename,E.sal,S.grade,D.dname,(months_between(sysdate,E.hiredate)/12) "EXP" ,12*E.sal “ANN SAL”
from emp E,dept D ,salgrade S
where E.deptno in (10,20) 
and E.deptno = D.deptno 
and E.sal between S.losal and S.hisal ;
/* 46. List all the information of emp with Loc and the Grade of all the emps
belong to the Grade range from 2 to 4 working at the Dept those are not starting
with char set 'OP' and not ending with 'S' with the designation having a char 'a'
any where joined in the year 1981 but not in the month of Mar or Sep and Sal
not end with '00' in the asc order of Grades.
*/
SELECT  e.*,d.LOC,s.GRADE
FROM EMP e JOIN DEPT d JOIN SALGRADE s 
WHERE s.GRADE BETWEEN 2 AND 4
AND d.DNAME NOT LIKE ('OP%S')
AND e.JOB LIKE ('%A%')
AND YEAR(e.HIREDATE) = 1981
AND MONTH(e.HIREDATE) NOT IN (03,09)
AND e.SAL NOT LIKE ('%00')
AND e.DEPTNO = d.DEPTNO
AND e.SAL BETWEEN s.LOWSAL AND s.HIGHSAL
ORDER BY s.GRADE;

/*another approach (NOT SUPPORTED BY MySQL)*/
select e.empno,e.ename,d.loc,s.grade,e.sal from emp e ,dept d,salgrade s
where e.deptno = d.deptno
and (d.dname not like 'OP%' and d.dname not like '%S') 
and e.sal between s.losal and s.hisal 
and s.grade in (2,3,4)
and empno in 
(select empno from emp 
where job like '%A%'and sal not like '%00' 
and (to_char (hiredate,'YYYY') = '1981'
and to_char(hiredate,'MON') not in ('MAR','SEP')));
/* 47. List the details of the Depts along with Empno, Ename or without the emps. */
SELECT d.*,e.EMPNO,e.ENAME 
FROM DEPT d LEFT JOIN EMP e
ON d.DEPTNO=e.DEPTNO;
/* 48. List the details of the emps whose Salaries more than the employee BLAKE. */
SELECT * FROM EMP
WHERE ENAME IN (SELECT ENAME FROM EMP WHERE ENAME != 'BLAKE');

/*another approach (NOT SUPPORTED BY MySQL)*/
select * from emp e,dept d where e.deptno(+)= d.deptno;
/* 49. List the emps whose Jobs are same as ALLEN. */
SELECT * FROM EMP 
WHERE JOB IN (SELECT JOB FROM EMP WHERE ENAME = 'ALLEN');
/* 50. List the emps who are senior to King. */
SELECT * FROM EMP 
WHERE HIREDATE > (SELECT HIREDATE FROM EMP WHERE ENAME = 'KING');