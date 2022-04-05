--day08
/*
    시퀀스(Sequence) : 우리가 테이블을 만들면 각각의 행을 구분할 수 있는 기본 키가 거의 필수적으로 존재해야 한다.                       
                       예를들어 사원을 관리하는 테이블을 만들면 각각의 사원을 구별할 수 있는 무언가가 있어야 하고
                       따라서 우리가 가지고 있는 EMP 테이블에서는 사원번호(EMPNO)를 이용해서 이것을 처리하고 있다.
                       
                       몇몇개의 테이블은 이것을 명확하게 구분하여 처리할 수 있지만 그렇지 못한 테이블도 있다.
                       
                       예를들어 게시판 내용을 관리하는 테이블을 만들게 되면 제목, 글쓴이, 내용, 작성일, .....
                       등이 있지만 이것 중에서는 명확하게 한 글의 데이터를 구분할 수 있는 역할을 하는 필드가 보이지 않는다.
                       이런 경우 대부분 일련번호를 이용해서 이 역할을 하도록 하고 있다.
                       
                       따라서 일련번호는 절대로 중복되어서는 안디고 절대로 생략되어서도 안된다.
                       (Primary Key == Unique + Not Null)
                       ==> 데이터베이스에 내용을 입력하는 사람이 문제가 발생할 수 있다.
                       
                       시퀀스는 이런문제때문에 해결하기 위해서 나타난 개념으로 자동적으로 일련번호를 발생시켜 주기 위한 도구이다.
                       
                       방법
                       1. 시퀀스를 만들어 놓는다.
                       2. 데이터베이스의 일련번호의 입력이 필요하면 만들어놓은 시퀀스에게 일련번호를 만들어달라고 요청한다.
                          즉, 데이터를 INSERT 시킬때 일련번호 부분은 입력하는 사람이 입력하는 것이 아니고 시퀀스에게 맡긴다.
                          
    시퀀스 생성 방법
        형식 ] 
            CREATE SEQUENCE 시퀀스이름
                START WITH 숫자   :   발생시킬 일련번호의 시작값. 생략하면 1부터 시작                                     
                INCREMENT BY 숫자 :   발생할 일련번호의 증가값. 생략하면 1씩 증가                
                MAXVALUE    숫자  :   발생시킬 일련번호의 최대값을 의미. 생략하면 NO를 사용한다.   
                MINVALUE    숫자  :   발생시킬 일련번호의 최소값을 의미. 생략하면 NO를 사용한다.
                CYCLE   또는  NOCYCLE :   발생시킬 일련번호가 최대값에 도달하면 다시 처음부터 시작할지 여부를 지정하는 옵션. 생략하면 NOCYCLE                                          
                CACHE   또는  NOCACHE :   일련번호 발생시 임시메모리를 사용할지 여부를 지정하는 옵션
                                (미리 일정갯수를 만들어놓고 메모리에 기억시킨 후에 사용. 사용하게 되면 속도는 빨라지는데 메모리가 줄어든다.
                                 사용하지 않으면 속도는 느려지지만 메모리가 줄지 않는다.)
-----------------------------------------------------------------------------------------------------
    시퀀스 사용방법
    데이터를 입력할 떄 자동으로 일련번호를 발생하기 위해서 만든 것이 시퀀스이다.
    따라서 주로 INSERT 명령에서 사용.
    형식 : 시퀀스이름.NEXTVAL
    시퀀스가 마지막으로 만든 번호 확인하는 방법 : 시퀀스이름.CURRVAL 
    
    시퀀스의 문제점 : 시퀀스는 테이블에 독립적이다.
                    즉, 한번만든 시퀀스는 여러 태이블에서 사용할 수 있다.
                    이때 어떤 테이블에서 시퀀스를 사용하던간에 항상 다음 일련번호를 만들어준다.
                    
    참고 ] 시퀀스의 수정
        형식 : ALTER SEQUENCE 시퀀스이름 
                INCREMENT BY 숫자
                MAXVALUE 숫자 (또는 NOMAXVALUE)
                MINVALUE 숫자 (또는 NOMINVALUE)
                CYCLE(또는 NOCYCLE)
                CACHE 숫자(또는 NOCACHE)
                
        참고 : 시퀀스를 수정하는경우 시작값은 수정할 수 없다.
                왜냐하면 이미 발생한 번호가 있기 떄문에 시작번호는 전에 만들어놓은 번호가 자동 시작번호가 된다.

시퀀스의 삭제
    형식 ] 
        DROP SEQUENCE 시퀀스이름;
        
    

*/


