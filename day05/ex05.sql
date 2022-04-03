/*
    문제 1 ]
        이름이 SMITH인 사원과 동일한 직급을 가진 사원들의 정보를 출력하세요.
*/
SELECT *
FROM EMP
WHERE JOB=(
    SELECT JOB
    FROM EMP
    WHERE ENAME = 'SMITH'
);

/*
    문제 2 ]
        회사 평균 급여보다 급여를 적게 받는 사원들의
        사원이름, 직급, 급여[, 회사평균급여]
        를 조회하세요.
*/

SELECT ENAME 사원이름, JOB 직급, SAL 급여
FROM EMP
WHERE SAL< ALL(
    SELECT AVG(SAL)
    FROM EMP
);




/*
    문제 3 ]
        사원들중 급여가 제일 높은 사원의
        사원이름, 직급, 급여[, 최고급여]
        를 조회하세요.
*/

SELECT ENAME 사원이름, JOB 직급, SAL 급여
FROM EMP
WHERE SAL = (
SELECT MAX(SAL)
FROM EMP);
/*
    문제 4 ]
        KING 사원보다 이후에 입사한 사원들의
        사원이름, 직급, 입사일[, KING사원입사일]
        을 조회하세요.
*/
SELECT ENAME, SAL, HIREDATE
FROM EMP
WHERE HIREDATE>ALL(
SELECT HIREDATE
FROM EMP
WHERE ENAME = 'KING'
);


/*
    문제 5 ]
        각 사원의 급여와 회사평균급여의 차를 출력하세요.
        조회형식은
            사원이름, 급여, 급여의 차, 회사평균급여
        로 조회하세요.
*/
SELECT ENAME 사원이름, SAL 급여, SAL-(
SELECT FLOOR(AVG(SAL)) AVG
FROM EMP) 급여차이
FROM EMP;



/*
    문제 6 ]
        부서별 급여의 합이 제일 높은 부서 사원들의
        사원이름, 직급, 부서번호, 부서이름, 부서급여합계, 부서원수
        를 조회하세요.
*/






--부서 급여의 합이 가장 높은 부서 조회
SELECT MAX(SUM(SAL))
FROM EMP
GROUP BY DEPTNO;



--가장 높은부서추출 사원이름, 직급, 부서번호, 부서이름, 부서급여합계, 부서원수

SELECT DEPTNO
FROM EMP
GROUP BY DEPTNO
HAVING
    
    SUM(SAL)=(SELECT MAX(SUM(SAL))
                FROM EMP
                GROUP BY DEPTNO);


--사원이름, 직급, 부서번호, 부서이름, 부서급여합계, 부서원수 추출
SELECT E.ENAME, D.DNAME,NO ,SM,CNT
FROM EMP E, DEPT D , (SELECT DEPTNO NO, SUM(SAL) SM, COUNT(SAL) CNT
                        FROM EMP
                     GROUP BY DEPTNO
                     HAVING
                     SUM(SAL)= (SELECT MAX(SUM(SAL))
                                FROM EMP
                                GROUP BY DEPTNO))            
WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO = (
                    SELECT DEPTNO
                    FROM EMP
                    GROUP BY DEPTNO
                    HAVING   
                    SUM(SAL)=(SELECT MAX(SUM(SAL))
                    FROM EMP
                    GROUP BY DEPTNO));                     

















--부서별 급여의 합이 가장 높은
SELECT MAX(SUM(SAL))
 FROM EMP
 GROUP BY DEPTNO;
 
--부서별 급여의 합이 가장 높은 부서 

SELECT E.ENAME 사원이름, E.JOB 직급, DEPT 부서번호,D.DNAME 부서이름, SALSUM 부서급여합계, CNT 부서원수
FROM EMP E, DEPT D,(
    SELECT DEPTNO DEPT, SUM(SAL) SALSUM, COUNT(*) CNT
    FROM EMP
    GROUP BY DEPTNO
    HAVING SUM(SAL) = (
            SELECT MAX(SUM(SAL))
            FROM EMP
            GROUP BY DEPTNO
    )
   )
WHERE E.DEPTNO = D.DEPTNO   
;


















SELECT E.ENAME 이름, DEPT 부서코드, CNT 인원,SU 급여의합 , DEPT.DNAME 부서이름
FROM EMP E, DEPT,(
    SELECT DEPTNO DEPT, COUNT(*) CNT, SUM(SAL) SU
    FROM EMP
    GROUP BY DEPTNO
 HAVING 
    SUM(SAL) = ( 
                SELECT MAX(SUM(SAL))
                FROM EMP
                GROUP BY DEPTNO 
                )
)
WHERE E.DEPTNO = DEPT.DEPTNO;

     
 
 
 
 
 
 
 
 
 
 
 
 SELECT DEPTNO
 FROM EMP
 GROUP BY DEPTNO
 HAVING SUM(SAL) = (
SELECT MAX(SUM(SAL))
 FROM EMP
 GROUP BY DEPTNO );
 
