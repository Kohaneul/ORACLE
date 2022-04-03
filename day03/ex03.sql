--��Ÿ�Լ��� ó��
/*
    ����1 ] �� ���޺��� �ѱ��������� ������� ����̸�, ����, �ѱ������� ��ȸ�ϼ���
    MANAGER : ������ ,  SALESMAN : �������, CLERK: ����, PRESIDENT : ����
*/
SELECT ENAME ����̸�, JOB ����, DECODE(JOB, 'CLERK','����','SALESMAN','�������','PRESIDENT','����','MANAGER','������','������') �ѱ�����
FROM EMP;



/*
����2 ] �� �μ����� �̹��� ���ʽ��� �ٸ��� �����Ϸ��� �Ѵ�. 
        10�� �μ��� �޿��� 10%, 
        20�� �μ��� �޿��� 15%, 
        30�� �μ��� �޿��� 20%�� �����ϱ�� �ߴ�
        �׸��� �ű㿡 ������ Ŀ�̼��� ���ؼ� �޿��� �����ϱ�� �ߴ�. 
        Ŀ�̼��� ���� ����� Ŀ�̼��� 0���� �ؼ� ����ؼ� ������� ����̸�, �μ���ȣ, �޿�, ���ޱ޿��� ��ȸ�ϼ���
*/

SELECT DEPTNO �μ���ȣ,ENAME ����̸�,SAL �޿�,SAL+DECODE(DEPTNO,'10',SAL*1.1,'20',SAL*1.15,SAL*1.2)+NVL(COMM,0) ���ޱ޿�
FROM EMP;


/*
    ���� 3 ]
        �Ի�⵵�� �������� �ؼ�
            80�� 'A���'
            81�� 'B���'
            82�� 'C���'
            �� �̿��� �ؿ� �Ի��� ����� 'D���'
            ���� ��ȸ�ǵ��� 
            �������
                ����̸�, ����, �Ի���, ���
            �� ��ȸ�ϼ���.
*/

SELECT ENAME ����̸�, JOB ����,HIREDATE �Ի���, 
        DECODE(TO_CHAR(HIREDATE,'YY'),'80','A���','81','B���','82','C���','D���') ���
FROM EMP;


/*
    ���� 4 ]
        ����̸��� ���ڼ��� 4���ڸ� 'Mr.'�� �̸��տ� ���̰�
        4���ڰ� �ƴϸ� �ڿ� ' ��'���� ��ȸ�ǵ���
        �������
            ����̸�, �̸����ڼ�, ��ȸ�̸�
        �� ��ȸ�ϼ���.
*/

SELECT ENAME ����̸�, LENGTH(ENAME)���ڼ�, CASE WHEN LENGTH(ENAME)=4 THEN CONCAT('Mr.',ENAME) ELSE CONCAT(ENAME,'��') END "��ȸ�̸�"
FROM EMP;

/*
    ���� 5 ]
        �μ���ȣ�� 10 �Ǵ� 20���̸�   �޿� + Ŀ�̼����� �����ϰ�
        �� �̿��� �μ��� �޿��� �����Ϸ��� �Ѵ�.
        �������
            ����̸�, ����, �μ���ȣ, �޿�, Ŀ�̼�, ���ޱ޿�
        �� ��ȸ�ϼ���.
        ��, Ŀ�̼��� ���� ���� 0���� ����ؼ� ����ϴ� ������ �Ѵ�.
*/

SELECT ENAME ����̸�, JOB ����, DEPTNO �μ���ȣ,CASE WHEN DEPTNO IN(10,20) THEN SAL+NVL2(COMM,COMM+SAL,SAL) ELSE SAL END"���ޱ޿�" 
FROM EMP;



/*
    ���� 6 ]
        �Ի������ �����, �Ͽ��� �� �����
            �޿��� 20% ���ؼ� �����ϰ�
        �� �̿��� ���Ͽ� �Ի��� �����
            �޿��� 10%�� ���ؼ� �����Ϸ��� �Ѵ�.
            
        �������
            ����̸�, �޿�, �Ի���, �Ի����, ���ޱ޿�
        �� ��ȸ�ϼ���.
*/

SELECT ENAME ����̸�, SAL �޿�, HIREDATE �Ի���, TO_CHAR(HIREDATE,'day') �Ի����,CASE WHEN TO_CHAR(HIREDATE,'day') IN('�����','�Ͽ���') THEN SAL*1.2 ELSE SAL*1.1 END "���ޱ޿�"
FROM EMP;

/*
    ���� 7 ]
        �ٹ��������� 490���� �̻��� �����
            Ŀ�̼��� 500 �� �߰��ؼ� �����ϰ�
        �ٹ��������� 490���� �̸��� �����
            Ŀ�̼��� ����Ŀ�̼Ǹ� �����ϵ��� �� �����̴�.
        �������
            ����̸�, Ŀ�̼�, �Ի���, �ٹ�������, ����Ŀ�̼�
        �� ��ȸ�ϼ���.
        ��, Ŀ�̼��� ���� ����� 0���� ����ϴ� ������ �Ѵ�.
*/

SELECT ENAME ����̸�, HIREDATE �Ի���,FLOOR(MONTHS_BETWEEN(SYSDATE,HIREDATE)) �ٹ�������,COMM ����Ŀ�̼�,
    CASE WHEN FLOOR(MONTHS_BETWEEN(SYSDATE,HIREDATE))>=490 THEN NVL2(COMM,COMM+500,500) ELSE NVL2(COMM,COMM,0) END "����Ŀ�̼�"
