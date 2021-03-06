--day02
/*
    참고 ]
        오라클이 데이터를 보관하는 방법
        테이블(Entity, 개체) 단위로 데이터를 보관한다.
        참고 ] 
            ERD - Entity Relation Diagram
                  테이블 간의 관계를 도식화 한 다이어그램
                  
        참고 ] 
            오라클은 테이블 간 관계를 형성해서 데이터를 저장한다.
            이런 종류의 데이터베이스 관리 시스템을 
            RDBMS - 개체들간 관계를 형성해서 데이터를 관리하는 시스템
                    관계형 데이터베이스 관리시스템
                    
                    
        참고 ] 정형데이터베이스 - 데이터를 추가할 떄 데이터의 형태가 갖춰져야 추가되는 데이터
                    7654    MARTIN    SALESMAN    7698    81/09/28    1250    1400    30
                사원번호    사원이름    직급        NULL    입사일      급여   NULL    NULL      
                분산저장 분산처리가 안된다.    
                
                비정형데이터베이스 - 형태가 갖췆지 않아도 저장할수 있는 데이터(NOSQL, MONGODB)
                                    분산저장 분산처리가 된다(NEWSQL)
                          
                    
            테이블이란 필드와 레코드(ROW, 행)로 구성된 데이터를 보관하는 가장 작은 단위
            
            필드 : 같은 개념의 데이터모임(컬럼, 열, 칸....)
            레코드 : 같은 목적을 가진 데이터모임(행, 로우...)
            
            참고로 
                필드에는 그 항목을 구분하기 위한 이름이 부여되어 있다.
                이것을 우리는 필드이름 이라고 부른다.
                하지만 레코드는 각 행을 구분하는 방법이 존재하지 않는다.
                
        참고 ] 
            우리가 오라클에 접속하게 되면 오라클이 접속자에게 메모리를 할당해주는데 
            이 떄 이 메모리가 할당된 상태를 "세션이 하나 열렸다." 라고 표현한다.
            오라클에서는 접속을 세션으로 표현한다.
            
            참고로 오라클에서는 같은 계정으로 여러 컴퓨터에서 동시에 접속할 수 있다.
            이때 확보된 메모리 공간은 서로 공유가 안된다.
            
            따라서 접속한 사람은 확보한 공간에서만 작업(DML 명령)을 하게 되고
            최종적으로 데이터베이스에 적용시키는 작업은 별도로 명령을 해야한다.
            (TCL 명령)
*/

--내가 접속한 계정안에 테이블 이름들을 조회해보자..
SELECT
    tname
FROM
    tab;
/*
    참고 ] 오라클은 명령과 테이블이름, 필드이름을 구분하는데 대소문자를 구분하지 않는다.
            주의 ] 데이터는 대소문자를 구분해야 한다.
*/

    
--------------------------------------------------------------------------------------
/*
    조회된 데이터중 중복된 데이터를 한번만 조회하도록 하는 방법
    ==> 같은 데이터는 한번만 출력되도록 하는 방법
    주의사항 ] 
        이 명령은 질의명령에서 한번만 사용해야하고 조회된 데이터의 각 행들이 같은 
        경우에만 적용된다.
        ==> 각 필드의 데이터들 마저 동일해야 중복된 데이터로 간주한다.
        
    형식 ] 
        SELECT
            DISTINCT 칼럼이름
        FROM
            테이블이름
            
*/
    
    
-- 사원들의 직급을 조회하세요. 단, 중복된 직급은 한번만 출력되도록 하세요

SELECT
    DISTINCT job, ename
FROM
    emp;


-- 사원들의 직급, 부서번호를 조회하는데 중복된 데이터는 한번만 출력되도록 하세요
SELECT
    DISTINCT job, deptno
FROM
    emp;
   
    
