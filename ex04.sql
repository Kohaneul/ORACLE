-- ����1 ]  ������ MANAGER �� ����� ����̸�, ����, �Ի���, �޿�, �μ��̸��� ��ȸ�ϼ���
SELECT ENAME ����̸�, JOB ����, HIREDATE �Ի���, SAL �޿�, DNAME �μ��̸�
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;


--����2 ] ����̸��� �ټ������� ������� ����̸�, ����, �Ի���, �޿�, �޿������ ��ȸ�ϼ���
SELECT ENAME ����̸�, JOB ����, HIREDATE �Ի���, SAL �޿�, GRADE �޿����
FROM EMP, SALGRADE
WHERE SAL BETWEEN LOSAL AND HISAL;


--����3 ] �Ի����� 81���̰� ������ MANAGER�� ������� ����̸�, ����, �Ի���, �޿�, �޿����, �μ��̸�, �μ���ġ�� ��ȸ�ϼ���
SELECT E.ENAME ����̸�, E.JOB ����,E.HIREDATE �Ի���,E.SAL �޿�,GRADE �޿����,D.DNAME �μ��̸�,D.LOC �μ���ġ
FROM EMP E,DEPT D, SALGRADE
WHERE 
    E.SAL BETWEEN LOSAL AND HISAL AND
    TO_CHAR(HIREDATE,'YY')='81' AND 
    E.DEPTNO = D.DEPTNO AND JOB = 'MANAGER';











SELECT ENAME ����̸�, JOB ����, HIREDATE �Ի���, SAL �޿�, GRADE �޿����, DNAME �μ��̸�, LOC �μ���ġ
FROM EMP, DEPT, SALGRADE
WHERE (SAL BETWEEN LOSAL AND HISAL)
    AND EMP.DEPTNO = DEPT.DEPTNO
    AND TO_CHAR(HIREDATE,'YY')='81'
    AND JOB = 'MANAGER';


--���� 4 ] ������� ����̸�, ����, �޿�, �޿����, ����̸��� ��ȸ�ϼ���
select e.ename ����̸�, e.job �������, e.sal ����޿�, grade �޿����, nvl(m.ename,'������') ����̸�
from emp e, emp m, salgrade
where
    e.mgr = m.empno(+) and (e.sal between losal and hisal);





SELECT * FROM EMP, SALGRADE
WHERE
    ENAME = 'KING'
   AND SAL BETWEEN LOSAL AND HISAL 
    ;


--���� 5 ]  ������� ����̸�, ����, �޿�, ����̸�, �μ��̸�, �޿������ ��ȸ�ϼ���.
select e.ename ����̸�, e.job ����, e.sal �޿�, nvl(m.ename,'������') ����̸�, dname �μ��̸�, grade �޿����
from emp e, emp m, salgrade, dept
where
    e.mgr = m.empno(+) and (e.sal between losal and hisal) and
    e.deptno = dept.deptno
    ;

--------------------------------------------------------------------------------
/*
    ANSI JOIN : ���Ǹ���� �����ͺ��̽�(DBMS)�� ���� �ణ�� �� ������ �޶�����.
    ANSI �����̶� �̱�����ǥ����ȸ(ANSI)���� ������ ���Ǹ���� ������� �ؼ� ���ϵ� ����� ����� �������� ��. 
                  ���� DBMS �� ������ �ʰ� ������ �ȴ�.
                  
                  
----------------------------------------------------------------------------------                  
    1. Cross Join : ����Ŭ�� Cartesion Product �� �����ϴ� ����
        ���� ] SELECT �ʵ��̸�,..... FROM ���̺� CROSS JOIN ���̺�2;
    2. Inner Join : Equi Join, Non Eqi Join, Self Join
        ���� ] SELECT �ʵ��̸�,.... 
               FROM ���̺�1 (INNER) JOIN ���̺�2.... 
               ON ��������
               WHERE �Ϲ�����
        ���� ] ���������� ON ������ ����ϰ� �Ϲ������� WHERE������ ����Ѵ�.
               INNER JOIN�� ���� �Ϲ����� �����̱� ������ INNER ��� �ܾ �����ϸ� INNER JOIN�� �ؼ��ؼ� �����ϰ� �ȴ�.
    3. OUTER JOIN : Cartesion
        ���� ] SELECT �ʵ��̸�...
               FROM ���̺�1 LEFT || RIGHT || FULL OUTER JOIN ���̺�2     ����) || : �Ǵ�
               ON ��������...;
               �̶� ������ �����Ͱ� �ִ� �� ���̺��� ����Ű�� �ȴ�.
        ���� ] ������ 2���̻� �Ǵ� ��쿡�� 
        ���� ] SELECT
               FROM ���̺��̸� 
               JOIN ���̺�2
               ON ��������
               JOIN ���̺�3
               ON ��������2;
*/

