--day09

 select empno, ename, job, hiredate, sal, grade, nvl(to_char(comm),'커미션 없음')
 from emp , salgrade
 where sal between losal and hisal;


--system 계정으로 접속해서 작성하고 실행
begin dbms_xdb.sethttpport('9090');
end;
/

/*
    사용자관리 : 관리자 계정에서 권한을 설정하는 방법
    계정 : 은행의 통장과 같은 개념. 하나의 통장은 한사람이 사용할 수 있듯 계정은 한사람이 사용할 수 있는 가장 작은 단위의 db이다.
    
    1. 사용자만들기(계정생성)
        1) 관리자모드로 접속을 한다.
            sqlplus / as sysdba : 이명령이 오류없이 실행이 되면 관리자 계정으로 오라클에 접속한 상태가 된다.
        2)사용자만들기
            형식 ] 
                CREATE USER 계정이름   IDENTIFIED BY 비밀번호[ACCOUNT UNLOCK];
                
                ==> ACCOUNT UNLOCK : 계정의 잠금상태를 해제하는 옵션
            
            예 ] CREATE USER test01 IDENTIFIED BY 12345 ACCOUNT UNLOCK;     
                 test01 이라는 계정을 만들고 비번 12345로 해서 만들고 바로 사용가능하도록 만들겠다.
            참고 ] SHOW USER; : 현재 접속 계정이 어떤 계정인지 알아보는 명령
                  계정을 만들게 되면 그 계정은 아무런 권한도 받지 못했기 떄문에 어떤 작업도 할 수 없는 상태로 만들어진다.
    */
    
    -- 문제 ] TEST02 계정을 67890 이라는 비밀번호로 만들어라

    CREATE USER test02 IDENTIFIED BY 67890 ACCOUNT UNLOCK;
    
    /*
    2. 권한 주기              
        참고 ] DCL 명령 : 트렌젝션 처리 명령
                COMMIT  /  ROLLBACK / SAVEPOINT
              
              권한 관련 명령 (주로 관리자계정에서 실행함)
                        GRANT : 권한을 주는 명령 
                        REVOKE : 권한을 뺏어오는 명령
                        
        형식 ] GRANT 권한이름1, 권한이름2, ..... TO 계정이름;
        
        SESSION : 오라클에 접속하면 오라클이 제공하는 권리를 말하며 오라클의 가격에 따라 제공되는 갯수가 달라진다.
                  (오라클로의 접속을 의미)
                  
                  
        2) 기타 권한은 위에서 지정한 형식에 의해서 필요한 권한을 부여하면 된다.
            예 ] 테이블을 만들 수 있는 권한을 test01에게 부여하고자 한다면
                GRANT UNLIMITED TABLESPACE, CREATE TABLE TO test01;
                
*/


--test02 계정에 테이블을 만들 수 있는 권한, 접속할 수 있는 권한을 부여하세요.


GRANT UNLIMITED TABLESPACE, CREATE TABLE, CREATE SESSION TO test02;
                
-----------------------------------------------------------------------------------
/*
    참고 : 권한을 부여할 때 사용되는 옵션 
            WITH ADMIN OPTION : 관리자 권한을 위임받을 수 있도록 하는 옵션
            부여하는 권한을 한해서만 관리자 권한을 부여하는 옵션
            
            GRANT CREATE VIEW TO test01; 

            GRANT SELECT ANY TABLE TO test01;(X) -- > create view 권한에 한해서 관리자 뷰만 주었기 떄문에  
*/

--test02 계정에게 뷰를 만들 수 있는 권한을 관리자 권한까지 포함해서 부여하세요
GRANT CREATE VIEW TO test02 WITH ADMIN OPTION;


---------------------------------------------------------------------------------
/*
    다른계정의 테이블 사용하기 : 원칙적으로 하나의 계정은 그 계정 내의 테이블만 사용할 수 있는것이 원칙이다.
                                하지만 여러계정들이 다른 계정의 테이블을 공동으로 사용할 수 있다.
                                이렇게 하려면 그에 따른 권한을 설정해 줘야한다.
                                
                                다른 계정 테이블을 조회할 수 있는 권한을 부여하는 방법
                                
                                GRANT SELECT ON (조회할테이블이 있는)계정.테이블이름 TO 권한 받을 계정;
                                
*/

--SCOTT 계정의 emp 테이블을 조회할 수 있는 권한을 test02 계정에게 부여하세요
GRANT SELECT ON SCOTT.EMP TO test02 WITH GRANT OPTION;

--TEST02 계정에게 모든 계정의 테이블을 조회할 수 있는 권한을 부여하세요

GRANT SELECT ANY TABLE TO test02;
    

-----------------------------------------------------------------------------------
/*
    4. 관리자에게 부여받은 권한을 다른 계정에게 전파하기
        GRANT 권한이름 TO 계정
        WITH GRANT OPTION;
*/

CREATE USER test03 IDENTIFIED BY 12345 ACCOUNT UNLOCK;
GRANT CREATE SESSION, UNLIMITED TABLESPACE TO test03;


-----------------------------------------------------------------------------------

/*
    5. 사용자 권한 수정 : GRANT 명령을 사용해서 해당 계정에게 권한을 부여하면 된다.
        
    6. 권한 회수하기 : REVOKE    권한이름    FROM    계정이름
    
    7. 계정 삭제하기 : 
        형식 ] DROP USER 계정이름 CASCADE;
*/


--TEST01, TEST02, TEST03 계정을 삭제하세요.
DROP USER test01 CASCADE;
DROP USER test02 CASCADE;
DROP USER test03 CASCADE;

--------------------------------------------------------------------------------