/*
    참고 ] 원칙적으로 데이터를 조회할 때는 조회할 필드의 이름을 정확하게 나열해서
    조회하는 것이 원칙이다. 간혹 모든 정보(모든 필드)를 보고싶은 경우는 필드 이름을 나열하는 대신
    ' * ' 기호를 사용해서 대신하는 경우가 있다.
    하지만 실무에서는 절대로 사용하면 안되는 방법이다.
    
    참고 ] 
        * : 자바에서와 마찬가지로 모두의 의미
    


----------------------------------------------------------------------------------
    질의 명령 안에 연산식을 포함할 수 있다. 연산식이 포함되면 연산된 결과가 출력된다. 
    이때 출력되는 필드의 이름은 연산식이 된다.
*/

-- 사원들의 이름,급여, 10% 인상된 급여를 조회하세요
SELECT  
    ename as 사원이름, sal as 원급여, sal*1.1"인상된 급여" --공백이 포함된 별칭은 큰따옴표로 감쌈
FROM
    emp;

/*
    참고 ] DUAL 테이블 : 우리가 조회하게 되면 테이블에 저장된 데이터 중에서 필터링이 돼서
                        그 결과를 가지고 구해준다.
                        그런데 데이터 자체를 조회하게 되면 (SELECT 절에 데이터를 나열하면....)
                        조회되는 데이터는 아마도 필터링된 데이터 갯수만큼 출력될 것이다.
                        이 때 계산식의 결과만 원하는 경우는 이렇게 조회하면 불편할 것이다.
                        
                        따라서 이런 경우 사용할 수 있도록 만들어서 제공하는 테이블이 있는데
                        그 테이블이 dual 테이블이다.
                        
                        하지만 이 테이블은 물리적으로 저장되어 있는 테이블은 아니다.
                        오라클 시스템 자체가 제공해주는 가상의 테이블이다.
                        이 테이블은 한개의 row만 가지고 있는 테이블이다.
                        
*/

SELECT
    '제니'
FROM
    emp; -- 이 질의명령은 각 데이터에서 '제니'를 조회해달라는 명령과 같은 의미가 된다.
    
SELECT
    '제니'

FROM
    dual
;

--현재시간을 조회해보세요
SELECT SYSDATE FROM DUAL;
/*
    참고 ] 현 시스템의 현재 시간을 반환해주는 연산자
           sysdate
    참고 ] 오라클에서는 자바와 마찬가지로 날짜와 시간을 분리해서 기억하지 않는다.
           
*/

/*
    오라클에서 사용하는 산술 연산자
    +,-,*,/
*/

SELECT  10/3 FROM dual; --오라클에서는 정수의 연산결과가 실수가 될 수 있다.

-----------------------------------------------------------------------------------
/*
    NULL 데이터 : 필드안에는 데이터가 보관되어야 하는데 없는 정보는 데이터가 없을 수 있다.
                  이처럼 필드의 데이터가 없는 상태를 NULL 데이터라고 한다.
    ★주의 ] NULL 데이터는 모든 연산에서 제외된다.
           ==> NULL 데이터로 연산하는 데이터는 조회에서 제외가 된다.
    참고 ] NVL 함수 
          형식 : NVL(필드이름 또는 필드계산식, 필드의 데이터가 null인 경우,대신할데이터)
          의미 : NULL데이터를 강제로 특정 데이터로 바꿔주는 명령
                따라서 특정 데이터로 변경하게 되면 연산에 포함될 수 있다.
           
*/


--  사원들의 상사번호에 10000을 추가해서 사원이름, 상사번호를 조회하세요
SELECT  
    ename, mgr+10000 상사번호
FROM    EMP;

-- 사원들의 연봉을 계산해수 사원이름, 입사일, 연봉을 조회하세요. 연봉은 급여 * 12 + 커미션, 
-- 커미션이 없는 사원은 0으로 계산하세요
SELECT ENAME 사원이름, hiredate 입사일,(SAL*12+COMM) 연봉
FROM EMP;

-- NULL 함수 사용
SELECT
    ename,hiredate,(sal*12+NVL(comm, 0)) 연봉
FROM
    emp;

-- NULL 함수 사용
SELECT
    ename,hiredate,NVL(sal*12+comm, sal*12) 연봉
FROM
    emp;

----------------------------------------------------------------------------------
/*
    결합연산자 : 오라클 역시 문자열을 결합하여 출력할 수 있다. 
                이때는 두개의 필드를 결합할 수도 있고 데이터를 결합할 수도 있다. 
                결합된 결과는 문자열로 만들어진다.
*/