-- 사원이름, 직급, 부서번호, 부서이름, 부서급여합계, 부서원수를 조회하세요.
        
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 SELECT E.ENAME, E.JOB, E.DEPTNO, E.SAL, D.DNAME
 FROM EMP E, DEPT D
 WHERE 
    D.DEPTNO = E.DEPTNO AND
    E.DEPTNO IN (
                    SELECT DEPTNO
                    FROM EMP
                    GROUP BY DEPTNO
                    HAVING SUM(SAL) = (
                    SELECT MAX(SUM(SAL))
                    FROM EMP
                    GROUP BY DEPTNO
    )
 );
 
 
    
 SELECT DEPTNO
 FROM EMP
 GROUP BY DEPTNO
 HAVING SUM(SAL) = (
 SELECT
 MAX(SUM(SAL)
 FROM EMP
 GROUP BY DEPTNO
 )


 
 
 
문제 7 ]
        커미션을 받는 사원이 한명이라도 있는 부서의 사원들의
        사원이름, 직급, 부서번호, 커미션
        을 조회하세요.
*/

SELECT ENAME 사원이름, JOB 직급, DEPTNO 부서번호, COMM 커미션
FROM EMP
WHERE DEPTNO = ALL(
    SELECT DEPTNO
    FROM EMP
    WHERE COMM IS NOT NULL AND COMM <>0)
;


/*
    문제 8 ]
        회사 평균급여보다 높고 
        이름이 4, 5글자인 사원들의
        사원이름, 급여, 이름글자길이[, 회사평균급여]
        를 조회하세요.
*/

SELECT ENAME 사원이름, SAL 급여, LENGTH(ENAME) 이름길이
FROM EMP
WHERE SAL>(
    SELECT AVG(SAL)
    FROM EMP
    WHERE LENGTH(ENAME) BETWEEN 4 AND 5

);



/*
    문제 9 ]
        사원이름의 글자수가 4글자인 사원과 같은 직급을 가진 사워들의
        사원이름, 직급, 급여
        를 조회하세요.
*/

SELECT ENAME 사원이름, JOB 직급, SAL 급여
FROM EMP
WHERE JOB = ANY(
    SELECT JOB
    FROM EMP
    WHERE LENGTH(ENAME) = 4
);



/*
    문제 10 ]
        입사년도가 81년이 아닌 사원과 같은 부서에 있는 사원들의
        사원이름, 직급, 급여, 입사일, 부서번호
        을 조회하세요.
*/
SELECT ENAME 사원이름, JOB 직급, SAL 급여, TO_CHAR(HIREDATE,'YY') 입사일, DEPTNO 부서번호 
FROM EMP
WHERE DEPTNO =ANY (
    SELECT DEPTNO
    FROM EMP
    WHERE TO_CHAR(HIREDATE, 'YY') <> '81');

/*
    문제 11 ]
        직급별 평균급여보다 한 직급이라도 급여가 많이 받는 사원의
        사원이름, 직급, 급여, 입사일
        을 조회하세요.
*/

SELECT ENAME 이름, JOB 직급, SAL 급여, HIREDATE 입사일
FROM EMP
WHERE SAL> ANY(
SELECT AVG(SAL)
FROM EMP
GROUP BY DEPTNO);


/*
    문제 12 ]
        모든 년도별 입사자의 평균 급여보다 많이 받는 사원들의
        사원이름, 직급, 급여, 입사년도
        를 조회하세요.
*/

--년도별 입사자 평균값 산출
 SELECT AVG(SAL)
    FROM EMP
    GROUP BY TO_CHAR(HIREDATE,'YY');
    
--입사자보다 많이 받는..

SELECT ENAME 사원이름, JOB 직급, HIREDATE 입사년도, SAL 급여
FROM EMP
WHERE SAL> ALL( SELECT AVG(SAL)
    FROM EMP
    GROUP BY TO_CHAR(HIREDATE,'YY'));



/*
    문제 13 ]
        최고급여자의 이름 글자수와 같은 글자수의 직원이 존재하면
        모든 사원의 사원이름, 이름글자수, 직급, 급여 를 조회하고
        존재하지 않으면 출력하지마세요.
*/

SELECT ENAME 이름, LENGTH(ENAME) 글자수, JOB 직급, SAL 급여
FROM EMP
WHERE LENGTH(ENAME) = ALL (   
    SELECT LENGTH(ENAME)
    FROM EMP
    WHERE LENGTH(ENAME)=LENGTH('최고급여자')
);