/*
     롤을 이용한 권한부여 : 권한부여는 관리자가 각각의 계정에게 필요한 권한을 하나씩 지정해서 주는 방식으로 처리한다.
          
           롤(ROLE)이란 : 관련된 권한을 묶어놓는 객체(권한들의 셋트)를 의미하는 용어
            따라서 롤을 사용한 권한부여는 여러개의 권한을 동시에 부여하는 방법이다.
     
     방법 ] 
        1. 이미 만들어진 롤을 이용하는 방법
         이미 만들어진 롤의 종류
            1) CONNECT : 주로 CREATE와 관련된 권한을 묶어 놓은 롤
            
            2) RESOURCE : 사용자 객체 생성에 관련된 권한을 묶어 놓은 롤
            
            3) DBA : 관리자 계정에서 처리할 수 있는 관리자 권한을 묶어놓은 롤
            
          권한을 주는 방법 : GRANT 롤이름 TO 계정이름;
            
        2. 직접 롤을 만들어서 부여하는 방법 : 롤 안에 그 롤에 필요한 권한을 사용자가 지정해서 만든 후 부여하는 방법.
            
            ★ 권한 만드는 명령
                1. 롤을 만들고
                    CREATE ROLE 롤이름;
                2. 롤에 권한을 부여
                    GRANT 부여할 권한이름, 권한이름.... TO 롤이름;
                3. 만들어진 롤을 사용자 계정에게 부여한다.
                    GRANT 롤이름 to 계정이름;
          
          
       부여된 롤을 회수하는 방법 (롤을 이용해서 부여된 권한을 회수하는 방법)
            형식 ] REVOKE 롤이름 FROM 계정이름;
                
       롤을 삭제하는 방법
            형식 ] DROP ROLE 롤이름;
            
*/

-- 1. test/12345 계정을 만드세요.

CREATE USER test IDENTIFIED BY 12345 ACCOUNT UNLOCK;
--수정하려면 ALTER USER test IDENTIFIED BY 12345 ACCOUNT UNLOCK;

-- 2. 테이블스페이스에 관련 권한과 세션을 만들 수 있는 권한, CONNECT , RESOURCE의 권한을 가지는 USERROLE01을 만들고 
--      이 롤을 이용해서 TEST01에 권한을 부여하세요.

--1) 롤을 만들고
CREATE ROLE USERROLE01;
--2) 롤에 권한 부여

GRANT 
    UNLIMITED TABLESPACE, CREATE SESSION, CONNECT, RESOURCE 

TO USERROLE01;

--3) 계정에게 롤로 권한 부여
GRANT USERROLE01 TO test;

------------------------------------------------------------------------------------
/*
    동의어(SYNONYM) : 테이블 자체에 별칭을 부여해서 여러 사용자가 각각의 이름으로 하나의 테이블을 사용하도록 하는 것.
    즉, 실제 객체(테이블, 뷰, 시퀀스, 프로시저)의 이름은 감추고 사용자에게는 별칭을 부여해서 객체를 보호하도록 할 수 있는 방법.
    
    우리가 포털사이트에서 우리의 이름을 대신해 아이디 사용하는 것과 마찬가지로 정보보호를 목적으로 실제 이름을 감추기 위한 것.
    
    주로 다른 계정을 사용하는 사용자가 테이블 이름을 알면 곤란하기 때문에 이들에게는 거짓테이블 이름을 알려주면서 
    실제 테이블 이름을 감추기 위한 목적으로 사용. 
    
    형식 ] CREATE [PUBLIC] SYNONYM 동의어이름
           FOR 실제이름;
           
    참고 :PUBLIC이 생략되면 이 동의어는 같은 계정에서만 사용할 수 있는 동의어가 된다.
          (물론 권한을 주면, 다른 계정에서도 사용할 수 있다.)
          PUBLIC이 사용되면 자동적으로 다른 계정에서도 만든 동의어를 이용해서 테이블을 사용할 수 있게 된다.
          
    참고 ] PUBLIC 동의어를 사용하기 위해서는 해당 객체가 PUBLIC 사용권한을 부여 받아야 한다.
    
    PUBLIC 동의어 정리 
        PUBLCI SYNONYM : 모든 계정에서 특정 객체(테이블, 뷰, 시퀀스 .....)를 사용할 수 있도록 하는 것.
                    1. 동의어를 만들 계정에서 PUBLIC SYNONYM을 만들고
                    2. 관리자 계정에서 공개할 동의어를 PUBLIC 사용권한을 부여하고
                    3. 다른 계정에서 사용하면 된다.
                    
                    
    
          
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
--동의어 예제
--SCOTT 계정에게 SCOTT이 가지고 있는 EMP 테이블을 조회할 수 있는 권한을 주세요
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
-- jennie 계정에 접속해서 작업
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
    MEMBSEQ.nextval, '백서진', 'sjin', '12345', 'sjin@githrd.com', '010-3737-3737', 'F', 16
);


UPDATE
    member
SET
    name = '정유나'
WHERE
    name = 'yuna'
;

UPDATE
    member
SET
    name = '한서라'
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

--동의어 예제
--JENNIE 계정에게 SCOTT이 가지고 있는 EMP 테이블을 조회할 수 있는 권한
GRANT SELECT ON SCOTT.EMP TO JENNIE;

GRANT CREATE SYNONYM, CREATE PUBLIC SYNONYM TO JENNIE;


--JENNIE가 만든 공개 동의어를 다른 곳에서도 사용할 수 있도록 공개하고..

SELECT *
FROM PEMP;


----------------------------------------------------------------------------------
--JENNIE  계정에서 접속해서 작업
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