SELECT 10||20 FROM DUAL;


--사원번호와 사원이름을 조회하는데 형식은 사원번호- 사원이름의 형식으로 조회하세요

SELECT
    empno || '-' || ename 사원    
FROM    EMP;

--사원번호, 사원이름을 조회하는데 
--  0000번, 홍길동 님 의 형식으로 조회하세요
SELECT
    empno ||'번,' 사원번호,ename||' 님' 사원이름 from emp;
    
    
 ---------------------------------------------------------------------------------
 /*
     조건조회 
     형식 ] SELECT 필드이름들.. FROM 테이블이름 WHERE 조건식
     참고 ] NULL 검색==>NULL 데이터는 모든 연산에서 제외된다.
            따라서 비교연산자로 null 데이터로 비교할 수 없다.
 */

--커미션이 없는 사원들의 이름, 급여 커미션을 조회하세요

SELECT  ename, sal,comm
from emp
where comm=null;-- null 데이터를 연산에서 제외시키기 때문
    
/*
    따라서 null 데이터의 배교는 is null, is not null을 사용해서 비교해야 한다.
*/
    
select
ename,sal,comm
from
emp
where
comm is null;

--커미션이 있는 사원들의 사원번호, 사원이름, 급여, 커미션을 조회하세요
-- 단, 커미션은 100을 추가해서 조회하세요
select
empno 사원번호, ename 사원이름, sal 급여,comm 커미션_원본,comm+100 커미션
from
emp
where
comm is not null;   --NOT comm IS NULL도 같은 의미
------------------------------------------------------------------------------------------
/*
    조회된 결과 정렬하기
    ==> 원칙적으로 데이터베이스는 종류에 따라 나름의 기준을 가지고 데이터를 조회한다.
        (반드시 입력 순서대로 조회되는 것은 아니다.)
        오라클은 내부적으로 인덱스를 이용해서 출력순서를 조절하고 있다.
        ==> 출력순서는 모를 수 있다.
        
    조회된 결과를 원하는 순서대로 정렬하도록 지정해야 한다.
    형식] select 필드이름, 필드이름....
          from 테이블이름 
          where 조건식 
          order by 필드이름[ASC||DESC],필드이름[ASC||DESC].....;
    참고 ] ASC : 오름차순 정렬 , DESC : 내림차순 정렬
          
*/
desc emp; -- 테이블의 정보를 보여주는 명령
describe emp;

-- 사원의 이름, 직급, 입사일을 조회하세요. 단, 이름 순으로 내림차순 정렬해서 조회하세요.
select ename, job,hiredate from emp
order by
    ename DESC;
    
-- 위 문제를 입사일 기준 오름차순 정렬해서 조회하세요    
SELECT
    ename 사원이름,job 사원직급, hiredate 입사일 ,sal 급여 FROM emp
ORDER BY
    hiredate ;    

/* 
    참고 ]  정렬할 떄 오름차순 정렬의 경우에는 ASC를 생략해도 된다.(정렬 기본은 오름차순이기 떄문)
*/

-- 사원들의 사원이름, 급여, 부서번호를 조회하는데
-- 부서번호 기준 오름차순 정렬되게 하고 같은 부서의 경우에는 급여가 많은 사람이 먼저 출력되게 하세요.
select
ename 사원이름, deptno 부서번호, sal 급여 from emp
order by 부서번호, 급여 DESC;


/*
    ★ 정렬은 위 절들의 실행결과를 가지고 정렬을 하게 된다.
     따라서 ORDER BY 절은 다른 절들의 이후에 기술되어야 한다.
     
     참고 ] 필드를 이용한 연산결과도 정렬에 사용할 수 있다.
     LENGTH() - 문자열의 길이를 알려주는 함수
*/

--사원이름, 직급, 급여를 조회하세요
-- 단, 이름길이가 짧은 사람이 먼저 출력되게하고, 같은 길이면 오름차순 정렬하세요

SELECT  ename 이름 , job 직급, sal 급여
FROM
    emp
