--기타함수로 처리
/*
    문제1 ] 각 직급별로 한글직급으로 사원들의 사원이름, 직급, 한글직급을 조회하세요
    MANAGER : 관리자 ,  SALESMAN : 영업사원, CLERK: 점원, PRESIDENT : 사장
*/
SELECT ENAME 사원이름, JOB 직급, DECODE(JOB, 'CLERK','점원','SALESMAN','영업사원','PRESIDENT','사장','MANAGER','관리자','연구원') 한글직급
FROM EMP;



/*
문제2 ] 각 부서별로 이번달 보너스를 다르게 지급하려고 한다. 
        10번 부서는 급여의 10%, 
        20번 부서는 급여의 15%, 
        30번 부서는 급여의 20%를 지급하기로 했다
        그리고 거긱에 각각의 커미션을 더해서 급여로 지급하기로 했다. 
        커미션이 없는 사원은 커미션을 0으로 해서 계산해서 사원들의 사원이름, 부서번호, 급여, 지급급여를 조회하세요
*/

SELECT DEPTNO 부서번호,ENAME 사원이름,SAL 급여,SAL+DECODE(DEPTNO,'10',SAL*1.1,'20',SAL*1.15,SAL*1.2)+NVL(COMM,0) 지급급여
FROM EMP;


/*
    문제 3 ]
        입사년도를 기준으로 해서
            80년 'A등급'
            81년 'B등급'
            82년 'C등급'
            그 이외의 해에 입사한 사원은 'D등급'
            으로 조회되도록 
            사원들의
                사원이름, 직급, 입사일, 등급
            을 조회하세요.
*/

SELECT ENAME 사원이름, JOB 직급,HIREDATE 입사일, 
        DECODE(TO_CHAR(HIREDATE,'YY'),'80','A등급','81','B등급','82','C등급','D등급') 등급
FROM EMP;


/*
    문제 4 ]
        사원이름의 글자수가 4글자면 'Mr.'을 이름앞에 붙이고
        4글자가 아니면 뒤에 ' 님'으로 조회되도록
        사원들의
            사원이름, 이름글자수, 조회이름
        을 조회하세요.
*/

SELECT ENAME 사원이름, LENGTH(ENAME)글자수, CASE WHEN LENGTH(ENAME)=4 THEN CONCAT('Mr.',ENAME) ELSE CONCAT(ENAME,'님') END "조회이름"
FROM EMP;

/*
    문제 5 ]
        부서번호가 10 또는 20번이면   급여 + 커미션으로 지급하고
        그 이외의 부서는 급여만 지급하려고 한다.
        사원들의
            사원이름, 직급, 부서번호, 급여, 커미션, 지급급여
        를 조회하세요.
        단, 커미션이 없는 경우는 0으로 대신해서 계산하는 것으로 한다.
*/

SELECT ENAME 사원이름, JOB 직급, DEPTNO 부서번호,CASE WHEN DEPTNO IN(10,20) THEN SAL+NVL2(COMM,COMM+SAL,SAL) ELSE SAL END"지급급여" 
FROM EMP;



/*
    문제 6 ]
        입사요일이 토요일, 일요일 인 사원은
            급여를 20% 더해서 지급하고
        그 이외의 요일에 입사한 사원은
            급여의 10%를 더해서 지급하려고 한다.
            
        사원들의
            사원이름, 급여, 입사일, 입사요일, 지급급여
        를 조회하세요.
*/

SELECT ENAME 사원이름, SAL 급여, HIREDATE 입사일, TO_CHAR(HIREDATE,'day') 입사요일,CASE WHEN TO_CHAR(HIREDATE,'day') IN('토요일','일요일') THEN SAL*1.2 ELSE SAL*1.1 END "지급급여"
FROM EMP;

/*
    문제 7 ]
        근무개월수가 490개월 이상인 사원은
            커미션을 500 을 추가해서 지급하고
        근무개월수가 490개월 미만인 사원은
            커미션을 현재커미션만 지급하도록 할 예정이다.
        사원들의
            사원이름, 커미션, 입사일, 근무개월수, 지급커미션
        을 조회하세요.
        단, 커미션이 없는 사원은 0으로 계산하는 것으로 한다.
*/

SELECT ENAME 사원이름, HIREDATE 입사일,FLOOR(MONTHS_BETWEEN(SYSDATE,HIREDATE)) 근무개월수,COMM 기존커미션,
    CASE WHEN FLOOR(MONTHS_BETWEEN(SYSDATE,HIREDATE))>=490 THEN NVL2(COMM,COMM+500,500) ELSE NVL2(COMM,COMM,0) END "지급커미션"
