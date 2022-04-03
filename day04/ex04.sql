-- 문제1 ]  직급이 MANAGER 인 사원의 사원이름, 직급, 입사일, 급여, 부서이름을 조회하세요
SELECT ENAME 사원이름, JOB 직급, HIREDATE 입사일, SAL 급여, DNAME 부서이름
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;


--문제2 ] 사원이름이 다섯글자인 사원들의 사원이름, 직급, 입사일, 급여, 급여등급을 조회하세요
SELECT ENAME 사원이름, JOB 직급, HIREDATE 입사일, SAL 급여, GRADE 급여등급
FROM EMP, SALGRADE
WHERE SAL BETWEEN LOSAL AND HISAL;


--문제3 ] 입사일이 81년이고 직급이 MANAGER인 사원들의 사원이름, 직급, 입사일, 급여, 급여등급, 부서이름, 부서위치를 조회하세요
SELECT E.ENAME 사원이름, E.JOB 직급,E.HIREDATE 입사일,E.SAL 급여,GRADE 급여등급,D.DNAME 부서이름,D.LOC 부서위치
FROM EMP E,DEPT D, SALGRADE
WHERE 
    E.SAL BETWEEN LOSAL AND HISAL AND
    TO_CHAR(HIREDATE,'YY')='81' AND 
    E.DEPTNO = D.DEPTNO AND JOB = 'MANAGER';











SELECT ENAME 사원이름, JOB 직급, HIREDATE 입사일, SAL 급여, GRADE 급여등급, DNAME 부서이름, LOC 부서위치
FROM EMP, DEPT, SALGRADE
WHERE (SAL BETWEEN LOSAL AND HISAL)
    AND EMP.DEPTNO = DEPT.DEPTNO
    AND TO_CHAR(HIREDATE,'YY')='81'
    AND JOB = 'MANAGER';


--문제 4 ] 사원들의 사원이름, 직급, 급여, 급여등급, 상사이름을 조회하세요
select e.ename 사원이름, e.job 사원직급, e.sal 사원급여, grade 급여등급, nvl(m.ename,'상사없음') 상사이름
from emp e, emp m, salgrade
where
    e.mgr = m.empno(+) and (e.sal between losal and hisal);





SELECT * FROM EMP, SALGRADE
WHERE
    ENAME = 'KING'
   AND SAL BETWEEN LOSAL AND HISAL 
    ;


--문제 5 ]  사원들의 사원이름, 직급, 급여, 상사이름, 부서이름, 급여등급을 조회하세요.
select e.ename 사원이름, e.job 직급, e.sal 급여, nvl(m.ename,'상사없음') 상사이름, dname 부서이름, grade 급여등급
from emp e, emp m, salgrade, dept
where
    e.mgr = m.empno(+) and (e.sal between losal and hisal) and
    e.deptno = dept.deptno
    ;

--------------------------------------------------------------------------------
/*
    ANSI JOIN : 질의명령은 데이터베이스(DBMS)에 따라서 약간씩 그 문법이 달라진다.
    ANSI 형식이란 미국국립표준협회(ANSI)에서 공통의 질의명령을 만들고자 해서 통일된 방식의 명령을 만들어놓은 것. 
                  따라서 DBMS 를 가리지 않고 실행이 된다.
                  
                  
----------------------------------------------------------------------------------                  
    1. Cross Join : 오라클의 Cartesion Product 를 생성하는 조인
        형식 ] SELECT 필드이름,..... FROM 테이블 CROSS JOIN 테이블2;
    2. Inner Join : Equi Join, Non Eqi Join, Self Join
        형식 ] SELECT 필드이름,.... 
               FROM 테이블1 (INNER) JOIN 테이블2.... 
               ON 조인조건
               WHERE 일반조건
        참고 ] 조인조건은 ON 절에서 기술하고 일반조건은 WHERE절에서 기술한다.
               INNER JOIN이 가장 일반적인 조인이기 떄문에 INNER 라는 단어를 생략하면 INNER JOIN을 해석해서 실행하게 된다.
    3. OUTER JOIN : Cartesion
        형식 ] SELECT 필드이름...
               FROM 테이블1 LEFT || RIGHT || FULL OUTER JOIN 테이블2     참고) || : 또는
               ON 조인조건...;
               이때 방향은 데이터가 있는 쪽 테이블을 가리키면 된다.
        참고 ] 조인이 2개이상 되는 경우에는 
        형식 ] SELECT
               FROM 테이블이름 
               JOIN 테이블2
               ON 조인조건
               JOIN 테이블3
               ON 조인조건2;
*/

--ANSI JOIN
-- CROSS JOIN : 사원 정보와 부서정보를 크로스조인하세요.
SELECT
    *
FROM EMP CROSS JOIN DEPT;

--INNER JOIN : 사원들의 사원직급, 부서번호, 부서이름을 조회하세요
SELECT EMAME 사원이름, JOB 직급, E.DEPTNO 부서번호, DNAME 부서이름 
FROM EMP E INNER JOIN DEPT D
ON --조인조건절
E.DEPTNO = D.DEPTNO
;


--81년 입사한 사원들의 사원이름, 직급, 입사년도, 부서이름을 조회하세요
SELECT ENAME 사원이름, JOB 직급, TO_CHAR(HIREDATE,'YY') 입사년도,DNAME 부서이름
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE TO_CHAR(HIREDATE,'YY')= '81'
;

--INNER JOIN 
--ON  --조인조건   E.DEPTNO = D.DEPTNO

--사원들의 사원이름, 급여, 급여등급을 조회하세요. NON EQUI JOIIN
SELECT ENAME, SAL, GRADE
FROM EMP JOIN  SALGRADE
ON SAL BETWEEN LOSAL AND HISAL;

--사원들의 사원이름, 상사이름을 조회하세요

SELECT E.ENAME 사원이름, NVL(S.ENAME,'상사없음') 상사이름
FROM
    EMP E JOIN EMP S
ON
    E.MGR = S.EMPNO(+);


-- 사원들의 사원이름, 상사이름을 조회하세요
SELECT
    E.ENAME 사원이름, S.ENAME 상사이름
FROM
    EMP E LEFT OUTER JOIN EMP S
ON
    E.MGR = S.EMPNO;

-- 사원들의 사원이름, 부서이름, 급여, 급여등급을 조회하세요
SELECT ENAME 사원이름, DNAME 부서이름,SAL 급여,GRADE 급여등급
FROM EMP E -- 공통적으로 조인하는 기본테이블을 넣어줘야함
JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
JOIN SALGRADE
ON E.SAL BETWEEN LOSAL AND HISAL;


--------------------------------------------------------------------------------
/*
    NATURAL JOIN : 자동조인 반드시 조인 조건식에 사용하는 필드의 이름이 동일하고 
                   반드시 동일한 필드가 한개일때 사용할 수 있는 조인
                   자동으로 중복되는 필드를 사용해서 조인하기 떄문에 조인조건을 기술하지 않는다.
        형식 ] SELECT 필드이름....
                FROM 테이블 1
              NATURAL JOIN 테이블2;
              
    USING JOIN : 반드시 조인 조건식에 사용하는 필드의 이름이 동일한 경우 
                 그리고 같은 이름을 필드가 여러개 존재해도 무방하다.
        형식 ] SELECT 필드이름..
               FROM   테이블1
               JOIN   테이블2
               USING  (조인에 사용할 필드이름)  
*/

-- 사원들의 사원이름, 부서이름을 조회하세요
SELECT ENAME 사원이름, DNAME 부서이름
FROM EMP
NATURAL JOIN DEPT; --필드를 꺼내서 똑같은 이름의 필드를 꺼내서 JOIN함


--TMP 테이블과 부서정보 테이블을 이용해서 사원들의 사원이름, 부서위치를 조회하세요
CREATE TABLE TMP
AS 
    SELECT
        E.*, DNAME
        FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO;



SELECT ENAME 사원이름, LOC 부서위치
FROM TMP
JOIN DEPT
USING (DEPTNO);


---------------------------------------------------------------------------------
/*
    부질의(SUB QUERY, 서브질의) : 
*/