ORDER BY
    LENGTH(ename) ASC, ename;
    
select LENGTH('윤아') 문자수, LENGTHB('윤아')바이트수 from dual;

/*
    집합연산자 :  두 개 이상의 select 질의 명령을 이용해서 그 결과의 집합을 얻어내는 방법
        형식 ] SELECT....
                집합연산자
               SELECT.....
               
        종류 ] UNION : 합집합의 개념, 두 가지 질의 명령의 결과를 하나로 합쳐서 조회한다.
               UNION ALL : 합집합의 개념 + 단, UNION과 다른 점은 UNION의 경우는 중복데이터를 한번만 출력해주는데
                           UNION ALL의 경우는 중복데이터를 모두 출력해준다.
               INTERSECT : 교집합의 개념. 조회 질의명령의 결과 중 양쪽 모두 존재하는 결과만 출력하는 것
               MINUS : 차집합의 개념. 앞의 질의명령의 결과에서 뒤의 질의명령의 결과에 포함된 데이터를 뺀 결과를 출력해준다.
               
   참고 ] 공통적인 특징 1. 두개의 질의 명령에서 나온 결과는 같은 필드의 갯수를 가져야 한다.
                       2. 두 질의 명령의 결과는 같은 형태의 필드이면 된다.(타입만 같으면 된다) 
*/

SELECT
    ename 사원이름, sal 급여
FROM
    emp
UNION
SELECT job 직급, deptno 부서번호
FROM
    emp;

/*
오라클 함수 종류 ] 
    1. 단일행 함수 : 한줄한줄마다 매버 명령이 실행되는 함수. 따라서 단일행 함수의 결과는 출력되는 데이터의 갯수 
    2. 그룹함수 : 여러행이 모여서 한번만 실행되는 함수 따라서 그룹 함수는 출력갯수가 오직 한개이다.
                  집계함수들이 그룹함수에 해당한다. 
                  max(), min(), sum() : 합계, avg() : 평균, count() : 갯수
    ★ 주의사항 : 단일행 함수,일반필드와 그룹함수는 절대로 같이 사용할 수 없다.             
*/

--10번 부서의 사원들의 사원수를 조회하세요.

select
    count(*) 사원수
from emp
where
deptno=10;


--커미션이 없는 사원들의 수를 조회하세요
select
    count(*) "커미션 없는 사원수"
from emp
where
    comm is null;

--null 데이터는 모든 연산에서 제외된다.
-- 따라서 함수에서도 제외가 된다.
select count(*)-count(comm) "커미션 없는 사원 수"
from emp;

--------------------------------------------------------------------------------
/*
    단일행 함수
    
    *** 숫자 <--------------->  문자 <---------------> 날짜
    1. 숫자함수
        ==> 데이터가 숫자인 경우에만 사용할 수 있는 함수
        1) ABS() : 절대값을 구해주는 함수
            형식 ] ABS(데이터 또는 필드 또는 연산식)
        2) ROUND() : 반올림해주는 함수
            형식 ] ROUND(데이터[,자릿수])
        3) FLOOR() : 버림함수, 소수점 이하를 무조건 버린다.
            형식 ] FLOOR(데이터 또는 필드 또는 연산식)
        4) TRUNC() : 자릿수 이하 버림함수, 자릿수를 지정해서 버릴수 있다.
            형식 ] TRUNC(데이터, (자릿수))
                   자릿수는 소수이하 자릿수를 의미하고 만약 음수형태로 입력하면 
                   소수이상 자릿수를 의미한다.
        5) MOD()   : 나머지 구하는 함수
            형식 ] MOD(데이터, 나눌 수)
    2. 문자함수
        
    3. 날짜함수
    
    참고 ] 
        CLOB - 문자데이터를 4기가까지 저장할 수 있는 타입
        BLOB - 바이너리코드를 4기가까지 저장할 수 있는 타입
        참고 ] 문자열 데이터의 데이터 타입의 최대 크기는 4KB 이다.
*/

SELECT ABS(-3.14) PI FROM DUAL;

SELECT ROUND(4.13,1)PI FROM DUAL;

