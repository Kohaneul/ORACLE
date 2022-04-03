/*
    문제 1 ]
        이름이 SMITH인 사원과 동일한 직급을 가진 사원들의 정보를 출력하세요.
*/

SELECT *
FROM EMP
WHERE JOB = ALL(
        SELECT JOB
        FROM EMP
        WHERE ENAME = 'SMITH');

/*
    문제 2 ]
        회사 평균 급여보다 급여를 적게 받는 사원들의
        사원이름, 직급, 급여[, 회사평균급여]
        를 조회하세요.
*/

--평균급여
SELECT ENAME 사원이름, JOB 직급, SAL 급여, AVERAGE 평균
FROM EMP E, (SELECT FLOOR(AVG(SAL)) AVERAGE 
            FROM EMP)
WHERE  E.SAL = SAL AND    
        SAL< ALL( 
                SELECT AVG(SAL)
                FROM EMP
                );

/*
    문제 3 ]
        사원들중 급여가 제일 높은 사원의
        사원이름, 직급, 급여[, 최고급여]
        를 조회하세요.
*/

--급여가 제일 높은 사원

SELECT ENAME 사원이름, JOB 직급, SAL 급여
FROM EMP
WHERE SAL = (SELECT MAX(SAL)
             FROM EMP);


/*
    문제 4 ]
        KING 사원보다 이후에 입사한 사원들의
        사원이름, 직급, 입사일[, KING사원입사일]
        을 조회하세요.
*/
--KING 입사일
SELECT E.ENAME 사원이름, E.JOB 직급, E.HIREDATE 입사일, HIRE KING입사
FROM EMP E, (SELECT HIREDATE HIRE
                FROM EMP
                WHERE ENAME = 'KING')
WHERE E.HIREDATE>(SELECT HIREDATE
                FROM EMP
                WHERE ENAME = 'KING');
           

/*
    문제 5 ]
        각 사원의 급여와 회사평균급여의 차를 출력하세요.
        조회형식은
            사원이름, 급여, 급여의 차, 회사평균급여
        로 조회하세요.
*/

SELECT E.ENAME 사원이름, E.SAL-AVGSAL "급여의 차", AVGSAL 회사평균급여
FROM EMP E, (SELECT ROUND(AVG(SAL),2) AVGSAL
                            FROM EMP);

/*
    문제 6 ]
        부서별 급여의 합이 제일 높은 부서 사원들의
        사원이름, 직급, 부서번호, 부서이름, 부서급여합계, 부서원수
        를 조회하세요.
*/


-- 부서별 급여의 합이 제일 높은 부서
SELECT MAX(SUM(SAL))
FROM EMP
GROUP BY DEPTNO
HAVING SUM(SAL) = MAX(SUM(SAL));

--부서 추출
SELECT DEPTNO, COUNT(*)
FROM EMP
GROUP BY DEPTNO
HAVING SUM(SAL) = (
                    SELECT MAX(SUM(SAL))
                    FROM EMP    
                    GROUP BY DEPTNO);
                    
--사원이름, 직급, 부서번호, 부서이름, 부서급여합계, 부서원수

SELECT E.ENAME 사원이름, D.DNAME 부서이름, SUM, CNT 부서원수, E.DEPTNO 부서번호
FROM EMP E,DEPT D, (SELECT SUM(SAL) SUM, COUNT(*) CNT
                    FROM EMP
                    GROUP BY DEPTNO
                    HAVING SUM(SAL) =  (
                                        SELECT MAX(SUM(SAL))
                                        FROM EMP    
                                        GROUP BY DEPTNO)
                                        )
WHERE E.DEPTNO = D.DEPTNO AND 
      E.DEPTNO = (SELECT DEPTNO DEP
                    FROM EMP
                    GROUP BY DEPTNO
                    HAVING SUM(SAL) =  (
                                        SELECT MAX(SUM(SAL))
                                        FROM EMP    
                                        GROUP BY DEPTNO)
                                        )
        ;




/*
 
 
 
문제 7 ]
        커미션을 받는 사원이 한명이라도 있는 부서의 사원들의
        사원이름, 직급, 부서번호, 커미션
        을 조회하세요.
*/


--커미션 부서이름 추출

SELECT ENAME 사원이름, JOB 직급, DEPTNO 부서번호, COMM 커미션
FROM EMP
WHERE DEPTNO = (    SELECT DEPTNO
                    FROM EMP
                    GROUP BY DEPTNO
                    HAVING DEPTNO = ANY 
                        (SELECT DEPTNO
                        FROM EMP
                        WHERE COMM IS NOT NULL));

/*
    문제 8 ]
        회사 평균급여보다 높고 
        이름이 4, 5글자인 사원들의
        사원이름, 급여, 이름글자길이[, 회사평균급여]
        를 조회하세요.
*/


SELECT ENAME 이름, SAL 급여, LENGTH(ENAME) 이름길자길이, FLOOR(AVG) 회사평균급여
FROM EMP, (
            SELECT AVG(SAL) AVG
            FROM EMP)
WHERE LENGTH(ENAME) BETWEEN 4 AND 5 AND
      SAL>(
            SELECT AVG(SAL)
            FROM EMP);
            
      




/*
    문제 9 ]
        사원이름의 글자수가 4글자인 사원과 같은 직급을 가진 사워들의
        사원이름, 직급, 급여
        를 조회하세요.
*/

--4글자인 사원 부서
SELECT JOB
FROM EMP
WHERE LENGTH(ENAME)= 4;



SELECT ENAME 사원이름, JOB 직급 , SAL 급여
FROM EMP
WHERE JOB IN (SELECT JOB
              FROM EMP
              WHERE LENGTH(ENAME)= 4)
;           

            
/*
    문제 10 ]
        입사년도가 81년이 아닌 사원과 같은 부서에 있는 사원들의
        사원이름, 직급, 급여, 입사일, 부서번호
        을 조회하세요.
*/

SELECT ENAME 사원이름, JOB 직급, SAL 급여, HIREDATE 입사일, DEPTNO 부서번호
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE TO_CHAR(HIREDATE,'YY')<>'81')
;

/*
    문제 11 ]
        직급별 평균급여보다 한 직급이라도 급여가 많이 받는 사원의
        사원이름, 직급, 급여, 입사일
        을 조회하세요.
*/
SELECT ENAME 사원이름, JOB 직급, SAL 급여, HIREDATE 입사일 
FROM EMP
WHERE SAL> ANY (SELECT AVG(SAL)
                FROM EMP
                GROUP BY JOB);

/*
    문제 12 ]
        모든 년도별 입사자의 평균 급여보다 많이 받는 사원들의
        사원이름, 직급, 급여, 입사년도
        를 조회하세요.
*/


SELECT ENAME 사원이름, JOB 직급, SAL 급여, TO_CHAR(HIREDATE,'YY')||'년' 입사년도
FROM EMP
WHERE SAL>ALL (SELECT AVG(SAL)
                FROM EMP
                GROUP BY TO_CHAR(HIREDATE,'YY'));



--년도별 입사자의 평균급여
SELECT AVG(SAL)
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YY');





/*
    문제 13 ]
        최고급여자의 이름 글자수와 같은 글자수의 직원이 존재하면
        모든 사원의 사원이름, 이름글자수, 직급, 급여 를 조회하고
        존재하지 않으면 출력하지마세요.
*/

--최고급여자와 같은 글자수의 직원
SELECT ENAME 사원이름, LENGTH(ENAME) 이름글자수, JOB 직급, SAL 급여
FROM EMP
WHERE LENGTH(ENAME)=LENGTH('최고급여자');