-- 위 문제들을 ANSI JOIN을 사용한 질의명령을 작성하시오.



-- 사원들의 사원이름, 부서이름을 조회하세요
SELECT ENAME 사원이름, DNAME 부서이름
FROM EMP
JOIN DEPT
USING (DEPTNO);


SELECT ENAME 사원이름, DNAME 부서이름
FROM EMP NATURAL JOIN DEPT;


--TMP 테이블과 부서정보 테이블을 이용해서 사원들의 사원이름, 부서위치를 조회하세요
SELECT ENAME 사원이름, LOC 부서위치
FROM TMP
JOIN DEPT
USING(DEPTNO);
--------------------------------------------------------------------------------------

/*
    부질의(SUB QUERY, 서브질의) : 질의명령 안에 다시 질의명령을 포함하는 경우
                                 포함된 그 질의명령을 서브질의 또는 서브쿼리 라고 부른다.
        예 ] 이름이 SMITH인 사원과 같은 부서에 있는 사원들의 정보를 조회하세요
            ==> 이 경우 SMITH의 부서번호를 알아내기 위해서 먼저 질의명령이 실행되어야 한다.
                SMITH 사원의 부서를 뽑고 (부서가 같다면) 각 사원들의 부서번호 비교.........
            ==> 부서번호를 이용해서 정보를 조회
            
            이때 위의 질의명령을 아래 메인 질의명령에서 사용해서 명령을 보내고 조회해서 사용해야 한다.
            이떄 서브질의를 감싸는 질의명령을 메인질의 명령이라고 한다.
            서브질의의 위치에 따른 결과
            1. SELECT 절 :  이 부분에 사용되는 질의명령은 결과가 반드시 한행 , 한 필드가 나와야 한다.
            2. FROM 절 : FROM 절에는 테이블이 나열되어야 한다. 그런데 조회질의 명령의 결과는 마치 테이블과 같다.
                         그러면 이 조회 질의 명령의 결과를 테이블처럼 사용할 수 있는 방법
                         이 떄 FROM 절 안에 들어가는 서브질의를 특별히 마치 테이블과 같다 해서 INLINE TABLE이라고 부른다.
                         이떄 사용은 질의명령을 보낼때 사용한 별칭을 사용해서 데이터를 꺼내야 한다.
            3. WHERE 절
                1. 단일행 단일필드로 결과가 발생하는 경우 : 결과를 비교에 사용하면 된다.
                
                2. 다중행 단일필드로 결과가 발생하는 경우 
                    -서브질의의 결과가 다중행으로 단일필드로 발생하는 경우 이 떄 사용하는 연산자가 
                    IN : 여러개의 데이터 중 하나만 맞으면 되는 경우. 여러값 중 하나와 묵시적으로 동등비교 처리한다.
                    ANY : 여러개의 데이터 중 하나만 맞으면 되는 경우 . 대소비교 연산자도 사용 가능
                    ALL : 여러개의 데이터가 모두 맞으면 되는 경우
                          ==> 동등비교는 사용할 수 없고, 대소비교할 떄 사용한다.
                3. 다중필드 복수의 필드로 결과가 발생하는 방법
                    EXISTS : 여러개의 데이터 중 하나만 맞으면 되는 경우, 
*/
--이름이 SMITH인 사원과 같은 부서에 있는 사원들의 정보를 조회하세요
SELECT *
FROM EMP
WHERE DEPTNO = (
        SELECT DEPTNO
        FROM EMP
        WHERE
        ENAME = 'SMITH'
);


--사원들의 사원이름, 부서번호, 부서이름, 부서위치 조회


SELECT ENAME 사원이름, DEPTNO 부서번호,(
        SELECT DNAME
        FROM DEPT
        WHERE E.DEPTNO = DEPTNO
    ) 부서이름,
    (
        SELECT LOC
        FROM DEPT
        WHERE E.DEPTNO = DEPTNO
    ) 부서위치
FROM EMP E;


----------------------------------------------------------------------------------
--IN
--직급이 MANAGER인 사원과 같은 부서에 속한 사원들의 사원이름, 직급 , 부서번호를 조회하세요