--사원들의 급여를 15% 인상한 금액을 조회해보자.
-- 단 소수 첫째자리에서 반올림해서 조회하세요

SELECT ENAME 이름,SAL 원급여,SAL*1.15 계산값,ROUND(SAL*1.15,-2) 인상급여,FLOOR(SAL*1.15) 버림함수,TRUNC(SAL*1.15,-2)자릿수버림 FROM EMP;

SELECT MOD(10,3) "10을 3으로 나눈 나머지" FROM DUAL;
SELECT MOD(10,3) "10나누기3은"FROM DUAL;


--급여가 짝수인 사원을 출력하세요
SELECT ENAME,JOB,SAL
FROM   EMP
WHERE   MOD(SAL,2) = 0;



---------------------------------------------------------------------------------
/*
    2. 문자처리 함수
        1. LOWER() : 소문자로 변환
        2. UPPER() : 대문자로 변환
        3. INITCAP() : 단어의 첫문자만 대문자로 나머지는 소문자로 변환해주는 함수
        4. LENGTH / LENGTHB() : 
            형식 ] LENGTH(문자열데이터) : 문자열의 문자수를 반환
                   LENGTHB(문자열데이터) : 문자열의 바이트수를 반환
        5. CONCAT() : ||(결합연산자)와 같은 기능
            형식 ] CONCAT(데이터1,데이터2)
        6. SUBSTR() / SUBSTRB() : 문자열 중에서 특정 위치의 문자열만 따로 추출해서 반환해주는 함수
                    형식 ) SUBSTR(데이터, 시작위치, 꺼낼갯수)
                    주의 ) 위치값은 데이터베이스에서는 1부터 시작한다. 
                    참고 ] 갯수는 생략할 수 있다. 이때 꺼내오는 문자열은 문자열의 끝부분까지 꺼내오게 된다.
                    참고 ] 시작위치를 음수로 기입하는 경우는 문자열의 뒤에서부터의 자릿수를 의미하게 된다.
                    
        7. INSTR() / INSTRB() : 문자열 중에서 원하는 문자열이 몇번째 글자에 있는지를 알아내주는 함수
                                형식 ] INSTR(데이터1, 데이터2(, 시작위치, 출현 횟수))
        8. LPAD() / RPAD() : 문자열의 길이를 지정한 후 문자열을 만드는데 남는 공간은 지정한 문자로 채워서 문자열을 만들어주는 함수
        5자리문자를 10자리 문자로 만들고 싶을때.. 왼쪽으로 할지 오른쪽으로 할지 결정...
        차이점 : 남는 공간을 채우는데 왼쪽에 채울건지 오른쪽에 채울건지 결정
        형식 ] LPAD(데이터, 만들길이, 채울문자)
*/

SELECT LOWER(ENAME) 소문자이름, UPPER(ENAME) 대문자이름,INITCAP(ENAME) "첫글자만 대문자"
FROM EMP;


SELECT INITCAP('hello jennie!') from dual;


--사원들의 이름, 직급, 급여를 조회하는데 출력형식은 Mr.SMITH, CLEARK 직급 800 달러
SELECT CONCAT('Mr.',ENAME) 사원이름, CONCAT(JOB,' 직급') 직급, CONCAT(SAL,' 달러') 급여
FROM EMP;



SELECT SUBSTR('HELLO WORLD',1,6) 문자열추출
FROM DUAL;

SELECT SUBSTR('HELLO WORLD',-6,6) 문자열추출
FROM DUAL;

SELECT INSTR('HELLO HONGGILGDONG HI','H',2,2) FROM DUAL;

--사원이름을 조회하는데 이름을 10글자로 만들어서 표현하세요.(단, 남는 부분은 *로  채우세요)
SELECT LPAD(ENAME,10,'*') "오른쪽 정렬",  RPAD(ENAME,10,'*')"왼쪽 정렬"
FROM EMP;
--LPAD *를 왼쪽으로 채움,  RPAD *을 오른쪽으로 채움



