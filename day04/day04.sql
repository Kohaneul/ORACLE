/*
    ���� ] having �� : �׷�ȭ�� ����� ���͸� �Ҷ� ���͸� ������ ����ϴ� ��..
           where ������ �׷��Լ��� ������� ��������, having ������ �׷��Լ��� ����� �� �ִ�.
*/
/*
    JOIN : Relation Database Management System (=RDMBS) ������ �������� �ߺ�(=���Ἲ)�� ���ϱ� ���ؼ� ���̺��� �и��ϰ�
            �׷����μ� ���̺�� �� ���谡 ������ �Ǿ���. 
            �׷��� �и��� ���̺��� �����͸� �����س��� ����ϴ� ������ JOIN �̴�.
            
            ���� ] ����Ŭ���� er������ �����ͺ��̽��̴�.
            ER : ��ƼƼ(���̺�)������ ���踦 �̾߱� �ϰ� �̷� ������ ���̺��� �����ϴ� �����ͺ��̽��� ������ �����ͺ��̽���� �Ѵ�. 
            
            ���� ] �����������ͺ��̽������� �������� ���̺��� ���ÿ� �˻��ϴ� ����� �̹� ������ �ִ�.
                    �̶� �������� ���̺��� ������ ���ÿ� �˻��ϸ� Cartesion Product�� ��������µ� 
                    �� ������� ��Ȯ���� ���� �����͵� ���ԵǾ� �ִ�.
                    ���� ��Ȯ�� �����͸� ���͸��ؼ� �����;� �ϴµ� �̶� �� ���͸� �ϴ� �۾��� JOIN�̶�� �Ѵ�.
                    
            ���� ] Inner Join : ������ ���̺���� ��� ���� �ȿ��� �������� ����
                        - Equi Join : ������ �Ҷ� ���պ񱳿����ڷ� ������ �ϴ� ��� 
                        - Non Equi Join : ������ �Ҷ� ����񱳿����� �̿��� �����ڷ� �����ϴ� ���
                   Outer Join : Catesian Product�� ���Ե��� �ʴ� �����͸� �������� ����
                         ���� : ���̺��̸�, �ʵ��̸� =  ���̺��̸�.�ʵ��̸�(+) �̶� (+)�� NULL�� ǥ���Ǿ�� �� ���̺��ʿ� �ٿ��ش�.
                   Self Join : ������ �ϴµ� ������̺��� ���� ���̺��� ����ϴ� ����
                    
*/

-- ���������̸� ���̺�
DROP TABLE ecolor;
CREATE TABLE ecolor (
    ceno NUMBER(3) -- ���� Į�� �Ϸù�ȣ
        CONSTRAINT ECLR_NO_PK PRIMARY KEY,
    code VARCHAR2(7) -- Į�� �ڵ尪
        CONSTRAINT ECLR_CODE_UK UNIQUE
        CONSTRAINT ECLR_CODE_NN NOT NULL,
    name varchar2(20)
        CONSTRAINT ECLR_NAME_NN NOT NULL
);

-- �������߰�
INSERT INTO
    ecolor
VALUES(
    100, '#FF0000', 'red'
);

INSERT INTO
    ecolor
VALUES(
    101, '#00FF00', 'green'
);

INSERT INTO
    ecolor
VALUES(
    102, '#0000FF', 'blue'
);

INSERT INTO
    ecolor
VALUES(
    103, '#000000', 'purple'
);

commit;
-- ����Į�����̺� ��ȸ
SELECT * FROM ecolor;
COMMIT; -- �޸��� �۾��������� �۾��� ������ �����ͺ��̽��� �����Ű�� ���


CREATE TABLE kcolor (
    ckno NUMBER(3)
        CONSTRAINT KCLR_NO_PK PRIMARY KEY,
    code VARCHAR2(7)
        CONSTRAINT KCLR_CODE_UK UNIQUE
        CONSTRAINT KCLR_CODE_NN NOT NULL,
    name varchar2(20)
        CONSTRAINT KCLR_NAME_NN NOT NULL
);

-- �������߰�
INSERT INTO
    kcolor
VALUES(
    100, '#FF0000', '����'
);

INSERT INTO
    kcolor
VALUES(
    101, '#00FF00', '���'
);

INSERT INTO
    kcolor
VALUES(
    102, '#0000FF', '�Ķ�'
);

commit;


SELECT * FROM ecolor;
SELECT * FROM kcolor;

SELECT
    *
FROM
    ecolor, kcolor
;

SELECT
    *
FROM
    emp e, emp ee
;

SELECT
    ceno cno, e.code, e.name ename, k.name kname
FROM
    ecolor e, kcolor k
WHERE
    e.code = k.code -- ��������
;


--Outer Join
SELECT
    ceno cno, e.code, e.name ename, k.name kname
FROM
    ecolor e, kcolor k
WHERE
    e.code = k.code(+) -- ��������
;


--self join
-- ������� ����̸�, ����ȣ, ����̸�, ���޿� �� ��ȸ�ϼ���

SELECT
    e.ename ����̸�, e.mgr ����ȣ, s.ename ����̸�, s.sal ���޿�
FROM emp e, emp s
WHERE
    e.mgr = s.empno(+) --(+)Outer Join : king�� ��簡 �����ϱ� null���� �߰��ϱ� ���Ͽ� null���� �ִ� ���̺� (+)�� �߰�
;

--������� ����̸�, ����, �޿�, �޿������ ��ȸ�ϼ���
SELECT
    ENAME ����̸�, JOB ����, SAL �޿�, GRADE �޿����
FROM EMP, SALGRADE
WHERE
SAL BETWEEN LOSAL AND HISAL
;

--������� �����ȣ, ����̸�,����, �μ��̸�, �μ���ġ�� ��ȸ�ϼ���
SELECT EMPNO �����ȣ, ENAME ����̸�, JOB ����, DNAME �μ��̸�,LOC �μ���ġ
FROM EMP E, DEPT D --DEPT�� ���ļ� �������ֱ� ����
WHERE
    E.DEPTNO = D.DEPTNO
;

--81�� �Ի��� ����� ����̸�, ����, �Ի���, �μ��̸��� ��ȸ�ϼ���
SELECT ENAME ����̸�, JOB ����, TO_CHAR(HIREDATE,'YYYY"�� "MM"��" DD"��"') �Ի�, DNAME �μ��̸�

FROM  EMP E, DEPT D

WHERE
    E.DEPTNO = D.DEPTNO --��������
    AND TO_CHAR(HIREDATE,'YY')='81'; --�Ϲ�����









