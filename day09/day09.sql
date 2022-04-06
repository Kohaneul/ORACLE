--day09

 select empno, ename, job, hiredate, sal, grade, nvl(to_char(comm),'Ŀ�̼� ����')
 from emp , salgrade
 where sal between losal and hisal;


--system �������� �����ؼ� �ۼ��ϰ� ����
begin dbms_xdb.sethttpport('9090');
end;
/

/*
    ����ڰ��� : ������ �������� ������ �����ϴ� ���
    ���� : ������ ����� ���� ����. �ϳ��� ������ �ѻ���� ����� �� �ֵ� ������ �ѻ���� ����� �� �ִ� ���� ���� ������ db�̴�.
    
    1. ����ڸ����(��������)
        1) �����ڸ��� ������ �Ѵ�.
            sqlplus / as sysdba : �̸���� �������� ������ �Ǹ� ������ �������� ����Ŭ�� ������ ���°� �ȴ�.
        2)����ڸ����
            ���� ] 
                CREATE USER �����̸�   IDENTIFIED BY ��й�ȣ[ACCOUNT UNLOCK];
                
                ==> ACCOUNT UNLOCK : ������ ��ݻ��¸� �����ϴ� �ɼ�
            
            �� ] CREATE USER test01 IDENTIFIED BY 12345 ACCOUNT UNLOCK;     
                 test01 �̶�� ������ ����� ��� 12345�� �ؼ� ����� �ٷ� ��밡���ϵ��� ����ڴ�.
            ���� ] SHOW USER; : ���� ���� ������ � �������� �˾ƺ��� ���
                  ������ ����� �Ǹ� �� ������ �ƹ��� ���ѵ� ���� ���߱� ������ � �۾��� �� �� ���� ���·� ���������.
    */
    
    -- ���� ] TEST02 ������ 67890 �̶�� ��й�ȣ�� ������

    CREATE USER test02 IDENTIFIED BY 67890 ACCOUNT UNLOCK;
    
    /*
    2. ���� �ֱ�              
        ���� ] DCL ��� : Ʈ������ ó�� ���
                COMMIT  /  ROLLBACK / SAVEPOINT
              
              ���� ���� ��� (�ַ� �����ڰ������� ������)
                        GRANT : ������ �ִ� ��� 
                        REVOKE : ������ ������� ���
                        
        ���� ] GRANT �����̸�1, �����̸�2, ..... TO �����̸�;
        
        SESSION : ����Ŭ�� �����ϸ� ����Ŭ�� �����ϴ� �Ǹ��� ���ϸ� ����Ŭ�� ���ݿ� ���� �����Ǵ� ������ �޶�����.
                  (����Ŭ���� ������ �ǹ�)
                  
                  
        2) ��Ÿ ������ ������ ������ ���Ŀ� ���ؼ� �ʿ��� ������ �ο��ϸ� �ȴ�.
            �� ] ���̺��� ���� �� �ִ� ������ test01���� �ο��ϰ��� �Ѵٸ�
                GRANT UNLIMITED TABLESPACE, CREATE TABLE TO test01;
                
*/


--test02 ������ ���̺��� ���� �� �ִ� ����, ������ �� �ִ� ������ �ο��ϼ���.


GRANT UNLIMITED TABLESPACE, CREATE TABLE, CREATE SESSION TO test02;
                
-----------------------------------------------------------------------------------
/*
    ���� : ������ �ο��� �� ���Ǵ� �ɼ� 
            WITH ADMIN OPTION : ������ ������ ���ӹ��� �� �ֵ��� �ϴ� �ɼ�
            �ο��ϴ� ������ ���ؼ��� ������ ������ �ο��ϴ� �ɼ�
            
            GRANT CREATE VIEW TO test01; 

            GRANT SELECT ANY TABLE TO test01;(X) -- > create view ���ѿ� ���ؼ� ������ �丸 �־��� ������  
*/

--test02 �������� �並 ���� �� �ִ� ������ ������ ���ѱ��� �����ؼ� �ο��ϼ���
GRANT CREATE VIEW TO test02 WITH ADMIN OPTION;


---------------------------------------------------------------------------------
/*
    �ٸ������� ���̺� ����ϱ� : ��Ģ������ �ϳ��� ������ �� ���� ���� ���̺� ����� �� �ִ°��� ��Ģ�̴�.
                                ������ ������������ �ٸ� ������ ���̺��� �������� ����� �� �ִ�.
                                �̷��� �Ϸ��� �׿� ���� ������ ������ ����Ѵ�.
                                
                                �ٸ� ���� ���̺��� ��ȸ�� �� �ִ� ������ �ο��ϴ� ���
                                
                                GRANT SELECT ON (��ȸ�����̺��� �ִ�)����.���̺��̸� TO ���� ���� ����;
                                
*/

--SCOTT ������ emp ���̺��� ��ȸ�� �� �ִ� ������ test02 �������� �ο��ϼ���
GRANT SELECT ON SCOTT.EMP TO test02 WITH GRANT OPTION;

--TEST02 �������� ��� ������ ���̺��� ��ȸ�� �� �ִ� ������ �ο��ϼ���

GRANT SELECT ANY TABLE TO test02;
    

-----------------------------------------------------------------------------------
/*
    4. �����ڿ��� �ο����� ������ �ٸ� �������� �����ϱ�
        GRANT �����̸� TO ����
        WITH GRANT OPTION;
*/

CREATE USER test03 IDENTIFIED BY 12345 ACCOUNT UNLOCK;
GRANT CREATE SESSION, UNLIMITED TABLESPACE TO test03;


-----------------------------------------------------------------------------------

/*
    5. ����� ���� ���� : GRANT ����� ����ؼ� �ش� �������� ������ �ο��ϸ� �ȴ�.
        
    6. ���� ȸ���ϱ� : REVOKE    �����̸�    FROM    �����̸�
    
    7. ���� �����ϱ� : 
        ���� ] DROP USER �����̸� CASCADE;
*/


--TEST01, TEST02, TEST03 ������ �����ϼ���.
DROP USER test01 CASCADE;
DROP USER test02 CASCADE;
DROP USER test03 CASCADE;

--------------------------------------------------------------------------------

/*
     ���� �̿��� ���Ѻο� : ���Ѻο��� �����ڰ� ������ �������� �ʿ��� ������ �ϳ��� �����ؼ� �ִ� ������� ó���Ѵ�.
          
           ��(ROLE)�̶� : ���õ� ������ ������� ��ü(���ѵ��� ��Ʈ)�� �ǹ��ϴ� ���
            ���� ���� ����� ���Ѻο��� �������� ������ ���ÿ� �ο��ϴ� ����̴�.
     
     ��� ] 
        1. �̹� ������� ���� �̿��ϴ� ���
         �̹� ������� ���� ����
            1) CONNECT : �ַ� CREATE�� ���õ� ������ ���� ���� ��
            
            2) RESOURCE : ����� ��ü ������ ���õ� ������ ���� ���� ��
            
            3) DBA : ������ �������� ó���� �� �ִ� ������ ������ ������� ��
            
          ������ �ִ� ��� : GRANT ���̸� TO �����̸�;
            
        2. ���� ���� ���� �ο��ϴ� ��� : �� �ȿ� �� �ѿ� �ʿ��� ������ ����ڰ� �����ؼ� ���� �� �ο��ϴ� ���.
            
            �� ���� ����� ���
                1. ���� �����
                    CREATE ROLE ���̸�;
                2. �ѿ� ������ �ο�
                    GRANT �ο��� �����̸�, �����̸�.... TO ���̸�;
                3. ������� ���� ����� �������� �ο��Ѵ�.
                    GRANT ���̸� to �����̸�;
          
          
       �ο��� ���� ȸ���ϴ� ��� (���� �̿��ؼ� �ο��� ������ ȸ���ϴ� ���)
            ���� ] REVOKE ���̸� FROM �����̸�;
                
       ���� �����ϴ� ���
            ���� ] DROP ROLE ���̸�;
            
*/

-- 1. test/12345 ������ ���弼��.

CREATE USER test IDENTIFIED BY 12345 ACCOUNT UNLOCK;
--�����Ϸ��� ALTER USER test IDENTIFIED BY 12345 ACCOUNT UNLOCK;

-- 2. ���̺����̽��� ���� ���Ѱ� ������ ���� �� �ִ� ����, CONNECT , RESOURCE�� ������ ������ USERROLE01�� ����� 
--      �� ���� �̿��ؼ� TEST01�� ������ �ο��ϼ���.

--1) ���� �����
CREATE ROLE USERROLE01;
--2) �ѿ� ���� �ο�

GRANT 
    UNLIMITED TABLESPACE, CREATE SESSION, CONNECT, RESOURCE 

TO USERROLE01;

--3) �������� �ѷ� ���� �ο�
GRANT USERROLE01 TO test;

------------------------------------------------------------------------------------
/*
    ���Ǿ�(SYNONYM) : ���̺� ��ü�� ��Ī�� �ο��ؼ� ���� ����ڰ� ������ �̸����� �ϳ��� ���̺��� ����ϵ��� �ϴ� ��.
    ��, ���� ��ü(���̺�, ��, ������, ���ν���)�� �̸��� ���߰� ����ڿ��Դ� ��Ī�� �ο��ؼ� ��ü�� ��ȣ�ϵ��� �� �� �ִ� ���.
    
    �츮�� ���л���Ʈ���� �츮�� �̸��� ����� ���̵� ����ϴ� �Ͱ� ���������� ������ȣ�� �������� ���� �̸��� ���߱� ���� ��.
    
    �ַ� �ٸ� ������ ����ϴ� ����ڰ� ���̺� �̸��� �˸� ����ϱ� ������ �̵鿡�Դ� �������̺� �̸��� �˷��ָ鼭 
    ���� ���̺� �̸��� ���߱� ���� �������� ���. 
    
    ���� ] CREATE [PUBLIC] SYNONYM ���Ǿ��̸�
           FOR �����̸�;
           
    ���� :PUBLIC�� �����Ǹ� �� ���Ǿ�� ���� ���������� ����� �� �ִ� ���Ǿ �ȴ�.
          (���� ������ �ָ�, �ٸ� ���������� ����� �� �ִ�.)
          PUBLIC�� ���Ǹ� �ڵ������� �ٸ� ���������� ���� ���Ǿ �̿��ؼ� ���̺��� ����� �� �ְ� �ȴ�.
          
    ���� ] PUBLIC ���Ǿ ����ϱ� ���ؼ��� �ش� ��ü�� PUBLIC �������� �ο� �޾ƾ� �Ѵ�.
    
    PUBLIC ���Ǿ� ���� 
        PUBLCI SYNONYM : ��� �������� Ư�� ��ü(���̺�, ��, ������ .....)�� ����� �� �ֵ��� �ϴ� ��.
                    1. ���Ǿ ���� �������� PUBLIC SYNONYM�� �����
                    2. ������ �������� ������ ���Ǿ PUBLIC �������� �ο��ϰ�
                    3. �ٸ� �������� ����ϸ� �ȴ�.
                    
                    
    
          
*/

GRANT CREATE TABLE TO SCOTT;
GRANT CREATE VIEW TO SCOTT;


CREATE OR REPLACE VIEW BUDDY
AS
    SELECT  MNO,NAME,ID,GEN
    FROM    MEMBER
;

SELECT  *
FROM BUDDY;


-------------------------------------------------------------------------------------
--���Ǿ� ����
--SCOTT �������� SCOTT�� ������ �ִ� EMP ���̺��� ��ȸ�� �� �ִ� ������ �ּ���
GRANT SELECT ON SCOTT.EMP TO JENNIE;

GRANT CREATE SYNONYM, CREATE PUBLIC SYNONYM TO JENNIE;

GRANT SELECT ON PEMP TO PUBLIC;
    
SELECT  *
FROM    PEMP;

CREATE OR REPLACE VIEW TVIEW
AS(
    SELECT MNO, NAME, ID
    FROM    MEMBER

    );

----------------------------------------------------------------------------------
-- jennie ������ �����ؼ� �۾�
INSERT INTO
    member(mno, name, id, pw, mail, tel, gen, avt)
VALUES(
    MEMBSEQ.nextval, 'yuna', 'yuna', '12345', 'yuna@githrd.com', '010-6464-6464', 'F', 14
);

INSERT INTO
    member(mno, name, id, pw, mail, tel, gen, avt)
VALUES(
    MEMBSEQ.nextval, 'seora', 'seora', '12345', 'seora@githrd.com', '010-3434-3434', 'F', 15
);

INSERT INTO
    member(mno, name, id, pw, mail, tel, gen, avt)
VALUES(
    MEMBSEQ.nextval, '�鼭��', 'sjin', '12345', 'sjin@githrd.com', '010-3737-3737', 'F', 16
);


UPDATE
    member
SET
    name = '������'
WHERE
    name = 'yuna'
;

UPDATE
    member
SET
    name = '�Ѽ���'
WHERE
    name = 'seora'
;

commit;

CREATE OR REPLACE VIEW buddy
AS
    SELECT
        mno, name, id, gen
    FROM
        member
;

SELECT
    *
FROM
    buddy
;

----------------------------------------------------------------------------------

--���Ǿ� ����
--JENNIE �������� SCOTT�� ������ �ִ� EMP ���̺��� ��ȸ�� �� �ִ� ����
GRANT SELECT ON SCOTT.EMP TO JENNIE;

GRANT CREATE SYNONYM, CREATE PUBLIC SYNONYM TO JENNIE;


--JENNIE�� ���� ���� ���Ǿ �ٸ� �������� ����� �� �ֵ��� �����ϰ�..

SELECT *
FROM PEMP;


----------------------------------------------------------------------------------
--JENNIE  �������� �����ؼ� �۾�
CREATE SYNONYM JEMP
FOR SCOTT.EMP;

SELECT *
FROM JEMP;

CREATE PUBLIC SYNONYM PEMP
FOR SCOTT.EMP;

CREATE OR REPLACE VIEW TVIEW
AS SELECT
    MNO, NAME, ID
    FROM MEMBER
;

CREATE PUBLIC SYNONYM TMP
FOR TVIEW;
---------------------------------------------------------

GRANT SELECT ON TMP TO PUBLIC;