FROM EMP;
/*
    ���� 8 ]
        �̸� ���ڼ��� 5���� �̻��� ����� �̸���
            3����*** �� ǥ���ϰ�(�̸����̿� ���� * �� ǥ��...)
        �̸� ���ڼ��� 4���� ������ ����� �״�� ����� �����̴�.
        �������
            ����̸�, �̸����ڼ�, ��ȸ�̸�
        �� ��ȸ�ϼ���.
*/

SELECT ENAME ����̸�, LENGTH(ENAME) �̸����ڼ�, CASE WHEN LENGTH(ENAME)>=5 THEN RPAD(SUBSTR(ENAME,0,3),LENGTH(ENAME),'*') ELSE ENAME END "��ȸ�̸�"
FROM EMP;
--------------------------------------------------------------------------------
-- group by

/*
    ���� 1 ]
        �� �μ����� �ּ� �޿��� ��ȸ�Ϸ��� �Ѵ�.
        ���μ���
            �μ���ȣ, �ּұ޿�
        �� ��ȸ�ϼ���.
*/

SELECT  DEPTNO �μ���ȣ,MIN(SAL) �ּұ޿� 
FROM EMP
GROUP BY DEPTNO;
/*
    ���� 2 ]
        �� ���޺��� �޿��� �Ѿװ� ��ձ޿��� ���ް� �Բ� ��ȸ�ϼ���.
*/

SELECT JOB ���� ,SUM(SAL) �޿��Ѿ�, FLOOR(AVG(SAL)) ��ձ޿�
FROM EMP
GROUP BY JOB;


/*
    ���� 3 ]
        �Ի� �⵵���� ��� �޿��� �ѱ޿��� ��ȸ�ϼ���.
*/
SELECT TO_CHAR(HIREDATE,'YYYY')�Ի�⵵,AVG(SAL) ��ձ޿�, SUM(SAL) �ѱ޿�
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY');

/*
    ���� 4 ]
        �� �⵵���� �Ի��� ������� ��ȸ�ϼ���.
*/
SELECT TO_CHAR(HIREDATE,'YYYY')||'�⵵' �Ի�⵵, COUNT(HIREDATE)||'��' "�Ի��� ���"
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY');



/*
    ���� 5 ]
        ��� �̸��� ���ڼ��� �������� �׷�ȭ�ؼ� ��ȸ�Ϸ��� �Ѵ�.
        ��� �̸��� ���ڼ��� 4, 5 ������ ����� ���� ��ȸ�ϼ���.
*/
SELECT CONCAT(LENGTH(ENAME),'����') ���ڼ�,COUNT(ENAME) �����
FROM EMP
GROUP BY LENGTH(ENAME)
HAVING LENGTH(ENAME) BETWEEN 4 AND 5;

/*
    ���� 6 ]
        81�⵵�� �Ի��� ����� ���� ���޺��� ��ȸ�ϼ���.
*/

SELECT JOB ����,COUNT(HIREDATE) �ο�
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YY'),JOB
HAVING TO_CHAR(HIREDATE,'YY')=81
ORDER BY JOB;



/*
    ���� 7 ]
        ����̸��� ���ڼ��� 4, 5������ ����� ���� �μ����� ��ȸ�ϼ���.
        ��, ������� �ѻ�� ������ �μ��� ��ȸ���� �����ϼ���.
*/

SELECT DEPTNO �μ�,LENGTH(ENAME)||'����' ���ڼ�,COUNT(DEPTNO) "�����"
FROM EMP
GROUP BY DEPTNO,LENGTH(ENAME)
HAVING (LENGTH(ENAME) = 4 OR LENGTH(ENAME) =5) AND COUNT(DEPTNO)>1
ORDER BY DEPTNO;

/*
    ���� 8 ]
        81�⵵ �Ի��� ����� ��ü �޿��� ���޺��� ��ȸ�ϼ���.
        ��, ���޺� ��� �޿��� 1000 �̸��� ������ ��ȸ���� �����ϼ���.
*/

SELECT TO_CHAR(HIREDATE,'YY')||'��' �Ի�⵵,JOB ����, COUNT(JOB) ��, FLOOR(AVG(SAL)) "��� �޿�"
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YY'),JOB
HAVING  TO_CHAR(HIREDATE,'YY')= '81' AND AVG(SAL)>1000;





/*
    ���� 9 ]
        81�⵵ �Ի��� ����� �� �޿��� ����̸����ڼ� ���� �׷�ȭ�ϼ���.
        ��, �� �޿��� 2000 �̸��� ���� ��ȸ���� �����ϰ�
        �� �޿��� ���� �������� ���� ������� ��ȸ�ǰ� �ϼ���.
*/
SELECT ENAME �̸�, SUM(SAL) �ѱ޿�,TO_CHAR(HIREDATE,'YY')||'�⵵'�Ի�⵵
FROM EMP
GROUP BY ENAME,TO_CHAR(HIREDATE,'YY')
HAVING SUM(SAL)>2000 AND TO_CHAR(HIREDATE,'YY')='81'
ORDER BY SUM(SAL) DESC;



/*
    ���� 10 ]
        ��� �̸� ���̰� 4, 5 ������ ����� �μ��� ������� ��ȸ�ϼ���.
        ��, ������� 0�� ���� ��ȸ���� �����ϰ�
        �μ���ȣ ������� ��ȸ�ϼ���.
*/

SELECT DEPTNO �μ�,COUNT(DEPTNO) "�μ��� ��" 
FROM EMP
GROUP BY LENGTH(ENAME),DEPTNO
HAVING LENGTH(ENAME) BETWEEN 4 AND 5 AND COUNT(*)>0
ORDER BY DEPTNO ASC;