--ANSI JOIN
-- CROSS JOIN : ��� ������ �μ������� ũ�ν������ϼ���.
SELECT
    *
FROM EMP CROSS JOIN DEPT;

--INNER JOIN : ������� �������, �μ���ȣ, �μ��̸��� ��ȸ�ϼ���
SELECT EMAME ����̸�, JOB ����, E.DEPTNO �μ���ȣ, DNAME �μ��̸� 
FROM EMP E INNER JOIN DEPT D
ON --����������
E.DEPTNO = D.DEPTNO
;


--81�� �Ի��� ������� ����̸�, ����, �Ի�⵵, �μ��̸��� ��ȸ�ϼ���
SELECT ENAME ����̸�, JOB ����, TO_CHAR(HIREDATE,'YY') �Ի�⵵,DNAME �μ��̸�
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE TO_CHAR(HIREDATE,'YY')= '81'
;

--INNER JOIN 
--ON  --��������   E.DEPTNO = D.DEPTNO

--������� ����̸�, �޿�, �޿������ ��ȸ�ϼ���. NON EQUI JOIIN
SELECT ENAME, SAL, GRADE
FROM EMP JOIN  SALGRADE
ON SAL BETWEEN LOSAL AND HISAL;

--������� ����̸�, ����̸��� ��ȸ�ϼ���

SELECT E.ENAME ����̸�, NVL(S.ENAME,'������') ����̸�
FROM
    EMP E JOIN EMP S
ON
    E.MGR = S.EMPNO(+);


-- ������� ����̸�, ����̸��� ��ȸ�ϼ���
SELECT
    E.ENAME ����̸�, S.ENAME ����̸�
FROM
    EMP E LEFT OUTER JOIN EMP S
ON
    E.MGR = S.EMPNO;

-- ������� ����̸�, �μ��̸�, �޿�, �޿������ ��ȸ�ϼ���
SELECT ENAME ����̸�, DNAME �μ��̸�,SAL �޿�,GRADE �޿����
FROM EMP E -- ���������� �����ϴ� �⺻���̺��� �־������
JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
JOIN SALGRADE
ON E.SAL BETWEEN LOSAL AND HISAL;


--------------------------------------------------------------------------------
/*
    NATURAL JOIN : �ڵ����� �ݵ�� ���� ���ǽĿ� ����ϴ� �ʵ��� �̸��� �����ϰ� 
                   �ݵ�� ������ �ʵ尡 �Ѱ��϶� ����� �� �ִ� ����
                   �ڵ����� �ߺ��Ǵ� �ʵ带 ����ؼ� �����ϱ� ������ ���������� ������� �ʴ´�.
        ���� ] SELECT �ʵ��̸�....
                FROM ���̺� 1
              NATURAL JOIN ���̺�2;
              
    USING JOIN : �ݵ�� ���� ���ǽĿ� ����ϴ� �ʵ��� �̸��� ������ ��� 
                 �׸��� ���� �̸��� �ʵ尡 ������ �����ص� �����ϴ�.
        ���� ] SELECT �ʵ��̸�..
               FROM   ���̺�1
               JOIN   ���̺�2
               USING  (���ο� ����� �ʵ��̸�)  
*/

-- ������� ����̸�, �μ��̸��� ��ȸ�ϼ���
SELECT ENAME ����̸�, DNAME �μ��̸�
FROM EMP
NATURAL JOIN DEPT; --�ʵ带 ������ �Ȱ��� �̸��� �ʵ带 ������ JOIN��


--TMP ���̺�� �μ����� ���̺��� �̿��ؼ� ������� ����̸�, �μ���ġ�� ��ȸ�ϼ���
CREATE TABLE TMP
AS 
    SELECT
        E.*, DNAME
        FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO;



SELECT ENAME ����̸�, LOC �μ���ġ
FROM TMP
JOIN DEPT
USING (DEPTNO);


---------------------------------------------------------------------------------
/*
    ������(SUB QUERY, ��������) : 
*/

-- �� �������� ANSI JOIN�� ����� ���Ǹ���� �ۼ��Ͻÿ�.



-- ������� ����̸�, �μ��̸��� ��ȸ�ϼ���
SELECT ENAME ����̸�, DNAME �μ��̸�
FROM EMP
JOIN DEPT
USING (DEPTNO);


SELECT ENAME ����̸�, DNAME �μ��̸�
FROM EMP NATURAL JOIN DEPT;


--TMP ���̺�� �μ����� ���̺��� �̿��ؼ� ������� ����̸�, �μ���ġ�� ��ȸ�ϼ���
SELECT ENAME ����̸�, LOC �μ���ġ
FROM TMP
JOIN DEPT
USING(DEPTNO);
--------------------------------------------------------------------------------------

/*
    ������(SUB QUERY, ��������) : ���Ǹ�� �ȿ� �ٽ� ���Ǹ���� �����ϴ� ���
                                 ���Ե� �� ���Ǹ���� �������� �Ǵ� �������� ��� �θ���.
        �� ] �̸��� SMITH�� ����� ���� �μ��� �ִ� ������� ������ ��ȸ�ϼ���
            ==> �� ��� SMITH�� �μ���ȣ�� �˾Ƴ��� ���ؼ� ���� ���Ǹ���� ����Ǿ�� �Ѵ�.
                SMITH ����� �μ��� �̰� (�μ��� ���ٸ�) �� ������� �μ���ȣ ��.........
            ==> �μ���ȣ�� �̿��ؼ� ������ ��ȸ
            
            �̶� ���� ���Ǹ���� �Ʒ� ���� ���Ǹ�ɿ��� ����ؼ� ����� ������ ��ȸ�ؼ� ����ؾ� �Ѵ�.
            �̋� �������Ǹ� ���δ� ���Ǹ���� �������� ����̶�� �Ѵ�.
            ���������� ��ġ�� ���� ���
            1. SELECT �� :  �� �κп� ���Ǵ� ���Ǹ���� ����� �ݵ�� ���� , �� �ʵ尡 ���;� �Ѵ�.
            2. FROM �� : FROM ������ ���̺��� �����Ǿ�� �Ѵ�. �׷��� ��ȸ���� ����� ����� ��ġ ���̺�� ����.
                         �׷��� �� ��ȸ ���� ����� ����� ���̺�ó�� ����� �� �ִ� ���
                         �� �� FROM �� �ȿ� ���� �������Ǹ� Ư���� ��ġ ���̺�� ���� �ؼ� INLINE TABLE�̶�� �θ���.
                         �̋� ����� ���Ǹ���� ������ ����� ��Ī�� ����ؼ� �����͸� ������ �Ѵ�.
            3. WHERE ��
                1. ������ �����ʵ�� ����� �߻��ϴ� ��� : ����� �񱳿� ����ϸ� �ȴ�.
                
                2. ������ �����ʵ�� ����� �߻��ϴ� ��� 
                    -���������� ����� ���������� �����ʵ�� �߻��ϴ� ��� �� �� ����ϴ� �����ڰ� 
                    IN : �������� ������ �� �ϳ��� ������ �Ǵ� ���. ������ �� �ϳ��� ���������� ����� ó���Ѵ�.
                    ANY : �������� ������ �� �ϳ��� ������ �Ǵ� ��� . ��Һ� �����ڵ� ��� ����
                    ALL : �������� �����Ͱ� ��� ������ �Ǵ� ���
                          ==> ����񱳴� ����� �� ����, ��Һ��� �� ����Ѵ�.
                3. �����ʵ� ������ �ʵ�� ����� �߻��ϴ� ���
                    EXISTS : �������� ������ �� �ϳ��� ������ �Ǵ� ���, 
*/
--�̸��� SMITH�� ����� ���� �μ��� �ִ� ������� ������ ��ȸ�ϼ���
SELECT *
FROM EMP
WHERE DEPTNO = (
        SELECT DEPTNO
        FROM EMP
        WHERE
        ENAME = 'SMITH'
);


--������� ����̸�, �μ���ȣ, �μ��̸�, �μ���ġ ��ȸ


SELECT ENAME ����̸�, DEPTNO �μ���ȣ,(
        SELECT DNAME
        FROM DEPT
        WHERE E.DEPTNO = DEPTNO
    ) �μ��̸�,
    (
        SELECT LOC
        FROM DEPT
        WHERE E.DEPTNO = DEPTNO
    ) �μ���ġ
FROM EMP E;


----------------------------------------------------------------------------------
--IN
--������ MANAGER�� ����� ���� �μ��� ���� ������� ����̸�, ���� , �μ���ȣ�� ��ȸ�ϼ���

SELECT
    ENAME ����̸�, JOB ����, DEPTNO �μ���ȣ
FROM EMP
WHERE DEPTNO= ANY(
    SELECT
        DEPTNO
    FROM
        EMP
    WHERE
    JOB = 'MANAGER'
);

--ANY
--  �� �μ� ��� �޿����� �� �μ��� �޿��� ���� ������� ����̸�, ����޿�, �μ���ȣ�� ��ȸ�ϼ���
SELECT
    ENAME ����̸�, SAL ����޿�, DEPTNO �μ���ȣ
FROM EMP
WHERE SAL> ANY( --�� �μ���....
    SELECT AVG(SAL)
    
    FROM EMP
    
    GROUP BY DEPTNO
);

--��� �� �μ��� �޿���պ��� ���� �޿��� �޴� ������� ����̸�, ����޿�, �μ���ȣ�� ��ȸ�ϼ���

SELECT ENAME ����̸�, SAL �޿�, DEPTNO �μ���ȣ
FROM EMP
WHERE SAL> ALL( --��� ���μ��� �޿� ��պ���..==> ALL ���
    SELECT AVG(SAL)
    FROM EMP
    GROUP BY DEPTNO);














SELECT ENAME ����̸�, DEPTNO �μ���ȣ,
    (
    SELECT
        DNAME 
    FROM
        DEPT
    WHERE
        DEPTNO = E.DEPTNO
    )�μ��̸�,
        (
    SELECT
        LOC 
    FROM
        DEPT
    WHERE
        DEPTNO = E.DEPTNO
    )�μ���ġ
FROM EMP E;




-- �������� ������ �����ʵ��� ��� : SMITH ����� ������ �μ��� ������� ������ ��ȸ�ϼ���

SELECT *
FROM EMP
WHERE DEPTNO = (
        SELECT DEPTNO
        FROM EMP
        WHERE ENAME = 'SMITH');

--10���μ� ������� ����, �޿� ����� ��ȸ�ϼ���



SELECT JOB �����̸�,FLOOR(AVG(SAL)) �޿����
FROM EMP
WHERE
    JOB IN ( --IN �������� ��� ������ �ϱ����ؼ��� IN �տ� NOT�� �ٿ��ش�. IN�� ��� ������ �����ʵ�...
    SELECT JOB
    FROM  EMP
    WHERE DEPTNO = 10 -- ���Ǹ���� ����� ���߰����� �߻��Ѵ�, MANAGER, PRESIDENT, CLERK
)
GROUP BY JOB;


-- ��� �� 40�� �μ� ����� �����ϸ� ��� ������� ����̸�, �μ���ȣ�� ��ȸ�ϼ���

SELECT ENAME ����̸�, DEPTNO �μ���ȣ
FROM EMP
WHERE EXISTS (
    SELECT *
    FROM EMP
    WHERE DEPTNO = 40
);


SELECT ENAME, DEPTNO
FROM EMP
    /*
    ���̺��� ����ų�� ��Ģ�� ����.���̺��̸��� �������� ����ؾ� �Ѵ�.
    ������ ���Ӱ����� ������ �ִ� ���̺� ���ؼ��� ���̺� �̸��� ����ص� �ȴ�.
    */
WHERE EXISTS( --������ NOT EXISTS�� ǥ���Ѵ�
        SELECT *
        FROM EMP
        WHERE DEPTNO = 40
);

---------------------------------------------------------------------------------------

--����� �� �μ� ��ձ޿����� ���� �޴� ������� ����̸�, �μ���ȣ, �μ�����, �μ���ձ޿�, �μ��޿��հ踦 ��ȸ�ϼ���

SELECT ENAME ����̸�, DNO �μ���ȣ, SAL �޿�, CNT �μ�����, AVG �μ���ձ޿�, SUM �μ��޿��հ� 
FROM EMP, (
    SELECT DEPTNO DNO, COUNT(*) CNT, ROUND(AVG(SAL),2) AVG, SUM(SAL) SUM
    FROM EMP
    GROUP BY DEPTNO
)
WHERE DEPTNO = DNO AND AVG>SAL;





------------------------------------------------------------------------------------
SELECT ENAME,SAL
FROM EMP;



--ȸ�� ��ձ޿����� ���Թ޴� ������� ����̸�, ����, �Ի���, �޿��� ��ȸ�ϼ���

SELECT ENAME ����̸�, JOB ����, HIREDATE �Ի���, SAL �޿�
FROM EMP
WHERE SAL< ALL(
    SELECT AVG(SAL)
    FROM EMP
);