--문제 1 ] 1에서 1씩 증가하는 시퀀스 TEST_SEQ를 만들자. 단 최대값은 10으로 한다.
CREATE SEQUENCE TEST_SEQ
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 10;

SELECT  TEST_SEQ.NEXTVAL 다음번호,TEST_SEQ.CURRVAL 마지막번호 FROM DUAL;
--NEXTVAL이 호출되는 순간 CURRVAL에 자동으로 기억시킴.-> NEXTVAL이 호출되지 않으면 CURRVAL 이용X

SELECT TEST_SEQ.NEXTVAL FROM DUAL;
SELECT TEXT_SEQ.CURRVAL FROM DUAL;
SELECT TEXT_SEQ.NEXTVAL FROM DUAL;


    

--예 ] 회원번호를 자동으로 만들어줄 시퀀스를 생성하세요. 
        --(이름: MEMBSEQ, 시작값 : 1001, 증가값 : 1(생략가능), 다시 반복해서 만들지 않도록 함(생략하면 NOCYCLE)


CREATE SEQUENCE MEMBSEQ
    START WITH 1001
    INCREMENT BY 1  --생략가능
    MAXVALUE 9999
    NOCYCLE --생략가능
    NOCACHE --생략가능
    ;


--아바타 테이블 데이터 추가
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

--만들어놓은 시퀀스를 사용해서 회원데이터를 입력하세요.
INSERT INTO 
    MEMBER(MNO, NAME, ID, PW, MAIL, TEL,AVT, GEN) 
VALUES(
    1000,'고하늘','haneul','12345','hanul@naver.com','010-222-222',11,'F');


INSERT INTO 
    MEMBER(MNO, NAME, ID, PW, MAIL, TEL,AVT, GEN) 
VALUES(
    MEMBSEQ.nextval,'제니','jennie','12333','jennie@naver.com','010-1111-1111',14,'F');


INSERT INTO 
    MEMBER(MNO, NAME, ID, PW, MAIL, TEL,AVT, GEN) 
VALUES(
    MEMBSEQ.nextval,'리사','lisa','13455','lisa@naver.com','010-3444-4444',15,'F');
    
INSERT INTO 
    MEMBER(MNO, NAME, ID, PW, MAIL, TEL,AVT, GEN) 
VALUES(
    MEMBSEQ.nextval,'로제','rose','13344','rose@naver.com','010-4242-2424',16,'F');


INSERT INTO 
    MEMBER(MNO, NAME, ID, PW, MAIL, TEL,AVT, GEN) 
VALUES(
    MEMBSEQ.nextval,'지수','jisoo','13432','jisoo@naver.com','010-3423-2423',16,'F');

INSERT INTO 
    MEMBER(MNO, NAME, ID, PW, MAIL, TEL,AVT, GEN) 
VALUES(
    MEMBSEQ.nextval,'둘리','DOOLIE','1344','doolie@naver.com','010-3343-4443',11,'M');

COMMIT;

--------------------------------------------------------------------------

GRANT SELECT ON GUESTBOARD TO SCOTT;
DROP TABLE GUESTBOARD;
--방명록 테이블 생성
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
    
    
--게시글 등록에 사용할 글번호를 생성해주는 시퀀스 GBRDSEQ를 만드세요
--시작번호는 1001, 최대값은 9999, 최대값에 도달하더라도 다시 반복하지 않도록 하고 캐쉬는 사용하지 않는걸로 한다.

CREATE SEQUENCE GBRDSEQ
    START WITH 1001
    MAXVALUE 9999
    NOCYCLE
    NOCACHE;


--방명록에 방금만든 GBRDSEQ를 이용해서 글을 등록해보자.

INSERT INTO
    GUESTBOARD(GNO, WRITER,BODY)
VALUES(
    GBRDSEQ.nextval, 1000,'사이트 게시판 오픈 감축드립니다.'
);
INSERT INTO
    GUESTBOARD(GNO, WRITER,BODY)
VALUES(
    GBRDSEQ.nextval, 1005,'사이트 게시판 오픈 감축드립니다.2222'
);

INSERT INTO
    GUESTBOARD(GNO, WRITER,BODY)
VALUES(
    GBRDSEQ.nextval, 1006,'사이트 게시판 오픈 감축드립니다.3333'
);
INSERT INTO
    GUESTBOARD(GNO, WRITER,BODY)
VALUES(
    GBRDSEQ.nextval, 1001,'사이트 게시판 오픈 감축드립니다.4444'
);    
INSERT INTO
    GUESTBOARD(GNO, WRITER,BODY)
VALUES(
    GBRDSEQ.nextval, 1007,'사이트 게시판 오픈 감축드립니다.77777'
);    
    
    
    
--방명록에서 글번호, 작성자아이디, 작성자 성별, 
--작성자 아바타 저장이름, 글내용, 작성일을 조회

SELECT  GNO 글번호, WRITER 작성자아이디,A.SAVENAME 아바타저장이름,BODY 글내용,TO_CHAR(WDATE,'YYYY"년"MM"월"DD"일"') 작성일, M.ID 작성자,M.GEN 성별
FROM   GUESTBOARD , MEMBER M, AVATAR A
WHERE  WRITER = MNO AND AVT = ANO;
      
    
SELECT*FROM MEMBER;
--LISA 그리고 ROSE 아이디만 알고있다는 가정하에서 방명록에 글을 등록하세요


INSERT INTO GUESTBOARD(GNO,WRITER,BODY)
VALUES (
GBRDSEQ.nextval,(
    SELECT MNO
    FROM MEMBER
    WHERE ID = 'lisa'),'축하'
);

INSERT INTO GUESTBOARD(GNO,WRITER,BODY)
VALUES(
GBRDSEQ.nextval, (
    SELECT MNO
    FROM MEMBER
    WHERE ID = 'rose'),'바보'
);

----------------------------------------------------------------------------------
/*
    인덱스(Index) : 검색속도를 빠르게 하기 위해서 B-Tree 기법으로 색인을 만들어서 
                    SELECT를 빠른 속도로 처리할 수 있도록 하는 것.
    참고 : 인덱스를 만들면 안되는 경우
            1. 데이터 양이 적은 경우는 오히려 속도가 떨어진다.
                시스템에 따라서 달라지지만 최소한 몇십만개 이상의 데이터가 있는 경우에만 빨라진다.
            2. 데이터의 입출력이 빈번한 경우는 오히려 속도가 떨어진다. 
                왜냐하면 데이터가 입력될 때마다 계속해서 색인(인덱스)를 수정해야 하므로 오히려 불편.
                
                
    참고 ] 인덱스를 만들면 효과가 좋아지는 경우
            1. JOIN 등이 많이 사용되는 필드가 존재하는 경우
            2. NULL 값이 많이 존재하는 경우
            3. WHERE 조건절에 많이 사용되는 필드가 존재하는 경우
            
            
    참고 ] 제약조건을 추가할 때 기본키 그리고 유일키를 부여하면 자동적으로 해당 필드는 인덱스가 만들어진다.


인덱스 만드는 방법
    형식1 ] 일반인덱스 만드는 방법(NON UNIQUE INDEX
    
    CREATE INDEX 인덱스이름
    ON
        테이블이름(인덱스에 사용할 필드이름);
    
    참고 : 일반인덱스는 데이터가 중복되어도 상관이 없다.
    
    
    형식2 ] UNIQUE 인덱스 만들기
        ==> 인덱스용 데이터가 반드시 UNIQUE 하다는 보장이 있는 경우에 한해서 인덱스를 만드는 방법.
        
        CREATE UNIQUE  INDEX 인덱스이름
        ON
            테이블이름(필드이름);
    
        참고 : 이때 지정한 필드의 내용은 반드시 유일하다는 보장이 있어야 한다.
        장점 : 일반인덱스보다 처리속도가 빠르다. 왜냐하면 이진검색을 사용하기 때문이다.
    
    형식3 ] 결합인덱스
        ==> 여러개의 필드를 결합해서 하나의 인덱스를 만드는 방법
            이때도 전제조건이 있는데 여러개의 필드의 조합이 반드시 유일해야 한다.
            
            즉 하나의 필드만 가지고 유니크 인덱스를 만들지 못하는 경우
            여러개의 필드를 합쳐서 유니크 인덱스를 만들어서 사용하는 방법
            CREATE UNIQUE INDEX 인덱스이름
            ON 
                테이블이름(필드이름, 필드이름,....);
            
        복합기 제약조건 추가하기 
        CREATE TABLE 테이블이름(
            필드1 데이터타입(길이), 
            필드2 데이터타입(길이), 
            필드3 데이터타입(길이),  
            .....
            CONSTRAINT 제약조건이름 PRIMARY KEY(필드이름1, 필드이름2) : 복합키....
        );
        
    형식4 ] 비트인덱스 : 주로 그 안에 들어있는 데이터가 몇가지 중 하나인 경우에 많이 사용되는 방법
            예 ] GEN 필드에는 F, M, N만 입력할 것이다.
                
                DEPTNO 필드에는 10,20,30,40 번 부서만 입력되는데
                
                이것은 내부적으로 데이터를 이용해서 인덱스를 만들어서 사용하는 기법
                
                CREATE BITMAP INDEX 인덱스이름
                ON
                    테이블이름(필드이름);
            
*/

--회원테이블의 이름을 이용해서 인덱스를 만드세요.

CREATE INDEX name_idx
ON MEMBER(NAME);

    

--------------------------------------------------------------------------------
/*
  인라인뷰(InLine View) : 조회질의명령(SELECT 명령)을 내리면 결과가 발생한다.
                         이때 발생한 결과를 "인라인뷰"라고 말한다.
    
    즉, 뷰는 인라인 뷰 중에서 자주 사용하는 인라인뷰를 등록해서 사용하는 개념일 뿐이다.
    
    그런데 인라인 뷰는 하나의 가상의 테이블이다. (테이블이란 레코드와 필드로 구성된 데이터를 입력하는단위)
    따라서 인라인 뷰는 하나의 테이블로 다시 재 사용이 가능하다. 즉, 테이블을 사용해야 하는 곳에는 인라인뷰를 대신 사용할 수 있다.

인라인 뷰를 사용해야 하는 이유?
    실제 테이블에 존재하지 않는 데이터를 추가해서 사용해야 하는 경우 인라인뷰를 사용.
    
    참고 ]    ROWNUM : 이것은 가상의 필드로 데이터가 조회된 순서를 표시하는 필드
    
*/

SELECT
    MNO, NAME
FROM
    (SELECT * FROM MEMBER); --인라인뷰의 결과 중 회원번호와이름만 꺼내온 것.   
--에러가 발생하는 경우

SELECT
    MNO, ID, NAME, JOINDATE
FROM
    (
        SELECT  MNO, ID, NAME, MAIL -- <= 인라인 뷰의 결과에서 JOINDATE 필드는 만들어지지 않았다.
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
--ROWNUM은 한행을 꺼낸 후에 세겨짐.. 추가되는 순간 계속증가.... ==> 결국 추가되는게 아무것도 없음.


--예 ] 회원테이블의 회원들을 조회하는데 ROWNUM 기준으로 4~6 회원만 조회하세요(단, 정렬은 이름기준 내림차순)


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