SELECT
    ENAME 사원이름, JOB 직급, DEPTNO 부서번호
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
--  각 부서 평균 급여보다 한 부서라도 급여가 높은 사람들의 사원이름, 사원급여, 부서번호를 조회하세요
SELECT
    ENAME 사원이름, SAL 사원급여, DEPTNO 부서번호
FROM EMP
WHERE SAL> ANY( --한 부서라도....
    SELECT AVG(SAL)
    
    FROM EMP
    
    GROUP BY DEPTNO
);

--모든 각 부서의 급여평균보다 높은 급여를 받는 사원들의 사원이름, 사원급여, 부서번호를 조회하세요

SELECT ENAME 사원이름, SAL 급여, DEPTNO 부서번호
FROM EMP
WHERE SAL> ALL( --모든 각부서의 급여 평균보다..==> ALL 사용
    SELECT AVG(SAL)
    FROM EMP
    GROUP BY DEPTNO);














SELECT ENAME 사원이름, DEPTNO 부서번호,
    (
    SELECT
        DNAME 
    FROM
        DEPT
    WHERE
        DEPTNO = E.DEPTNO
    )부서이름,
        (
    SELECT
        LOC 
    FROM
        DEPT
    WHERE
        DEPTNO = E.DEPTNO
    )부서위치
FROM EMP E;




-- 조건절에 단일행 단일필드의 결과 : SMITH 사원과 동일한 부서의 사원들의 정보를 조회하세요

SELECT *
FROM EMP
WHERE DEPTNO = (
        SELECT DEPTNO
        FROM EMP
        WHERE ENAME = 'SMITH');

--10번부서 사원들의 직급, 급여 평균을 조회하세요



SELECT JOB 직급이름,FLOOR(AVG(SAL)) 급여평균
FROM EMP
WHERE
    JOB IN ( --IN 연산자의 경우 부정을 하기위해서는 IN 앞에 NOT을 붙여준다. IN의 경우 다중행 단일필드...
    SELECT JOB
    FROM  EMP
    WHERE DEPTNO = 10 -- 질의명령의 결과는 다중값으로 발생한다, MANAGER, PRESIDENT, CLERK
)
GROUP BY JOB;


-- 사원 중 40번 부서 사원이 존재하면 모든 사원들의 사원이름, 부서번호를 조회하세요

SELECT ENAME 사원이름, DEPTNO 부서번호
FROM EMP
WHERE EXISTS (
    SELECT *
    FROM EMP
    WHERE DEPTNO = 40
);


SELECT ENAME, DEPTNO
FROM EMP
    /*
    테이블을 가르킬때 원칙은 계정.테이블이름의 형식으로 사용해야 한다.
    하지만 접속계정이 가지고 있는 테이블에 한해서는 테이블 이름만 기술해도 된다.
    */
WHERE EXISTS( --부정은 NOT EXISTS로 표현한다
        SELECT *
        FROM EMP
        WHERE DEPTNO = 40
);

---------------------------------------------------------------------------------------

--사원들 중 부서 평균급여보다 적게 받는 사원들의 사원이름, 부서번호, 부서원수, 부서평균급여, 부서급여합계를 조회하세요

SELECT ENAME 사원이름, DNO 부서번호, SAL 급여, CNT 부서원수, AVG 부서평균급여, SUM 부서급여합계 
FROM EMP, (
    SELECT DEPTNO DNO, COUNT(*) CNT, ROUND(AVG(SAL),2) AVG, SUM(SAL) SUM
    FROM EMP
    GROUP BY DEPTNO
)
WHERE DEPTNO = DNO AND AVG>SAL;





------------------------------------------------------------------------------------
SELECT ENAME,SAL
FROM EMP;



--회사 평균급여보다 적게받는 사원들의 사원이름, 직급, 입사일, 급여를 조회하세요

SELECT ENAME 사원이름, JOB 직급, HIREDATE 입사일, SAL 급여
FROM EMP
WHERE SAL< ALL(
    SELECT AVG(SAL)
    FROM EMP
);




