-- DML (INSERT, UPDATE, DELETE)
CREATE TABLE EMP1
    ENAME VARCHAR2(10 CHAR) 


/*
    문제 1 ]
        emp1 테이블에 다음 데이터를 입력하세요.
        이름  : 둘리
        직급  : 머슴
        급여  : 10
        입사일 : 현재시간
*/

INSERT INTO EMP1(ENAME, JOB, HIREDATE)
VALUE('둘리','머슴',SYSDATE);


UPDATE EMP1
SET HIREDATE = SYSDATE,
    SAL = 10
WHERE ENAME = '둘리';

/*
    문제 2 ]
        emp1 테이블에 다음데이터를 입력하세요.
        이름  : 고길동
        직급  : 애완동물
        입사일 : 2022년 03월 21일
*/

INSERT INTO EMP1(EMPNO,ENAME,JOB,HIREDATE)
VALUES(1008,'고길동','애완동물','2022/03/21');


/*
    문제 3 ]
        emp1 테이블에 다음 데이터를 입력하세요.
        
        이름  : 희동이
        직급  : 대장
        급여  : NULL
        입사일 : 2022년 01월 01일
*/
INSERT INTO EMP1(EMPNO,ENAME, JOB, HIREDATE)
VALUES(1006,'희동이','대장','2022/01/01');


-- 데이터 수정
/*
    문제 4 ]
        emp1 테이블에서 다음 데이터를 수정하세요.
        제니, 로제, 리사, 지수
        사원의 이름을 이름앞에 'Miss.' 붙여서
        이름이 만들어지게 수정하세요.
        나머지사원들은 이름앞에 'Mr.' 을 붙여서 
        수정하세요.
*/

UPDATE EMP1
SET ENAME = DECODE(ENAME,'제니','Miss.'||ename,
                        '지수','Miss.'||ename,
                        '로제','Miss.'||ename,
                        '리사','Miss.'||ename,
                        'Mr.'||ename)
                    ;




UPDATE
    emp1
SET
    ename = DECODE(ename, '제니', 'Miss.' || ename,
                          '리사', 'Miss.' || ename,
                          '로제', 'Miss.' || ename,
                          '지수', 'Miss.' || ename,
                          'Mr.' || ename
    )
;

ALTER TABLE EMP1
MODIFY ENAME VARCHAR2(15 CHAR);

/*
    문제 5 ]
        emp1 테이블에서 
        입사년도가 81년 인 사원만
        급여를 25% 인상하는데 10단위 이하는 
        버림으로 처리하세요.
*/



UPDATE EMP1
SET SAL = ROUND(SAL*1.25,-2)
WHERE TO_CHAR(HIREDATE,'YY') = '81';


-- 다른 테이블의 데이터 복사
/*
    문제 6 ]
        emp 테이블의 'SMITH' 사원의 데이터를 복사해서
        emp1 테이블에 입력하세요.
*/
INSERT INTO EMP1
(
    SELECT *
    FROM EMP
    WHERE ENAME = 'SMITH'
);



-- 데이터 삭제
/*
    문제 7 ]
        emp1 테이블에서 부서번호가 10번인 사원만 삭제하세요.
*/
DELETE
FROM EMP1
WHERE DEPTNO = 10;
/*
    문제 8 ]
        emp1 테이블에서 이름이 'H'로 끝나는 사원만 삭제하세요.
*/

DELETE
FROM EMP1
WHERE ENAME LIKE '%H';
