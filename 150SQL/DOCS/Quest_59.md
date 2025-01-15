Yes, each condition can be rewritten without subqueries by using **JOINs**. Here’s how you can rewrite each condition using only joins:

---

### **Condition (a): Employees whose salary matches any salary in EMP1**
```sql
SELECT DISTINCT E.*
FROM EMP E
JOIN EMP EMP1 ON E.SAL = EMP1.SAL;
```

---

### **Condition (b): Employees whose salary equals ¾ of the salary of any manager in EMP2**
```sql
SELECT DISTINCT E.*
FROM EMP E
JOIN EMP EMP2 ON E.SAL = 0.75 * EMP2.SAL
WHERE EMP2.JOB = 'MANAGER';
```

---

### **Condition (c): Employees whose salary matches the salary of any person with 5 years of experience in the SALES department in EMP3**
```sql
SELECT DISTINCT E.*
FROM EMP E
JOIN EMP EMP3 ON E.SAL = EMP3.SAL
JOIN DEPT D ON EMP3.DEPTNO = D.DEPTNO
WHERE D.DNAME = 'SALES'
  AND DATEDIFF(CURRENT_DATE(), EMP3.HIREDATE) >= 5 * 365;
```

---

### **Condition (d): Employees whose salary matches the salary of any Grade 2 employee in EMP4**
```sql
SELECT DISTINCT E.*
FROM EMP E
JOIN EMP EMP4 ON E.SAL = EMP4.SAL
JOIN SALGRADE S ON EMP4.SAL BETWEEN S.LOWSAL AND S.HIGHSAL
WHERE S.GRADE = 2;
```

---

### **Condition (e): Employees whose salary matches the salary of Grade 2 or Grade 3 employees in the SALES or OPERATIONS department joined in 1989**
```sql
SELECT DISTINCT E.*
FROM EMP E
JOIN EMP EMP4 ON E.SAL = EMP4.SAL
JOIN SALGRADE S ON EMP4.SAL BETWEEN S.LOWSAL AND S.HIGHSAL
JOIN DEPT D ON EMP4.DEPTNO = D.DEPTNO
WHERE S.GRADE IN (2, 3)
  AND D.DNAME IN ('SALES', 'OPERATIONS')
  AND YEAR(EMP4.HIREDATE) = 1989;
```

---

### **Explanation**

1. **Rewriting Subqueries as Joins**:
   - Subqueries that compare columns (like `E.SAL IN (...)`) are replaced with `JOIN` conditions.
   - The join ensures direct row-to-row comparisons.

2. **Filtering with WHERE Clauses**:
   - Additional filtering (e.g., `GRADE = 2`, `DNAME = 'SALES'`) is applied in the `WHERE` clause after the join.

3. **DISTINCT**:
   - Used to ensure no duplicate rows are returned if there are multiple matches.

---

### **Advantages of Using Joins**
- Better readability for complex conditions.
- Often better performance as joins can leverage indexes more effectively.

Let me know if you need further explanation or help combining these into one query! 😊