FROM EMP;
/*
    문제 8 ]
        이름 글자수가 5글자 이상인 사원은 이름을
            3글자*** 로 표현하고(이름길이에 맞춰 * 로 표시...)
        이름 글자수가 4글자 이하인 사원은 그대로 출력할 예정이다.
        사원들의
            사원이름, 이름글자수, 조회이름
        을 조회하세요.
*/

SELECT ENAME 사원이름, LENGTH(ENAME) 이름글자수, CASE WHEN LENGTH(ENAME)>=5 THEN RPAD(SUBSTR(ENAME,0,3),LENGTH(ENAME),'*') ELSE ENAME END "조회이름"
FROM EMP;
--------------------------------------------------------------------------------
-- group by

/*
    문제 1 ]
        각 부서별로 최소 급여를 조회하려고 한다.
        각부서별
            부서번호, 최소급여
        를 조회하세요.
*/

SELECT  DEPTNO 부서번호,MIN(SAL) 최소급여 
FROM EMP
GROUP BY DEPTNO;
/*
    문제 2 ]
        각 직급별로 급여의 총액과 평균급여를 직급과 함께 조회하세요.
*/

SELECT JOB 직급 ,SUM(SAL) 급여총액, FLOOR(AVG(SAL)) 평균급여
FROM EMP
GROUP BY JOB;


/*
    문제 3 ]
        입사 년도별로 평균 급여와 총급여를 조회하세요.
*/
SELECT TO_CHAR(HIREDATE,'YYYY')입사년도,AVG(SAL) 평균급여, SUM(SAL) 총급여
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY');

/*
    문제 4 ]
        각 년도마다 입사한 사원수를 조회하세요.
*/
SELECT TO_CHAR(HIREDATE,'YYYY')||'년도' 입사년도, COUNT(HIREDATE)||'명' "입사한 사원"
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY');



/*
    문제 5 ]
        사원 이름의 글자수를 기준으로 그룹화해서 조회하려고 한다.
        사원 이름의 글자수가 4, 5 글자인 사원의 수를 조회하세요.
*/
SELECT CONCAT(LENGTH(ENAME),'글자') 글자수,COUNT(ENAME) 사원수
FROM EMP
GROUP BY LENGTH(ENAME)
HAVING LENGTH(ENAME) BETWEEN 4 AND 5;

/*
    문제 6 ]
        81년도에 입사한 사원의 수를 직급별로 조회하세요.
*/

SELECT JOB 직급,COUNT(HIREDATE) 인원
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YY'),JOB
HAVING TO_CHAR(HIREDATE,'YY')=81
ORDER BY JOB;



/*
    문제 7 ]
        사원이름의 글자수가 4, 5글자인 사원의 수를 부서별로 조회하세요.
        단, 사원수가 한사람 이하인 부서는 조회에서 제외하세요.
*/

SELECT DEPTNO 부서,LENGTH(ENAME)||'글자' 글자수,COUNT(DEPTNO) "사원수"
FROM EMP
GROUP BY DEPTNO,LENGTH(ENAME)
HAVING (LENGTH(ENAME) = 4 OR LENGTH(ENAME) =5) AND COUNT(DEPTNO)>1
ORDER BY DEPTNO;

/*
    문제 8 ]
        81년도 입사한 사원의 전체 급여를 직급별로 조회하세요.
        단, 직급별 평균 급여가 1000 미만인 직급은 조회에서 제외하세요.
*/

SELECT TO_CHAR(HIREDATE,'YY')||'년' 입사년도,JOB 직급, COUNT(JOB) 수, FLOOR(AVG(SAL)) "평균 급여"
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YY'),JOB
HAVING  TO_CHAR(HIREDATE,'YY')= '81' AND AVG(SAL)>1000;





/*
    문제 9 ]
        81년도 입사한 사원의 총 급여를 사원이름글자수 별로 그룹화하세요.
        단, 총 급여가 2000 미만인 경우는 조회에서 제외하고
        총 급여가 높은 순서에서 낮은 순서대로 조회되게 하세요.
*/
SELECT ENAME 이름, SUM(SAL) 총급여,TO_CHAR(HIREDATE,'YY')||'년도'입사년도
FROM EMP
GROUP BY ENAME,TO_CHAR(HIREDATE,'YY')
HAVING SUM(SAL)>2000 AND TO_CHAR(HIREDATE,'YY')='81'
ORDER BY SUM(SAL) DESC;



/*
    문제 10 ]
        사원 이름 길이가 4, 5 글자인 사원의 부서별 사원수를 조회하세요.
        단, 사원수가 0인 경우는 조회에서 제외하고
        부서번호 순서대로 조회하세요.
*/

SELECT DEPTNO 부서,COUNT(DEPTNO) "부서원 수" 
FROM EMP
GROUP BY LENGTH(ENAME),DEPTNO
HAVING LENGTH(ENAME) BETWEEN 4 AND 5 AND COUNT(*)>0
ORDER BY DEPTNO ASC;
