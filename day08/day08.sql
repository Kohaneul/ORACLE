--day08
/*
    ������(Sequence) : �츮�� ���̺��� ����� ������ ���� ������ �� �ִ� �⺻ Ű�� ���� �ʼ������� �����ؾ� �Ѵ�.                       
                       ������� ����� �����ϴ� ���̺��� ����� ������ ����� ������ �� �ִ� ���𰡰� �־�� �ϰ�
                       ���� �츮�� ������ �ִ� EMP ���̺����� �����ȣ(EMPNO)�� �̿��ؼ� �̰��� ó���ϰ� �ִ�.
                       
                       ���� ���̺��� �̰��� ��Ȯ�ϰ� �����Ͽ� ó���� �� ������ �׷��� ���� ���̺� �ִ�.
                       
                       ������� �Խ��� ������ �����ϴ� ���̺��� ����� �Ǹ� ����, �۾���, ����, �ۼ���, .....
                       ���� ������ �̰� �߿����� ��Ȯ�ϰ� �� ���� �����͸� ������ �� �ִ� ������ �ϴ� �ʵ尡 ������ �ʴ´�.
                       �̷� ��� ��κ� �Ϸù�ȣ�� �̿��ؼ� �� ������ �ϵ��� �ϰ� �ִ�.
                       
                       ���� �Ϸù�ȣ�� ����� �ߺ��Ǿ�� �ȵ�� ����� �����Ǿ�� �ȵȴ�.
                       (Primary Key == Unique + Not Null)
                       ==> �����ͺ��̽��� ������ �Է��ϴ� ����� ������ �߻��� �� �ִ�.
                       
                       �������� �̷����������� �ذ��ϱ� ���ؼ� ��Ÿ�� �������� �ڵ������� �Ϸù�ȣ�� �߻����� �ֱ� ���� �����̴�.
                       
                       ���
                       1. �������� ����� ���´�.
                       2. �����ͺ��̽��� �Ϸù�ȣ�� �Է��� �ʿ��ϸ� �������� ���������� �Ϸù�ȣ�� �����޶�� ��û�Ѵ�.
                          ��, �����͸� INSERT ��ų�� �Ϸù�ȣ �κ��� �Է��ϴ� ����� �Է��ϴ� ���� �ƴϰ� ���������� �ñ��.
                          
    ������ ���� ���
        ���� ] 
            CREATE SEQUENCE �������̸�
                START WITH ����   :   �߻���ų �Ϸù�ȣ�� ���۰�. �����ϸ� 1���� ����                                     
                INCREMENT BY ���� :   �߻��� �Ϸù�ȣ�� ������. �����ϸ� 1�� ����                
                MAXVALUE    ����  :   �߻���ų �Ϸù�ȣ�� �ִ밪�� �ǹ�. �����ϸ� NO�� ����Ѵ�.   
                MINVALUE    ����  :   �߻���ų �Ϸù�ȣ�� �ּҰ��� �ǹ�. �����ϸ� NO�� ����Ѵ�.
                CYCLE   �Ǵ�  NOCYCLE :   �߻���ų �Ϸù�ȣ�� �ִ밪�� �����ϸ� �ٽ� ó������ �������� ���θ� �����ϴ� �ɼ�. �����ϸ� NOCYCLE                                          
                CACHE   �Ǵ�  NOCACHE :   �Ϸù�ȣ �߻��� �ӽø޸𸮸� ������� ���θ� �����ϴ� �ɼ�
                                (�̸� ���������� �������� �޸𸮿� ����Ų �Ŀ� ���. ����ϰ� �Ǹ� �ӵ��� �������µ� �޸𸮰� �پ���.
                                 ������� ������ �ӵ��� ���������� �޸𸮰� ���� �ʴ´�.)
-----------------------------------------------------------------------------------------------------
    ������ �����
    �����͸� �Է��� �� �ڵ����� �Ϸù�ȣ�� �߻��ϱ� ���ؼ� ���� ���� �������̴�.
    ���� �ַ� INSERT ��ɿ��� ���.
    ���� : �������̸�.NEXTVAL
    �������� ���������� ���� ��ȣ Ȯ���ϴ� ��� : �������̸�.CURRVAL 
    
    �������� ������ : �������� ���̺� �������̴�.
                    ��, �ѹ����� �������� ���� ���̺��� ����� �� �ִ�.
                    �̶� � ���̺��� �������� ����ϴ����� �׻� ���� �Ϸù�ȣ�� ������ش�.
                    
    ���� ] �������� ����
        ���� : ALTER SEQUENCE �������̸� 
                INCREMENT BY ����
                MAXVALUE ���� (�Ǵ� NOMAXVALUE)
                MINVALUE ���� (�Ǵ� NOMINVALUE)
                CYCLE(�Ǵ� NOCYCLE)
                CACHE ����(�Ǵ� NOCACHE)
                
        ���� : �������� �����ϴ°�� ���۰��� ������ �� ����.
                �ֳ��ϸ� �̹� �߻��� ��ȣ�� �ֱ� ������ ���۹�ȣ�� ���� �������� ��ȣ�� �ڵ� ���۹�ȣ�� �ȴ�.

�������� ����
    ���� ] 
        DROP SEQUENCE �������̸�;
        
    

*/


