-- 금요일 배운 내용 복습문제

/*
    문제 1 ]
        사원의 이름, 직급, 입사일, 급여를 조회하세요.
        단, 급여가 높은 사람부터 먼저 출력되도록 하세요.
*/
select ename 사원이름, job  직급, hiredate 입사일, sal 급여
from emp
order by sal desc;

/*
    문제 2 ]
        사원들의 
            사원이름, 직급, 입사일, 부서번호를 조회하세요.
        단, 부서번호 순서대로 출력하고 
        같은 부서이면 입사일 순서대로 출력되도록 하세요.
*/
select ename 사원이름, job  직급, hiredate 입사일, empno 부서번호
from emp
order by empno asc,hiredate asc;



/*
    문제 3 ]
        입사월이 5월인 사원의 
            사원이름, 직급, 입사일을 조회하세요.
            단, 입사일이 빠른 사람이 먼저 조회되도록 하세요.
*/
select ename 사원이름, job  직급, hiredate 입사일, sal 급여
from emp
where hiredate like '%/05/%'
order by hiredate asc;
/*
    문제 4 ] 연산자 사용해서 해결하세요.
        이름의 마지막 글자가 S인 사람의 
            사원이름, 직급, 입사일을 조회하세요.
        단, 직급 순서대로 조회하고 
        같은 직급이면 입사일 순서대로 출력되도록 하세요.
*/
select ename 사원이름, job  직급, hiredate 입사일, sal 급여
from emp
where ename like '%S'
order by job desc, hiredate asc;

/*
    문제 5 ] NVL() 사용해서 처리
        커미션을 27% 인상하여 조회하세요.
        단, 커미션이 없는 사원은 커미션을 100으로 계산해서
            100에 27% 를 인상하도록 하세요.
        단, 소수이상 2째 자리에서 반올림하여 출력하세요.
        
*/

select comm 기존커미션,round(nvl(comm,100)*1.27,2) "인상된 커미션"
from emp;



/*
    문제 6 ]
        급여의 15%를 인상한 급액과 커미션을 합쳐서 
        사원이름, 직급, 급여를 출력하세요.
        단, 급여는 소수이상 첫째자리에서 버림하여 출력하도록 하세요.
        그리고 커미션이 없는 사람은 0으로 가정하여 계산하도록 하세요.
*/

select ename 사원이름,job 직급,sal 기존급여 ,trunc((sal*1.15),-1)+nvl(comm,0) 급여인상분
from emp;




/*
    문제 7 ]
        급여를 100으로 나누어 떨어지는 사람만 
            사원이름, 직급, 급여를 조회하세요.
*/
select ename 사원이름, job  직급, hiredate 입사일, sal 급여
from emp;