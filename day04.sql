/*
    참고 ] having 절 : 그룹화한 결과를 필터링 할때 필터링 조건을 기술하는 절..
           where 절에는 그룹함수를 사용하지 못하지만, having 절에는 그룹함수를 사용할 수 있다.
*/
/*
    JOIN : Relation Database Management System (=RDMBS) 에서는 데이터의 중복(=무결성)을 피하기 위해서 테이블을 분리하고
            그럼으로서 테이블들 간 관계가 형성이 되었다. 
            그런데 분리된 테이블에서 데이터를 추출해낼때 사용하는 문법이 JOIN 이다.
            
            참고 ] 오라클역시 er형태의 데이터베이스이다.
            ER : 엔티티(테이블)끼리의 관계를 이야기 하고 이런 관계들로 테이블을 관리하는 데이터베이스를 관계형 데이터베이스라고 한다. 
            
            참고 ] 관계형데이터베이스에서는 여러개의 테이블에서 동시에 검색하는 기능은 이미 가지고 있다.
                    이때 여러개의 테이블에서 데이터 동시에 검색하면 Cartesion Product가 만들어지는데 
                    이 결과에는 정확하지 않은 데이터도 포함되어 있다.
                    따라서 정확한 데이터만 필터링해서 꺼내와야 하는데 이때 이 필터링 하는 작업이 JOIN이라고 한다.
                    
            종류 ] Inner Join : 나열된 테이블들의 결과 집합 안에서 꺼내오는 조인
                        - Equi Join : 조인을 할때 동둥비교연산자로 조인을 하는 경우 
                        - Non Equi Join : 조인을 할때 동등비교연산자 이외의 연산자로 조인하는 경우
                   Outer Join : Catesian Product에 포함되지 않는 데이터를 가져오는 조인
                         형식 : 테이블이름, 필드이름 =  테이블이름.필드이름(+) 이때 (+)는 NULL로 표현되어야 할 테이블쪽에 붙여준다.
                   Self Join : 조인을 하는데 대상테이블이 같은 테이블을 사용하는 조인
                    
*/

-- 영문색상이름 테이블
DROP TABLE ecolor;
CREATE TABLE ecolor (
    ceno NUMBER(3) -- 영문 칼라 일련번호
        CONSTRAINT ECLR_NO_PK PRIMARY KEY,
    code VARCHAR2(7) -- 칼라 코드값
        CONSTRAINT ECLR_CODE_UK UNIQUE
        CONSTRAINT ECLR_CODE_NN NOT NULL,
    name varchar2(20)
        CONSTRAINT ECLR_NAME_NN NOT NULL
);

-- 데이터추가
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
-- 영문칼라테이블 조회
SELECT * FROM ecolor;
COMMIT; -- 메모리의 작업영역에서 작업한 내용을 데이터베이스에 적용시키는 명령


CREATE TABLE kcolor (
    ckno NUMBER(3)
        CONSTRAINT KCLR_NO_PK PRIMARY KEY,
    code VARCHAR2(7)
        CONSTRAINT KCLR_CODE_UK UNIQUE
        CONSTRAINT KCLR_CODE_NN NOT NULL,
    name varchar2(20)
        CONSTRAINT KCLR_NAME_NN NOT NULL
);

-- 데이터추가
INSERT INTO
    kcolor
VALUES(
    100, '#FF0000', '빨강'
);

INSERT INTO
    kcolor
VALUES(
    101, '#00FF00', '녹색'
);

INSERT INTO
    kcolor
VALUES(
    102, '#0000FF', '파랑'
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
    e.code = k.code -- 조인조건
;


--Outer Join
SELECT
    ceno cno, e.code, e.name ename, k.name kname
FROM
    ecolor e, kcolor k
WHERE
    e.code = k.code(+) -- 조인조건
;


--self join
-- 사원들의 사원이름, 상사번호, 상사이름, 상사급여 를 조회하세요

SELECT
    e.ename 사원이름, e.mgr 상사번호, s.ename 상사이름, s.sal 상사급여
FROM emp e, emp s
WHERE
    e.mgr = s.empno(+) --(+)Outer Join : king에 상사가 없으니까 null값을 추가하기 위하여 null값이 있는 테이블에 (+)를 추가
;

--사원들의 사원이름, 직급, 급여, 급여등급을 조회하세요
SELECT
    ENAME 사원이름, JOB 직급, SAL 급여, GRADE 급여등급
FROM EMP, SALGRADE
WHERE
SAL BETWEEN LOSAL AND HISAL
;

--사원들의 사원번호, 사원이름,직급, 부서이름, 부서위치를 조회하세요
SELECT EMPNO 사원번호, ENAME 사원이름, JOB 직급, DNAME 부서이름,LOC 부서위치
FROM EMP E, DEPT D --DEPT가 겹쳐서 구분해주기 위함
WHERE
    E.DEPTNO = D.DEPTNO
;

--81년 입사한 사원의 사원이름, 직급, 입사일, 부서이름을 조회하세요
SELECT ENAME 사원이름, JOB 직급, TO_CHAR(HIREDATE,'YYYY"년 "MM"월" DD"일"') 입사, DNAME 부서이름

FROM  EMP E, DEPT D

WHERE
    E.DEPTNO = D.DEPTNO --조인조건
    AND TO_CHAR(HIREDATE,'YY')='81'; --일반조건