--���� 1 ] 1���� 1�� �����ϴ� ������ TEST_SEQ�� ������. �� �ִ밪�� 10���� �Ѵ�.
CREATE SEQUENCE TEST_SEQ
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 10;

SELECT  TEST_SEQ.NEXTVAL ������ȣ,TEST_SEQ.CURRVAL ��������ȣ FROM DUAL;
--NEXTVAL�� ȣ��Ǵ� ���� CURRVAL�� �ڵ����� ����Ŵ.-> NEXTVAL�� ȣ����� ������ CURRVAL �̿�X

SELECT TEST_SEQ.NEXTVAL FROM DUAL;
SELECT TEXT_SEQ.CURRVAL FROM DUAL;
SELECT TEXT_SEQ.NEXTVAL FROM DUAL;


    

--�� ] ȸ����ȣ�� �ڵ����� ������� �������� �����ϼ���. 
        --(�̸�: MEMBSEQ, ���۰� : 1001, ������ : 1(��������), �ٽ� �ݺ��ؼ� ������ �ʵ��� ��(�����ϸ� NOCYCLE)


CREATE SEQUENCE MEMBSEQ
    START WITH 1001
    INCREMENT BY 1  --��������
    MAXVALUE 9999
    NOCYCLE --��������
    NOCACHE --��������
    ;


--�ƹ�Ÿ ���̺� ������ �߰�
INSERT INTO AVATAR
VALUES(
    10, 'noimage','noimage.jpg','noimage.jpg','/img/avatar/',6000,'N',sysdate,'Y'
);


INSERT INTO AVATAR
VALUES(
    11, 'man1','img_avatar1.png','img_avatar1.png','/img/avatar/',11000,'M',sysdate,'Y'
);


INSERT INTO AVATAR
VALUES(
    12, 'man2','img_avatar2.png','img_avatar2.png','/img/avatar/',8000,'M',sysdate,'Y'
);


INSERT INTO AVATAR
VALUES(
    13, 'man3','img_avatar3.png','img_avatar3.png','/img/avatar/',8000,'M',sysdate,'Y'
);

INSERT INTO AVATAR
VALUES(
    14, 'woman1','img_avatar4.png','img_avatar4.png','/img/avatar/',8000,'F',sysdate,'Y'
);

INSERT INTO AVATAR
VALUES(
    15, 'woman2','img_avatar5.png','img_avatar5.png','/img/avatar/',8000,'F',sysdate,'Y'
);


INSERT INTO AVATAR
VALUES(
    16, 'woman3','img_avatar6.png','img_avatar6.png','/img/avatar/',8000,'F',sysdate,'Y'
);

CREATE TABLE MEMBER 
AS
    SELECT*FROM MEMB;
    
    
    
GRANT SELECT ON MEMBER TO SCOTT;

--�������� �������� ����ؼ� ȸ�������͸� �Է��ϼ���.
INSERT INTO 
    MEMBER(MNO, NAME, ID, PW, MAIL, TEL,AVT, GEN) 
VALUES(
    1000,'���ϴ�','haneul','12345','hanul@naver.com','010-222-222',11,'F');


INSERT INTO 
    MEMBER(MNO, NAME, ID, PW, MAIL, TEL,AVT, GEN) 
VALUES(
    MEMBSEQ.nextval,'����','jennie','12333','jennie@naver.com','010-1111-1111',14,'F');


INSERT INTO 
    MEMBER(MNO, NAME, ID, PW, MAIL, TEL,AVT, GEN) 
VALUES(
    MEMBSEQ.nextval,'����','lisa','13455','lisa@naver.com','010-3444-4444',15,'F');
    
INSERT INTO 
    MEMBER(MNO, NAME, ID, PW, MAIL, TEL,AVT, GEN) 
VALUES(
    MEMBSEQ.nextval,'����','rose','13344','rose@naver.com','010-4242-2424',16,'F');


INSERT INTO 
    MEMBER(MNO, NAME, ID, PW, MAIL, TEL,AVT, GEN) 
VALUES(
    MEMBSEQ.nextval,'����','jisoo','13432','jisoo@naver.com','010-3423-2423',16,'F');

INSERT INTO 
    MEMBER(MNO, NAME, ID, PW, MAIL, TEL,AVT, GEN) 
VALUES(
    MEMBSEQ.nextval,'�Ѹ�','DOOLIE','1344','doolie@naver.com','010-3343-4443',11,'M');

COMMIT;

--------------------------------------------------------------------------

GRANT SELECT ON GUESTBOARD TO SCOTT;
DROP TABLE GUESTBOARD;
--���� ���̺� ����
CREATE TABLE GUESTBOARD(
    GNO NUMBER(4) 
         CONSTRAINT GBOD_GNO_PK PRIMARY KEY,
    WRITER NUMBER(4) 
         CONSTRAINT GBOD_WRIT_FK REFERENCES MEMBER(MNO)
         CONSTRAINT GBOD_WRIT_UK UNIQUE
         CONSTRAINT GBOD_WRIT_NN NOT NULL,
     BODY VARCHAR2(4000 CHAR)
         CONSTRAINT GBOD_BODY_NN NOT NULL,
    WDATE DATE DEFAULT SYSDATE
        CONSTRAINT GBOD_DATE_NN NOT NULL,
    isShow CHAR(1) DEFAULT 'Y'
        CONSTRAINT GBOD_SHOW_CK CHECK (isShow IN ('Y','N'))
         CONSTRAINT GBOD_SHOW_NN NOT NULL
    );
    
    
--�Խñ� ��Ͽ� ����� �۹�ȣ�� �������ִ� ������ GBRDSEQ�� ���弼��
--���۹�ȣ�� 1001, �ִ밪�� 9999, �ִ밪�� �����ϴ��� �ٽ� �ݺ����� �ʵ��� �ϰ� ĳ���� ������� �ʴ°ɷ� �Ѵ�.

CREATE SEQUENCE GBRDSEQ
    START WITH 1001
    MAXVALUE 9999
    NOCYCLE
    NOCACHE;


--���Ͽ� ��ݸ��� GBRDSEQ�� �̿��ؼ� ���� ����غ���.

INSERT INTO
    GUESTBOARD(GNO, WRITER,BODY)
VALUES(
    GBRDSEQ.nextval, 1000,'����Ʈ �Խ��� ���� ����帳�ϴ�.'
);
INSERT INTO
    GUESTBOARD(GNO, WRITER,BODY)
VALUES(
    GBRDSEQ.nextval, 1005,'����Ʈ �Խ��� ���� ����帳�ϴ�.2222'
);

INSERT INTO
    GUESTBOARD(GNO, WRITER,BODY)
VALUES(
    GBRDSEQ.nextval, 1006,'����Ʈ �Խ��� ���� ����帳�ϴ�.3333'
);
INSERT INTO
    GUESTBOARD(GNO, WRITER,BODY)
VALUES(
    GBRDSEQ.nextval, 1001,'����Ʈ �Խ��� ���� ����帳�ϴ�.4444'
);    
INSERT INTO
    GUESTBOARD(GNO, WRITER,BODY)
VALUES(
    GBRDSEQ.nextval, 1007,'����Ʈ �Խ��� ���� ����帳�ϴ�.77777'
);    
    
    
    
--���Ͽ��� �۹�ȣ, �ۼ��ھ��̵�, �ۼ��� ����, 
--�ۼ��� �ƹ�Ÿ �����̸�, �۳���, �ۼ����� ��ȸ

SELECT  GNO �۹�ȣ, WRITER �ۼ��ھ��̵�,A.SAVENAME �ƹ�Ÿ�����̸�,BODY �۳���,TO_CHAR(WDATE,'YYYY"��"MM"��"DD"��"') �ۼ���, M.ID �ۼ���,M.GEN ����
FROM   GUESTBOARD , MEMBER M, AVATAR A
WHERE  WRITER = MNO AND AVT = ANO;
      
    
SELECT*FROM MEMBER;
--LISA �׸��� ROSE ���̵� �˰��ִٴ� �����Ͽ��� ���Ͽ� ���� ����ϼ���


INSERT INTO GUESTBOARD(GNO,WRITER,BODY)
VALUES (
GBRDSEQ.nextval,(
    SELECT MNO
    FROM MEMBER
    WHERE ID = 'lisa'),'����'
);

INSERT INTO GUESTBOARD(GNO,WRITER,BODY)
VALUES(
GBRDSEQ.nextval, (
    SELECT MNO
    FROM MEMBER
    WHERE ID = 'rose'),'�ٺ�'
);

----------------------------------------------------------------------------------
/*
    �ε���(Index) : �˻��ӵ��� ������ �ϱ� ���ؼ� B-Tree ������� ������ ���� 
                    SELECT�� ���� �ӵ��� ó���� �� �ֵ��� �ϴ� ��.
    ���� : �ε����� ����� �ȵǴ� ���
            1. ������ ���� ���� ���� ������ �ӵ��� ��������.
                �ý��ۿ� ���� �޶������� �ּ��� ��ʸ��� �̻��� �����Ͱ� �ִ� ��쿡�� ��������.
            2. �������� ������� ����� ���� ������ �ӵ��� ��������. 
                �ֳ��ϸ� �����Ͱ� �Էµ� ������ ����ؼ� ����(�ε���)�� �����ؾ� �ϹǷ� ������ ����.
                
                
    ���� ] �ε����� ����� ȿ���� �������� ���
            1. JOIN ���� ���� ���Ǵ� �ʵ尡 �����ϴ� ���
            2. NULL ���� ���� �����ϴ� ���
            3. WHERE �������� ���� ���Ǵ� �ʵ尡 �����ϴ� ���
            
            
    ���� ] ���������� �߰��� �� �⺻Ű �׸��� ����Ű�� �ο��ϸ� �ڵ������� �ش� �ʵ�� �ε����� ���������.


�ε��� ����� ���
    ����1 ] �Ϲ��ε��� ����� ���(NON UNIQUE INDEX
    
    CREATE INDEX �ε����̸�
    ON
        ���̺��̸�(�ε����� ����� �ʵ��̸�);
    
    ���� : �Ϲ��ε����� �����Ͱ� �ߺ��Ǿ ����� ����.
    
    
    ����2 ] UNIQUE �ε��� �����
        ==> �ε����� �����Ͱ� �ݵ�� UNIQUE �ϴٴ� ������ �ִ� ��쿡 ���ؼ� �ε����� ����� ���.
        
        CREATE UNIQUE  INDEX �ε����̸�
        ON
            ���̺��̸�(�ʵ��̸�);
    
        ���� : �̶� ������ �ʵ��� ������ �ݵ�� �����ϴٴ� ������ �־�� �Ѵ�.
        ���� : �Ϲ��ε������� ó���ӵ��� ������. �ֳ��ϸ� �����˻��� ����ϱ� �����̴�.
    
    ����3 ] �����ε���
        ==> �������� �ʵ带 �����ؼ� �ϳ��� �ε����� ����� ���
            �̶��� ���������� �ִµ� �������� �ʵ��� ������ �ݵ�� �����ؾ� �Ѵ�.
            
            �� �ϳ��� �ʵ常 ������ ����ũ �ε����� ������ ���ϴ� ���
            �������� �ʵ带 ���ļ� ����ũ �ε����� ���� ����ϴ� ���
            CREATE UNIQUE INDEX �ε����̸�
            ON 
                ���̺��̸�(�ʵ��̸�, �ʵ��̸�,....);
            
        ���ձ� �������� �߰��ϱ� 
        CREATE TABLE ���̺��̸�(
            �ʵ�1 ������Ÿ��(����), 
            �ʵ�2 ������Ÿ��(����), 
            �ʵ�3 ������Ÿ��(����),  
            .....
            CONSTRAINT ���������̸� PRIMARY KEY(�ʵ��̸�1, �ʵ��̸�2) : ����Ű....
        );
        
    ����4 ] ��Ʈ�ε��� : �ַ� �� �ȿ� ����ִ� �����Ͱ� ��� �� �ϳ��� ��쿡 ���� ���Ǵ� ���
            �� ] GEN �ʵ忡�� F, M, N�� �Է��� ���̴�.
                
                DEPTNO �ʵ忡�� 10,20,30,40 �� �μ��� �ԷµǴµ�
                
                �̰��� ���������� �����͸� �̿��ؼ� �ε����� ���� ����ϴ� ���
                
                CREATE BITMAP INDEX �ε����̸�
                ON
                    ���̺��̸�(�ʵ��̸�);
            
*/

--ȸ�����̺��� �̸��� �̿��ؼ� �ε����� ���弼��.

CREATE INDEX name_idx
ON MEMBER(NAME);

    

--------------------------------------------------------------------------------
/*
  �ζ��κ�(InLine View) : ��ȸ���Ǹ��(SELECT ���)�� ������ ����� �߻��Ѵ�.
                         �̶� �߻��� ����� "�ζ��κ�"��� ���Ѵ�.
    
    ��, ��� �ζ��� �� �߿��� ���� ����ϴ� �ζ��κ並 ����ؼ� ����ϴ� ������ ���̴�.
    
    �׷��� �ζ��� ��� �ϳ��� ������ ���̺��̴�. (���̺��̶� ���ڵ�� �ʵ�� ������ �����͸� �Է��ϴ´���)
    ���� �ζ��� ��� �ϳ��� ���̺�� �ٽ� �� ����� �����ϴ�. ��, ���̺��� ����ؾ� �ϴ� ������ �ζ��κ並 ��� ����� �� �ִ�.

�ζ��� �並 ����ؾ� �ϴ� ����?
    ���� ���̺� �������� �ʴ� �����͸� �߰��ؼ� ����ؾ� �ϴ� ��� �ζ��κ並 ���.
    
    ���� ]    ROWNUM : �̰��� ������ �ʵ�� �����Ͱ� ��ȸ�� ������ ǥ���ϴ� �ʵ�
    
*/

SELECT
    MNO, NAME
FROM
    (SELECT * FROM MEMBER); --�ζ��κ��� ��� �� ȸ����ȣ���̸��� ������ ��.   
--������ �߻��ϴ� ���

SELECT
    MNO, ID, NAME, JOINDATE
FROM
    (
        SELECT  MNO, ID, NAME, MAIL -- <= �ζ��� ���� ������� JOINDATE �ʵ�� ��������� �ʾҴ�.
        FROM MEMBER
    );



    SELECT *
    FROM  (
        SELECT ROWNUM RNO, G.*
        FROM 
            (SELECT  GNO,WRITER, BODY, WDATE  
            FROM GUESTBOARD 
            WHERE isShow = 'Y'
            ORDER BY WDATE DESC
            ) G
        
        )
        WHERE RNO BETWEEN 3 AND 5
        ;
--ROWNUM�� ������ ���� �Ŀ� ������.. �߰��Ǵ� ���� �������.... ==> �ᱹ �߰��Ǵ°� �ƹ��͵� ����.


--�� ] ȸ�����̺��� ȸ������ ��ȸ�ϴµ� ROWNUM �������� 4~6 ȸ���� ��ȸ�ϼ���(��, ������ �̸����� ��������)


SELECT *
FROM (
SELECT ROWNUM RO, N.*
FROM  
(SELECT MNO, ID, NAME, MAIL, TEL, M.GEN, JOINDATE, AVT, SAVENAME
FROM AVATAR A, MEMBER M
WHERE M.AVT = A.ANO) N)
WHERE RO BETWEEN 4 AND 6;












SELECT *
FROM(
SELECT ROWNUM RN,M.*
FROM
(SELECT M.*
    FROM MEMBER  M, AVATAR A
    WHERE AVT = ANO
    ORDER BY NAME DESC) M
)
WHERE RN BETWEEN 4 AND 6;










SELECT *
(
SELECT ROWNUM
FROM(
SELECT  *
FROM MEMBER
WHERE    isShow = 'Y'
ORDER BY NAME DESC) M
)RO
WHERE RO BETWEEN 4 AND 6
;




SELECT *
FROM(
    SELECT ROWNUM RNO, G.*
    FROM
        (        
        SELECT  *
        FROM MEMBER
        WHERE isShow = 'Y'
        ORDER BY NAME DESC) G)
WHERE RNO BETWEEN 4 AND 6
        ;
        
        
        
;





