/*
    ��������
    ==> �����Ͱ� �Էµɶ� �̻��� �ִ� �����Ͱ� ���� ����� ����Ŭ ��ü
    
    ���� ]
        �����ͺ��̽��� �̻������� ������ �������� ���
        
    ���� ]
        �⺻Ű(PRIMARY KEY) ��������           
            -   �Ӽ������� �����͸� ������ �� �־�� �Ѵ�.
                �⺻Ű ���������� �ʼ��� �ƴ����� 
                �ǵ����̸� �⺻Ű ���������� �߰��ϴ� ���� ����.
                
                �⺻Ű�� ����Ű + NOT NULL ��������
                
        ����Ű(UNIQUE) �������� 
            ==> �Ӽ����� �ٸ� �����Ϳ� ������ �Ǿ�� �Ѵ�.
                NULL �����ʹ� �Է��� �� �ִ�.
                
        ����Ű(�ܷ�Ű, FOREIGN KEY) ��������
            ==> �����ϴ� ���̺��� Ű���� �ݵ�� ����ؾ� �ϴ� ��������
                �Էµ��� ���� Ű���� �Է����� ���ϵ��� ���� ��������
                ���� ���̺��� �����Ϸ��� �ϸ�
                ���� �����ϰ� �ִ� ���̺��� �����ϰ� �ش� ���̺��� �����ؾ� �Ѵ�.
                
        NOT NULL ��������
            ==> �Ӽ������� NULL �����Ͱ� �Է� �ȵǵ��� ���� ��������
            
        CHECK ��������
            ==> �ԷµǾ�� �� �Ӽ����� ������ �ִ� ���(�� ] ����, ���⿩��)
                �Էµ� �Ӽ��� �̿��� ���� �ԷµǴ� ���� �����ϴ� ��������
        
*/

-- emp ���̺� �Ѹ������ �Է��ϴµ� ����� �Ի����� ����ð������ϰ�
-- �μ��� 50�� �μ��� �Է��ϼ���.
INSERT INTO
    emp(empno, ename, hiredate, deptno)
VALUES(
    (
        SELECT
            NVL(MAX(empno) + 1, 1001)
        FROM
            emp
    ),
    '�Ѹ�', sysdate, 50
);


/*
    ����Ŭ���� ����� �� �ִ� ����������
    1. ������
     CHAR : ���������� ������
     ���� ] CHAR(�ִ����) : �̶� ��밡���� �ִ���̴� 2000����Ʈ ������ ����� �� �ִ�.
     LONG  : ���������� ������
     ���� ] LONG : �ִ���� 2GB���� ����� �� �ִ�.
     CLOB : ���������� ������
     ���� ] �ִ���̴� 4GB���� ����� �� �ִ�.
            �� Ÿ���� VARHCAR2�� 4KB������ ����ϱ� ������ �� �̻��� ���ڼ��� ���� �����ʹ� �Է¹��� ���Ѵ�.
            �� ������ �ذ��ϱ� ���� ������� �������� Ÿ��
     
     ���� ] �������� ������ : ������ ���̸� �̸� ������ �� �Է��� ���ڰ� ���̺��� �����ϸ� ������ �̿��ؼ�
            �ݵ�� ���� ������ ���ڸ� ���� �Է��ϴ� ���
            �����ȣ�� ���� ���̰� ���� ������ �����Ϳ� ���ؼ� �ַ� ���Ǵ� Ÿ��.
            
            �������� ������ : �Է��� ������ ���̿� ���� ������ ����ϴ� ������ �����ؼ�
                             ���ڿ��� ���̸� �Է��� ������ ���̿� ���ߴ� ����
                             �������� ���̸� �� �� ���� ��쿡 �ַ� ���� ���
            ó���ӵ��� ������������ �� ������.
            
    
    2. ������
        NUMBER 
        ���� ] NUMBER(����1[,����2])
            ����1 : ��ü�ڸ����� �ǹ�(��ȿ�ڸ���)
            ����2 : �Ҽ����� �ڸ����� �ǹ�
            
            ���� ] ����1 ���� ū ���� �Է¹��� ���Ѵ�.
                   ����2���� �Ҽ����ϰ� ������ �ڵ����� �ݿø��ؼ� �Է��Ѵ�.
    3. ��¥��
        DATE 
        ���� ] DATE
        �����ͺ��̽��� ���� ���������µ� �ణ�� �޶�����. 
        ANSI������ ���¶�� �ؼ� 
        ��� �����ͺ��̽��� ���밡���� �������¸� ǥ��ȭ��ȸ���� �����ϰ� �ִ�.
        
------------------------------------------------------------------------------------        

1. ���̺����
    ���� ] CREATE TABLE ���̺��̸�(
        �ʵ��̸�    ������Ÿ��(����),
        �ʵ��̸�    ������Ÿ��(����),
        ....
    );
    
    ���̺��� ��������ִ��� Ȯ���ϴ� ���
        SELECT tname FROM tab;
    
    ���̺� ������ �����ϰ� Ȯ��
    DESCRIBE ���̺��̸�;
    DESC     ���̺��̸�;
    
*/



--JENNIE ���� ����
CREATE USER jennie IDENTIFIED BY "12345" ACCOUNT UNLOCK;
GRANT resource, connect to jennie;
ALTER USER jennie DEFAULT TABLESPACE USERS;

--jennie �������� ����

--MEMBER ���̺� ����
CREATE TABLE MEMB(
    MNO NUMBER(4),
    NAME VARCHAR2(20 CHAR),
    ID VARCHAR2(15 CHAR),
    PW VARCHAR2(15 CHAR),
    MAIL VARCHAR2(50 CHAR),
    TEL VARCHAR2(13 CHAR),
    ADDR VARCHAR2(100 CHAR),
    GEN CHAR (1),
    JOINDATE DATE DEFAULT SYSDATE, 
    isShow CHAR(1) DEFAULT 'Y'
    
);

/*
    �������� �ο��ϴ� ���
        1. ���̺� ������ �� �߰��ϴ� ���
            ���� ] ���������� �̸��� �ο��ϴ� ��Ģ
                   ���̺��̸�, �ʵ��̸�, ���������� ���·� �ο��ϸ� �ȴ�.
                   �� ] MEMB ���̺��� �⺻Ű ��������
                        ==> MEMB_NO_PK
            ***
            1-1. �ʵ带 ������ �� �߰��ϴ� ���
                ���� ] �ʵ��̸� ������Ÿ��(����)
                        CONSTRAINT  ���������̸�   ��������1
                        CONSTRAINT  ���������̸�   ��������2
                        
                ���� ] 
                    ����Ű ��������
                        CONSTRAINT ���������̸� REFERENCES ���̺��̸�(�ʵ��̸�)
                        
                    üũ��������
                        CONSTRAINT ���������̸� CHECK(�ʵ��̸� IN(������1, ������2)
            1-2. �ʵ带 �̸� �����ϰ� ���߿� ���������� �߰��ϴ� ���
            
            1-3. ���� ������������ ����ϴ� ���
            
*/

--MEMBER ���̺� ����
DROP TABLE MEMB;

CREATE TABLE MEMB(
    MNO NUMBER(4), PRIMARY KEY,
    NAME VARCHAR2(20 CHAR),
    ID VARCHAR2(15 CHAR),
    PW VARCHAR2(15 CHAR),
    MAIL VARCHAR2(50 CHAR),
    TEL VARCHAR2(13 CHAR),
    ADDR VARCHAR2(100 CHAR),
    GEN CHAR (1),
    JOINDATE DATE DEFAULT SYSDATE, 
    isShow CHAR(1) DEFAULT 'Y'
    
);

INSERT INTO
    MEMB(MNO, NAME)
VALUES(
    1001,'��浿'
);

INSERT INTO
    MEMB(MNO,NAME)
VALUES(
    1001,'��ġ'
);

DROP TABLE MEMB;



--�ʵ带 �����ϸ鼭 ���������� �߰��ϴ� ���
CREATE TABLE MEMB(
    MNO NUMBER(4) CONSTRAINT MEMB_NO_PK PRIMARY KEY,
    NAME VARCHAR2(20 CHAR)
        CONSTRAINT MEMB_NAME_NN NOT NULL,
    ID VARCHAR2(15 CHAR)
        CONSTRAINT MEMB_ID_UK UNIQUE
        CONSTRAINT MEMB_ID_NN NOT NULL,
    PW VARCHAR2(15 CHAR)
        CONSTRAINT MEMB_PW_NN NOT NULL,
    MAIL VARCHAR2(50 CHAR)
    CONSTRAINT MEMB_MAIL_UK UNIQUE
    CONSTRAINT MEMB_MAIL_NN NOT NULL,
    TEL VARCHAR2(13 CHAR)
    CONSTRAINT MEMB_TEL_UK UNIQUE
    CONSTRAINT MEMB_TEL_NN NOT NULL,
    ADDR VARCHAR2(100 CHAR)
        CONSTRAINT MEMB_ADDR_NN NOT NULL,
    GEN CHAR (1)
        CONSTRAINT MEMB_GEN_CK CHECK(GEN IN('F','M'))
        CONSTRAINT MEMB_GEN_NN NOT NULL,
    JOINDATE DATE DEFAULT SYSDATE
        CONSTRAINT MEMB_JOIN_NN NOT NULL, 
    isShow CHAR(1) DEFAULT 'Y'
        CONSTRAINT MEMB_SHOW_CK CHECK(isShow IN('Y','N'))
        CONSTRAINT MEMB_SHOW_NN NOT NULL
);


-- �Խ��� ���̺�� ÷������ ���̺� ����� ���Ǹ���� �ۼ��ϼ���. 


CREATE TABLE GESI(
    BNO NUMBER(6) 
        CONSTRAINT GESI_NO_PK PRIMARY KEY,
    UPNO NUMBER(6)
        CONSTRAINT GESI_NAME_NN UNIQUE
        CONSTRAINT GESI_NAME_NN NOT NULL,
    BMNO NUMBER(4)
        CONSTRAINT GESI_ID_UK UNIQUE
        CONSTRAINT GESI_ID_NN NOT NULL,
    TITLE VARCHAR2(30 CHAR)
        CONSTRAINT GESI_TITLE_NN NOT NULL,
    BODY VARCHAR2(4000 CHAR)
        CONSTRAINT GESI_BODY_NN NOT NULL,
    BDATE DATE DEFAULT SYSDATE
        CONSTRAINT GESI_BDATE_NN NOT NULL,
    EDATE DATE DEFAULT SYSDATE
        CONSTRAINT GESI_EDATE_NN NOT NULL,
    CLICK NUMBER(6)
        CONSTRAINT GESI_CK_NN NOT NULL,
    isShow CHAR(1) DEFAULT 'Y'
        CONSTRAINT GESI_SHOW_CK CHECK(isShow IN('Y','N'))
        CONSTRAINT GESI_SHOW_CK NOT NULL);
        


--GESI








--CHUMBU