----------------------------------------------------------------------------------------
-- 사원들의 이름을 앞 두글자만 표시하고 나머지는 *로 표시하세요
SELECT
    RPAD(SUBSTR(ENAME,1,2) ,LENGTH(ENAME),'*') 꺼내온이름, ENAME 원이름
FROM   EMP;


SELECT
    RPAD(SUBSTR(ENAME,1,2), LENGTH(ENAME),'*') 꺼내온이름, ENAME 원이름
FROM EMP;



--문제 1) 사원이름이 5글자 이하인 사원들의 사원번호, 사원이름, 글자수, 직급, 급여를 조회하세요.
        --출력은 글자수가 작은 사원의 이름순으로 정렬해서 조회하세요. 
select empno 사원번호,ename 사원이름,length(ename)글자수, job 직급,sal 급여
from emp
where
    length(ename)<=5
order by length(ename);


-- 문제2) 사원이름 뒤에 '사원'을 붙여서 사원이름, 사원직급, 입사일을 조회하세요
select  concat(ename,' 사원') 사원이름, job 사원직급, hiredate 입사일
from emp;

--문제3) 사원이름의 마지막글자가 'N'인 사원들의 사원이름, 입사일, 부서번호를 조회하세요
--  (정렬은 부서번호 순으로 하고 같은 부서의 경우, 이름순으로 정렬해서 조회하세요)

select ename 사원이름 , hirdate 입사일, empno 부서번호
from emp;

SELECT  ENAME 사원이름, HIREDATE 입사일, EMPNO 부서번호
FROM EMP
WHERE SUBSTR(ENAME,LENGTH(ENAME))='N';

--문제4 ) 사원이름 중 'a'가 존재하지 않는 사원의 정보를 조회하세요
select ename 사원이름, hiredate 입사일, empno 부서번호
from emp
where instr(ename,'A') =0;
    


--문제 5) 사원이름 중에서 뒤 2글자만 남기고 앞 글자는 모두 '#'으로 대체해서 사원이름, 입사일, 급여를 조회하세요
select lpad(substr(ename,-2),length(ename),'#') 사원이름, hiredate 입사일, sal 급여
from emp;

--문제 6) 'jennie@githrd.com' 이라는 메일에서 아이디부분은 세번째 문자만 표시하고 나머지 문자는 '*'로 대체하고 @는 표시하고
            --.com도 표시하고 나머지는 *로 대체해서 조회되는 질의명령을 작성하세요.

--아이디 :

--jennie@githrd.com 중 @까지는 자르기
select substr('jennie@githrd.com',0,instr('jennie@githrd.com','@')-1)
from dual;

--골뱅이 짜르기
select substr('jennie@githrd.com',instr('jennie@githrd.com','@'),1)
from dual;
--@~com 전까지 짜르기
--githrd 추출

--select rpad('jennie@githrd.com',substr('jennie@githrd.com,instr('jennie@githrd.com','@'),1))
--from dual;

select substr('jennie@githrd.com',instr('jennie@githrd.com','.'))
from dual;


select length(substr('jennie@githrd.com',instr('jennie@githrd.com','@')+1,instr('jennie@githrd.com','.')))-length(substr('jennie@githrd.com',instr('jennie@githrd.com','.')))
from dual;

-@ 추출

select substr('jennie@githrd.com',instr('jennie@githrd.com','@'),1)
from dual;
select rpad(substr('jennie@githrd.com',instr('jennie@githrd.com','@'),1),length(substr('jennie@githrd.com',instr('jennie@githrd.com','@'),instr('jennie@githrd.com','.')))-length(substr('jennie@githrd.com',instr('jennie@githrd.com','.'))),'*')
from dual;


select concat(concat(rpad(substr('jennie@githrd.com',0,3), length(substr('jennie@githrd.com',0,instr('jennie@githrd.com','@')-1)),'*'),rpad(substr('jennie@githrd.com',instr('jennie@githrd.com','@'),1),length(substr('jennie@githrd.com',
instr('jennie@githrd.com','@'),instr('jennie@githrd.com','.')))-length(substr('jennie@githrd.com',instr('jennie@githrd.com','.'))),'*')),substr('jennnie@githrd.com',instr('jennie@githrd.com','c')))
from dual;



