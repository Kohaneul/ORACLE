--day02
/*
    Âü°í ]
        ¿À¶óÅ¬ÀÌ µ¥ÀÌÅÍ¸¦ º¸°üÇÏ´Â ¹æ¹ý
        Å×ÀÌºí(Entity, °³Ã¼) ´ÜÀ§·Î µ¥ÀÌÅÍ¸¦ º¸°üÇÑ´Ù.
        Âü°í ] 
            ERD - Entity Relation Diagram
                  Å×ÀÌºí °£ÀÇ °ü°è¸¦ µµ½ÄÈ­ ÇÑ ´ÙÀÌ¾î±×·¥
                  
        Âü°í ] 
            ¿À¶óÅ¬Àº Å×ÀÌºí °£ °ü°è¸¦ Çü¼ºÇØ¼­ µ¥ÀÌÅÍ¸¦ ÀúÀåÇÑ´Ù.
            ÀÌ·± Á¾·ùÀÇ µ¥ÀÌÅÍº£ÀÌ½º °ü¸® ½Ã½ºÅÛÀ» 
            RDBMS - °³Ã¼µé°£ °ü°è¸¦ Çü¼ºÇØ¼­ µ¥ÀÌÅÍ¸¦ °ü¸®ÇÏ´Â ½Ã½ºÅÛ
                    °ü°èÇü µ¥ÀÌÅÍº£ÀÌ½º °ü¸®½Ã½ºÅÛ
                    
                    
        Âü°í ] Á¤Çüµ¥ÀÌÅÍº£ÀÌ½º - µ¥ÀÌÅÍ¸¦ Ãß°¡ÇÒ ‹š µ¥ÀÌÅÍÀÇ ÇüÅÂ°¡ °®ÃçÁ®¾ß Ãß°¡µÇ´Â µ¥ÀÌÅÍ
                    7654    MARTIN    SALESMAN    7698    81/09/28    1250    1400    30
                »ç¿ø¹øÈ£    »ç¿øÀÌ¸§    Á÷±Þ        NULL    ÀÔ»çÀÏ      ±Þ¿©   NULL    NULL      
                ºÐ»êÀúÀå ºÐ»êÃ³¸®°¡ ¾ÈµÈ´Ù.    
                
                ºñÁ¤Çüµ¥ÀÌÅÍº£ÀÌ½º - ÇüÅÂ°¡ °®®AÁö ¾Ê¾Æµµ ÀúÀåÇÒ¼ö ÀÖ´Â µ¥ÀÌÅÍ(NOSQL, MONGODB)
                                    ºÐ»êÀúÀå ºÐ»êÃ³¸®°¡ µÈ´Ù(NEWSQL)
                          
                    
            Å×ÀÌºíÀÌ¶õ ÇÊµå¿Í ·¹ÄÚµå(ROW, Çà)·Î ±¸¼ºµÈ µ¥ÀÌÅÍ¸¦ º¸°üÇÏ´Â °¡Àå ÀÛÀº ´ÜÀ§
            
            ÇÊµå : °°Àº °³³äÀÇ µ¥ÀÌÅÍ¸ðÀÓ(ÄÃ·³, ¿­, Ä­....)
            ·¹ÄÚµå : °°Àº ¸ñÀûÀ» °¡Áø µ¥ÀÌÅÍ¸ðÀÓ(Çà, ·Î¿ì...)
            
            Âü°í·Î 
                ÇÊµå¿¡´Â ±× Ç×¸ñÀ» ±¸ºÐÇÏ±â À§ÇÑ ÀÌ¸§ÀÌ ºÎ¿©µÇ¾î ÀÖ´Ù.
                ÀÌ°ÍÀ» ¿ì¸®´Â ÇÊµåÀÌ¸§ ÀÌ¶ó°í ºÎ¸¥´Ù.
                ÇÏÁö¸¸ ·¹ÄÚµå´Â °¢ ÇàÀ» ±¸ºÐÇÏ´Â ¹æ¹ýÀÌ Á¸ÀçÇÏÁö ¾Ê´Â´Ù.
                
        Âü°í ] 
            ¿ì¸®°¡ ¿À¶óÅ¬¿¡ Á¢¼ÓÇÏ°Ô µÇ¸é ¿À¶óÅ¬ÀÌ Á¢¼ÓÀÚ¿¡°Ô ¸Þ¸ð¸®¸¦ ÇÒ´çÇØÁÖ´Âµ¥ 
            ÀÌ ‹š ÀÌ ¸Þ¸ð¸®°¡ ÇÒ´çµÈ »óÅÂ¸¦ "¼¼¼ÇÀÌ ÇÏ³ª ¿­·È´Ù." ¶ó°í Ç¥ÇöÇÑ´Ù.
            ¿À¶óÅ¬¿¡¼­´Â Á¢¼ÓÀ» ¼¼¼ÇÀ¸·Î Ç¥ÇöÇÑ´Ù.
            
            Âü°í·Î ¿À¶óÅ¬¿¡¼­´Â °°Àº °èÁ¤À¸·Î ¿©·¯ ÄÄÇ»ÅÍ¿¡¼­ µ¿½Ã¿¡ Á¢¼ÓÇÒ ¼ö ÀÖ´Ù.
            ÀÌ¶§ È®º¸µÈ ¸Þ¸ð¸® °ø°£Àº ¼­·Î °øÀ¯°¡ ¾ÈµÈ´Ù.
            
            µû¶ó¼­ Á¢¼ÓÇÑ »ç¶÷Àº È®º¸ÇÑ °ø°£¿¡¼­¸¸ ÀÛ¾÷(DML ¸í·É)À» ÇÏ°Ô µÇ°í
            ÃÖÁ¾ÀûÀ¸·Î µ¥ÀÌÅÍº£ÀÌ½º¿¡ Àû¿ë½ÃÅ°´Â ÀÛ¾÷Àº º°µµ·Î ¸í·ÉÀ» ÇØ¾ßÇÑ´Ù.
            (TCL ¸í·É)
*/

--³»°¡ Á¢¼ÓÇÑ °èÁ¤¾È¿¡ Å×ÀÌºí ÀÌ¸§µéÀ» Á¶È¸ÇØº¸ÀÚ..
SELECT
    tname
FROM
    tab;
/*
    Âü°í ] ¿À¶óÅ¬Àº ¸í·É°ú Å×ÀÌºíÀÌ¸§, ÇÊµåÀÌ¸§À» ±¸ºÐÇÏ´Âµ¥ ´ë¼Ò¹®ÀÚ¸¦ ±¸ºÐÇÏÁö ¾Ê´Â´Ù.
            ÁÖÀÇ ] µ¥ÀÌÅÍ´Â ´ë¼Ò¹®ÀÚ¸¦ ±¸ºÐÇØ¾ß ÇÑ´Ù.
*/

    
--------------------------------------------------------------------------------------
/*
    Á¶È¸µÈ µ¥ÀÌÅÍÁß Áßº¹µÈ µ¥ÀÌÅÍ¸¦ ÇÑ¹ø¸¸ Á¶È¸ÇÏµµ·Ï ÇÏ´Â ¹æ¹ý
    ==> °°Àº µ¥ÀÌÅÍ´Â ÇÑ¹ø¸¸ Ãâ·ÂµÇµµ·Ï ÇÏ´Â ¹æ¹ý
    ÁÖÀÇ»çÇ× ] 
        ÀÌ ¸í·ÉÀº ÁúÀÇ¸í·É¿¡¼­ ÇÑ¹ø¸¸ »ç¿ëÇØ¾ßÇÏ°í Á¶È¸µÈ µ¥ÀÌÅÍÀÇ °¢ ÇàµéÀÌ °°Àº 
        °æ¿ì¿¡¸¸ Àû¿ëµÈ´Ù.
        ==> °¢ ÇÊµåÀÇ µ¥ÀÌÅÍµé ¸¶Àú µ¿ÀÏÇØ¾ß Áßº¹µÈ µ¥ÀÌÅÍ·Î °£ÁÖÇÑ´Ù.
        
    Çü½Ä ] 
        SELECT
            DISTINCT Ä®·³ÀÌ¸§
        FROM
            Å×ÀÌºíÀÌ¸§
            
*/
    
    
-- »ç¿øµéÀÇ Á÷±ÞÀ» Á¶È¸ÇÏ¼¼¿ä. ´Ü, Áßº¹µÈ Á÷±ÞÀº ÇÑ¹ø¸¸ Ãâ·ÂµÇµµ·Ï ÇÏ¼¼¿ä

SELECT
    DISTINCT job, ename
FROM
    emp;


-- »ç¿øµéÀÇ Á÷±Þ, ºÎ¼­¹øÈ£¸¦ Á¶È¸ÇÏ´Âµ¥ Áßº¹µÈ µ¥ÀÌÅÍ´Â ÇÑ¹ø¸¸ Ãâ·ÂµÇµµ·Ï ÇÏ¼¼¿ä
SELECT
    DISTINCT job, deptno
FROM
    emp;
   
    
/*
    Âü°í ] ¿øÄ¢ÀûÀ¸·Î µ¥ÀÌÅÍ¸¦ Á¶È¸ÇÒ ¶§´Â Á¶È¸ÇÒ ÇÊµåÀÇ ÀÌ¸§À» Á¤È®ÇÏ°Ô ³ª¿­ÇØ¼­
    Á¶È¸ÇÏ´Â °ÍÀÌ ¿øÄ¢ÀÌ´Ù. °£È¤ ¸ðµç Á¤º¸(¸ðµç ÇÊµå)¸¦ º¸°í½ÍÀº °æ¿ì´Â ÇÊµå ÀÌ¸§À» ³ª¿­ÇÏ´Â ´ë½Å
    ' * ' ±âÈ£¸¦ »ç¿ëÇØ¼­ ´ë½ÅÇÏ´Â °æ¿ì°¡ ÀÖ´Ù.
    ÇÏÁö¸¸ ½Ç¹«¿¡¼­´Â Àý´ë·Î »ç¿ëÇÏ¸é ¾ÈµÇ´Â ¹æ¹ýÀÌ´Ù.
    
    Âü°í ] 
        * : ÀÚ¹Ù¿¡¼­¿Í ¸¶Âù°¡Áö·Î ¸ðµÎÀÇ ÀÇ¹Ì
    


----------------------------------------------------------------------------------
    ÁúÀÇ ¸í·É ¾È¿¡ ¿¬»ê½ÄÀ» Æ÷ÇÔÇÒ ¼ö ÀÖ´Ù. ¿¬»ê½ÄÀÌ Æ÷ÇÔµÇ¸é ¿¬»êµÈ °á°ú°¡ Ãâ·ÂµÈ´Ù. 
    ÀÌ¶§ Ãâ·ÂµÇ´Â ÇÊµåÀÇ ÀÌ¸§Àº ¿¬»ê½ÄÀÌ µÈ´Ù.
*/

-- »ç¿øµéÀÇ ÀÌ¸§,±Þ¿©, 10% ÀÎ»óµÈ ±Þ¿©¸¦ Á¶È¸ÇÏ¼¼¿ä
SELECT  
    ename as »ç¿øÀÌ¸§, sal as ¿ø±Þ¿©, sal*1.1"ÀÎ»óµÈ ±Þ¿©" --°ø¹éÀÌ Æ÷ÇÔµÈ º°ÄªÀº Å«µû¿ÈÇ¥·Î °¨½Ó
FROM
    emp;

/*
    Âü°í ] DUAL Å×ÀÌºí : ¿ì¸®°¡ Á¶È¸ÇÏ°Ô µÇ¸é Å×ÀÌºí¿¡ ÀúÀåµÈ µ¥ÀÌÅÍ Áß¿¡¼­ ÇÊÅÍ¸µÀÌ µÅ¼­
                        ±× °á°ú¸¦ °¡Áö°í ±¸ÇØÁØ´Ù.
                        ±×·±µ¥ µ¥ÀÌÅÍ ÀÚÃ¼¸¦ Á¶È¸ÇÏ°Ô µÇ¸é (SELECT Àý¿¡ µ¥ÀÌÅÍ¸¦ ³ª¿­ÇÏ¸é....)
                        Á¶È¸µÇ´Â µ¥ÀÌÅÍ´Â ¾Æ¸¶µµ ÇÊÅÍ¸µµÈ µ¥ÀÌÅÍ °¹¼ö¸¸Å­ Ãâ·ÂµÉ °ÍÀÌ´Ù.
                        ÀÌ ¶§ °è»ê½ÄÀÇ °á°ú¸¸ ¿øÇÏ´Â °æ¿ì´Â ÀÌ·¸°Ô Á¶È¸ÇÏ¸é ºÒÆíÇÒ °ÍÀÌ´Ù.
                        
                        µû¶ó¼­ ÀÌ·± °æ¿ì »ç¿ëÇÒ ¼ö ÀÖµµ·Ï ¸¸µé¾î¼­ Á¦°øÇÏ´Â Å×ÀÌºíÀÌ ÀÖ´Âµ¥
                        ±× Å×ÀÌºíÀÌ dual Å×ÀÌºíÀÌ´Ù.
                        
                        ÇÏÁö¸¸ ÀÌ Å×ÀÌºíÀº ¹°¸®ÀûÀ¸·Î ÀúÀåµÇ¾î ÀÖ´Â Å×ÀÌºíÀº ¾Æ´Ï´Ù.
                        ¿À¶óÅ¬ ½Ã½ºÅÛ ÀÚÃ¼°¡ Á¦°øÇØÁÖ´Â °¡»óÀÇ Å×ÀÌºíÀÌ´Ù.
                        ÀÌ Å×ÀÌºíÀº ÇÑ°³ÀÇ row¸¸ °¡Áö°í ÀÖ´Â Å×ÀÌºíÀÌ´Ù.
                        
*/

SELECT
    'Á¦´Ï'
FROM
    emp; -- ÀÌ ÁúÀÇ¸í·ÉÀº °¢ µ¥ÀÌÅÍ¿¡¼­ 'Á¦´Ï'¸¦ Á¶È¸ÇØ´Þ¶ó´Â ¸í·É°ú °°Àº ÀÇ¹Ì°¡ µÈ´Ù.
    
SELECT
    'Á¦´Ï'

FROM
    dual
;

--ÇöÀç½Ã°£À» Á¶È¸ÇØº¸¼¼¿ä
SELECT SYSDATE FROM DUAL;
/*
    Âü°í ] Çö ½Ã½ºÅÛÀÇ ÇöÀç ½Ã°£À» ¹ÝÈ¯ÇØÁÖ´Â ¿¬»êÀÚ
           sysdate
    Âü°í ] ¿À¶óÅ¬¿¡¼­´Â ÀÚ¹Ù¿Í ¸¶Âù°¡Áö·Î ³¯Â¥¿Í ½Ã°£À» ºÐ¸®ÇØ¼­ ±â¾ïÇÏÁö ¾Ê´Â´Ù.
           
*/

/*
    ¿À¶óÅ¬¿¡¼­ »ç¿ëÇÏ´Â »ê¼ú ¿¬»êÀÚ
    +,-,*,/
*/

SELECT  10/3 FROM dual; --¿À¶óÅ¬¿¡¼­´Â Á¤¼öÀÇ ¿¬»ê°á°ú°¡ ½Ç¼ö°¡ µÉ ¼ö ÀÖ´Ù.

-----------------------------------------------------------------------------------
/*
    NULL µ¥ÀÌÅÍ : ÇÊµå¾È¿¡´Â µ¥ÀÌÅÍ°¡ º¸°üµÇ¾î¾ß ÇÏ´Âµ¥ ¾ø´Â Á¤º¸´Â µ¥ÀÌÅÍ°¡ ¾øÀ» ¼ö ÀÖ´Ù.
                  ÀÌÃ³·³ ÇÊµåÀÇ µ¥ÀÌÅÍ°¡ ¾ø´Â »óÅÂ¸¦ NULL µ¥ÀÌÅÍ¶ó°í ÇÑ´Ù.
    ¡ÚÁÖÀÇ ] NULL µ¥ÀÌÅÍ´Â ¸ðµç ¿¬»ê¿¡¼­ Á¦¿ÜµÈ´Ù.
           ==> NULL µ¥ÀÌÅÍ·Î ¿¬»êÇÏ´Â µ¥ÀÌÅÍ´Â Á¶È¸¿¡¼­ Á¦¿Ü°¡ µÈ´Ù.
    Âü°í ] NVL ÇÔ¼ö 
          Çü½Ä : NVL(ÇÊµåÀÌ¸§ ¶Ç´Â ÇÊµå°è»ê½Ä, ÇÊµåÀÇ µ¥ÀÌÅÍ°¡ nullÀÎ °æ¿ì,´ë½ÅÇÒµ¥ÀÌÅÍ)
          ÀÇ¹Ì : NULLµ¥ÀÌÅÍ¸¦ °­Á¦·Î Æ¯Á¤ µ¥ÀÌÅÍ·Î ¹Ù²ãÁÖ´Â ¸í·É
                µû¶ó¼­ Æ¯Á¤ µ¥ÀÌÅÍ·Î º¯°æÇÏ°Ô µÇ¸é ¿¬»ê¿¡ Æ÷ÇÔµÉ ¼ö ÀÖ´Ù.
           
*/


--  »ç¿øµéÀÇ »ó»ç¹øÈ£¿¡ 10000À» Ãß°¡ÇØ¼­ »ç¿øÀÌ¸§, »ó»ç¹øÈ£¸¦ Á¶È¸ÇÏ¼¼¿ä
SELECT  
    ename, mgr+10000 »ó»ç¹øÈ£
FROM    EMP;

-- »ç¿øµéÀÇ ¿¬ºÀÀ» °è»êÇØ¼ö »ç¿øÀÌ¸§, ÀÔ»çÀÏ, ¿¬ºÀÀ» Á¶È¸ÇÏ¼¼¿ä. ¿¬ºÀÀº ±Þ¿© * 12 + Ä¿¹Ì¼Ç, 
-- Ä¿¹Ì¼ÇÀÌ ¾ø´Â »ç¿øÀº 0À¸·Î °è»êÇÏ¼¼¿ä
SELECT ENAME »ç¿øÀÌ¸§, hiredate ÀÔ»çÀÏ,(SAL*12+COMM) ¿¬ºÀ
FROM EMP;

-- NULL ÇÔ¼ö »ç¿ë
SELECT
    ename,hiredate,(sal*12+NVL(comm, 0)) ¿¬ºÀ
FROM
    emp;

-- NULL ÇÔ¼ö »ç¿ë
SELECT
    ename,hiredate,NVL(sal*12+comm, sal*12) ¿¬ºÀ
FROM
    emp;

----------------------------------------------------------------------------------
/*
    °áÇÕ¿¬»êÀÚ : ¿À¶óÅ¬ ¿ª½Ã ¹®ÀÚ¿­À» °áÇÕÇÏ¿© Ãâ·ÂÇÒ ¼ö ÀÖ´Ù. 
                ÀÌ¶§´Â µÎ°³ÀÇ ÇÊµå¸¦ °áÇÕÇÒ ¼öµµ ÀÖ°í µ¥ÀÌÅÍ¸¦ °áÇÕÇÒ ¼öµµ ÀÖ´Ù. 
                °áÇÕµÈ °á°ú´Â ¹®ÀÚ¿­·Î ¸¸µé¾îÁø´Ù.
*/

SELECT 10||20 FROM DUAL;


--»ç¿ø¹øÈ£¿Í »ç¿øÀÌ¸§À» Á¶È¸ÇÏ´Âµ¥ Çü½ÄÀº »ç¿ø¹øÈ£- »ç¿øÀÌ¸§ÀÇ Çü½ÄÀ¸·Î Á¶È¸ÇÏ¼¼¿ä

SELECT
    empno || '-' || ename »ç¿ø    
FROM    EMP;

--»ç¿ø¹øÈ£, »ç¿øÀÌ¸§À» Á¶È¸ÇÏ´Âµ¥ 
--  0000¹ø, È«±æµ¿ ´Ô ÀÇ Çü½ÄÀ¸·Î Á¶È¸ÇÏ¼¼¿ä
SELECT
    empno ||'¹ø,' »ç¿ø¹øÈ£,ename||' ´Ô' »ç¿øÀÌ¸§ from emp;
    
    
 ---------------------------------------------------------------------------------
 /*
     Á¶°ÇÁ¶È¸ 
     Çü½Ä ] SELECT ÇÊµåÀÌ¸§µé.. FROM Å×ÀÌºíÀÌ¸§ WHERE Á¶°Ç½Ä
     Âü°í ] NULL °Ë»ö==>NULL µ¥ÀÌÅÍ´Â ¸ðµç ¿¬»ê¿¡¼­ Á¦¿ÜµÈ´Ù.
            µû¶ó¼­ ºñ±³¿¬»êÀÚ·Î null µ¥ÀÌÅÍ·Î ºñ±³ÇÒ ¼ö ¾ø´Ù.
 */

--Ä¿¹Ì¼ÇÀÌ ¾ø´Â »ç¿øµéÀÇ ÀÌ¸§, ±Þ¿© Ä¿¹Ì¼ÇÀ» Á¶È¸ÇÏ¼¼¿ä

SELECT  ename, sal,comm
from emp
where comm=null;-- null µ¥ÀÌÅÍ¸¦ ¿¬»ê¿¡¼­ Á¦¿Ü½ÃÅ°±â ¶§¹®
    
/*
    µû¶ó¼­ null µ¥ÀÌÅÍÀÇ ¹è±³´Â is null, is not nullÀ» »ç¿ëÇØ¼­ ºñ±³ÇØ¾ß ÇÑ´Ù.
*/
    
select
ename,sal,comm
from
emp
where
comm is null;

--Ä¿¹Ì¼ÇÀÌ ÀÖ´Â »ç¿øµéÀÇ »ç¿ø¹øÈ£, »ç¿øÀÌ¸§, ±Þ¿©, Ä¿¹Ì¼ÇÀ» Á¶È¸ÇÏ¼¼¿ä
-- ´Ü, Ä¿¹Ì¼ÇÀº 100À» Ãß°¡ÇØ¼­ Á¶È¸ÇÏ¼¼¿ä
select
empno »ç¿ø¹øÈ£, ename »ç¿øÀÌ¸§, sal ±Þ¿©,comm Ä¿¹Ì¼Ç_¿øº»,comm+100 Ä¿¹Ì¼Ç
from
emp
where
comm is not null;   --NOT comm IS NULLµµ °°Àº ÀÇ¹Ì
------------------------------------------------------------------------------------------
/*
    Á¶È¸µÈ °á°ú Á¤·ÄÇÏ±â
    ==> ¿øÄ¢ÀûÀ¸·Î µ¥ÀÌÅÍº£ÀÌ½º´Â Á¾·ù¿¡ µû¶ó ³ª¸§ÀÇ ±âÁØÀ» °¡Áö°í µ¥ÀÌÅÍ¸¦ Á¶È¸ÇÑ´Ù.
        (¹Ýµå½Ã ÀÔ·Â ¼ø¼­´ë·Î Á¶È¸µÇ´Â °ÍÀº ¾Æ´Ï´Ù.)
        ¿À¶óÅ¬Àº ³»ºÎÀûÀ¸·Î ÀÎµ¦½º¸¦ ÀÌ¿ëÇØ¼­ Ãâ·Â¼ø¼­¸¦ Á¶ÀýÇÏ°í ÀÖ´Ù.
        ==> Ãâ·Â¼ø¼­´Â ¸ð¸¦ ¼ö ÀÖ´Ù.
        
    Á¶È¸µÈ °á°ú¸¦ ¿øÇÏ´Â ¼ø¼­´ë·Î Á¤·ÄÇÏµµ·Ï ÁöÁ¤ÇØ¾ß ÇÑ´Ù.
    Çü½Ä] select ÇÊµåÀÌ¸§, ÇÊµåÀÌ¸§....
          from Å×ÀÌºíÀÌ¸§ 
          where Á¶°Ç½Ä 
          order by ÇÊµåÀÌ¸§[ASC||DESC],ÇÊµåÀÌ¸§[ASC||DESC].....;
    Âü°í ] ASC : ¿À¸§Â÷¼ø Á¤·Ä , DESC : ³»¸²Â÷¼ø Á¤·Ä
          
*/
desc emp; -- Å×ÀÌºíÀÇ Á¤º¸¸¦ º¸¿©ÁÖ´Â ¸í·É
describe emp;

-- »ç¿øÀÇ ÀÌ¸§, Á÷±Þ, ÀÔ»çÀÏÀ» Á¶È¸ÇÏ¼¼¿ä. ´Ü, ÀÌ¸§ ¼øÀ¸·Î ³»¸²Â÷¼ø Á¤·ÄÇØ¼­ Á¶È¸ÇÏ¼¼¿ä.
select ename, job,hiredate from emp
order by
    ename DESC;
    
-- À§ ¹®Á¦¸¦ ÀÔ»çÀÏ ±âÁØ ¿À¸§Â÷¼ø Á¤·ÄÇØ¼­ Á¶È¸ÇÏ¼¼¿ä    
SELECT
    ename »ç¿øÀÌ¸§,job »ç¿øÁ÷±Þ, hiredate ÀÔ»çÀÏ ,sal ±Þ¿© FROM emp
ORDER BY
    hiredate ;    

/* 
    Âü°í ]  Á¤·ÄÇÒ ‹š ¿À¸§Â÷¼ø Á¤·ÄÀÇ °æ¿ì¿¡´Â ASC¸¦ »ý·«ÇØµµ µÈ´Ù.(Á¤·Ä ±âº»Àº ¿À¸§Â÷¼øÀÌ±â ‹š¹®)
*/

-- »ç¿øµéÀÇ »ç¿øÀÌ¸§, ±Þ¿©, ºÎ¼­¹øÈ£¸¦ Á¶È¸ÇÏ´Âµ¥
-- ºÎ¼­¹øÈ£ ±âÁØ ¿À¸§Â÷¼ø Á¤·ÄµÇ°Ô ÇÏ°í °°Àº ºÎ¼­ÀÇ °æ¿ì¿¡´Â ±Þ¿©°¡ ¸¹Àº »ç¶÷ÀÌ ¸ÕÀú Ãâ·ÂµÇ°Ô ÇÏ¼¼¿ä.
select
ename »ç¿øÀÌ¸§, deptno ºÎ¼­¹øÈ£, sal ±Þ¿© from emp
order by ºÎ¼­¹øÈ£, ±Þ¿© DESC;


/*
    ¡Ú Á¤·ÄÀº À§ ÀýµéÀÇ ½ÇÇà°á°ú¸¦ °¡Áö°í Á¤·ÄÀ» ÇÏ°Ô µÈ´Ù.
     µû¶ó¼­ ORDER BY ÀýÀº ´Ù¸¥ ÀýµéÀÇ ÀÌÈÄ¿¡ ±â¼úµÇ¾î¾ß ÇÑ´Ù.
     
     Âü°í ] ÇÊµå¸¦ ÀÌ¿ëÇÑ ¿¬»ê°á°úµµ Á¤·Ä¿¡ »ç¿ëÇÒ ¼ö ÀÖ´Ù.
     LENGTH() - ¹®ÀÚ¿­ÀÇ ±æÀÌ¸¦ ¾Ë·ÁÁÖ´Â ÇÔ¼ö
*/

--»ç¿øÀÌ¸§, Á÷±Þ, ±Þ¿©¸¦ Á¶È¸ÇÏ¼¼¿ä
-- ´Ü, ÀÌ¸§±æÀÌ°¡ ÂªÀº »ç¶÷ÀÌ ¸ÕÀú Ãâ·ÂµÇ°ÔÇÏ°í, °°Àº ±æÀÌ¸é ¿À¸§Â÷¼ø Á¤·ÄÇÏ¼¼¿ä

SELECT  ename ÀÌ¸§ , job Á÷±Þ, sal ±Þ¿©
FROM
    emp
ORDER BY
    LENGTH(ename) ASC, ename;
    
select LENGTH('À±¾Æ') ¹®ÀÚ¼ö, LENGTHB('À±¾Æ')¹ÙÀÌÆ®¼ö from dual;

/*
    ÁýÇÕ¿¬»êÀÚ :  µÎ °³ ÀÌ»óÀÇ select ÁúÀÇ ¸í·ÉÀ» ÀÌ¿ëÇØ¼­ ±× °á°úÀÇ ÁýÇÕÀ» ¾ò¾î³»´Â ¹æ¹ý
        Çü½Ä ] SELECT....
                ÁýÇÕ¿¬»êÀÚ
               SELECT.....
               
        Á¾·ù ] UNION : ÇÕÁýÇÕÀÇ °³³ä, µÎ °¡Áö ÁúÀÇ ¸í·ÉÀÇ °á°ú¸¦ ÇÏ³ª·Î ÇÕÃÄ¼­ Á¶È¸ÇÑ´Ù.
               UNION ALL : ÇÕÁýÇÕÀÇ °³³ä + ´Ü, UNION°ú ´Ù¸¥ Á¡Àº UNIONÀÇ °æ¿ì´Â Áßº¹µ¥ÀÌÅÍ¸¦ ÇÑ¹ø¸¸ Ãâ·ÂÇØÁÖ´Âµ¥
                           UNION ALLÀÇ °æ¿ì´Â Áßº¹µ¥ÀÌÅÍ¸¦ ¸ðµÎ Ãâ·ÂÇØÁØ´Ù.
               INTERSECT : ±³ÁýÇÕÀÇ °³³ä. Á¶È¸ ÁúÀÇ¸í·ÉÀÇ °á°ú Áß ¾çÂÊ ¸ðµÎ Á¸ÀçÇÏ´Â °á°ú¸¸ Ãâ·ÂÇÏ´Â °Í
               MINUS : Â÷ÁýÇÕÀÇ °³³ä. ¾ÕÀÇ ÁúÀÇ¸í·ÉÀÇ °á°ú¿¡¼­ µÚÀÇ ÁúÀÇ¸í·ÉÀÇ °á°ú¿¡ Æ÷ÇÔµÈ µ¥ÀÌÅÍ¸¦ »« °á°ú¸¦ Ãâ·ÂÇØÁØ´Ù.
               
   Âü°í ] °øÅëÀûÀÎ Æ¯Â¡ 1. µÎ°³ÀÇ ÁúÀÇ ¸í·É¿¡¼­ ³ª¿Â °á°ú´Â °°Àº ÇÊµåÀÇ °¹¼ö¸¦ °¡Á®¾ß ÇÑ´Ù.
                       2. µÎ ÁúÀÇ ¸í·ÉÀÇ °á°ú´Â °°Àº ÇüÅÂÀÇ ÇÊµåÀÌ¸é µÈ´Ù.(Å¸ÀÔ¸¸ °°À¸¸é µÈ´Ù) 
*/

SELECT
    ename »ç¿øÀÌ¸§, sal ±Þ¿©
FROM
    emp
UNION
SELECT job Á÷±Þ, deptno ºÎ¼­¹øÈ£
FROM
    emp;

/*
¿À¶óÅ¬ ÇÔ¼ö Á¾·ù ] 
    1. ´ÜÀÏÇà ÇÔ¼ö : ÇÑÁÙÇÑÁÙ¸¶´Ù ¸Å¹ö ¸í·ÉÀÌ ½ÇÇàµÇ´Â ÇÔ¼ö. µû¶ó¼­ ´ÜÀÏÇà ÇÔ¼öÀÇ °á°ú´Â Ãâ·ÂµÇ´Â µ¥ÀÌÅÍÀÇ °¹¼ö 
    2. ±×·ìÇÔ¼ö : ¿©·¯ÇàÀÌ ¸ð¿©¼­ ÇÑ¹ø¸¸ ½ÇÇàµÇ´Â ÇÔ¼ö µû¶ó¼­ ±×·ì ÇÔ¼ö´Â Ãâ·Â°¹¼ö°¡ ¿ÀÁ÷ ÇÑ°³ÀÌ´Ù.
                  Áý°èÇÔ¼öµéÀÌ ±×·ìÇÔ¼ö¿¡ ÇØ´çÇÑ´Ù. 
                  max(), min(), sum() : ÇÕ°è, avg() : Æò±Õ, count() : °¹¼ö
    ¡Ú ÁÖÀÇ»çÇ× : ´ÜÀÏÇà ÇÔ¼ö,ÀÏ¹ÝÇÊµå¿Í ±×·ìÇÔ¼ö´Â Àý´ë·Î °°ÀÌ »ç¿ëÇÒ ¼ö ¾ø´Ù.             
*/

--10¹ø ºÎ¼­ÀÇ »ç¿øµéÀÇ »ç¿ø¼ö¸¦ Á¶È¸ÇÏ¼¼¿ä.

select
    count(*) »ç¿ø¼ö
from emp
where
deptno=10;


--Ä¿¹Ì¼ÇÀÌ ¾ø´Â »ç¿øµéÀÇ ¼ö¸¦ Á¶È¸ÇÏ¼¼¿ä
select
    count(*) "Ä¿¹Ì¼Ç ¾ø´Â »ç¿ø¼ö"
from emp
where
    comm is null;

--null µ¥ÀÌÅÍ´Â ¸ðµç ¿¬»ê¿¡¼­ Á¦¿ÜµÈ´Ù.
-- µû¶ó¼­ ÇÔ¼ö¿¡¼­µµ Á¦¿Ü°¡ µÈ´Ù.
select count(*)-count(comm) "Ä¿¹Ì¼Ç ¾ø´Â »ç¿ø ¼ö"
from emp;

--------------------------------------------------------------------------------
/*
    ´ÜÀÏÇà ÇÔ¼ö
    
    *** ¼ýÀÚ <--------------->  ¹®ÀÚ <---------------> ³¯Â¥
    1. ¼ýÀÚÇÔ¼ö
        ==> µ¥ÀÌÅÍ°¡ ¼ýÀÚÀÎ °æ¿ì¿¡¸¸ »ç¿ëÇÒ ¼ö ÀÖ´Â ÇÔ¼ö
        1) ABS() : Àý´ë°ªÀ» ±¸ÇØÁÖ´Â ÇÔ¼ö
            Çü½Ä ] ABS(µ¥ÀÌÅÍ ¶Ç´Â ÇÊµå ¶Ç´Â ¿¬»ê½Ä)
        2) ROUND() : ¹Ý¿Ã¸²ÇØÁÖ´Â ÇÔ¼ö
            Çü½Ä ] ROUND(µ¥ÀÌÅÍ[,ÀÚ¸´¼ö])
        3) FLOOR() : ¹ö¸²ÇÔ¼ö, ¼Ò¼öÁ¡ ÀÌÇÏ¸¦ ¹«Á¶°Ç ¹ö¸°´Ù.
            Çü½Ä ] FLOOR(µ¥ÀÌÅÍ ¶Ç´Â ÇÊµå ¶Ç´Â ¿¬»ê½Ä)
        4) TRUNC() : ÀÚ¸´¼ö ÀÌÇÏ ¹ö¸²ÇÔ¼ö, ÀÚ¸´¼ö¸¦ ÁöÁ¤ÇØ¼­ ¹ö¸±¼ö ÀÖ´Ù.
            Çü½Ä ] TRUNC(µ¥ÀÌÅÍ, (ÀÚ¸´¼ö))
                   ÀÚ¸´¼ö´Â ¼Ò¼öÀÌÇÏ ÀÚ¸´¼ö¸¦ ÀÇ¹ÌÇÏ°í ¸¸¾à À½¼öÇüÅÂ·Î ÀÔ·ÂÇÏ¸é 
                   ¼Ò¼öÀÌ»ó ÀÚ¸´¼ö¸¦ ÀÇ¹ÌÇÑ´Ù.
        5) MOD()   : ³ª¸ÓÁö ±¸ÇÏ´Â ÇÔ¼ö
            Çü½Ä ] MOD(µ¥ÀÌÅÍ, ³ª´­ ¼ö)
    2. ¹®ÀÚÇÔ¼ö
        
    3. ³¯Â¥ÇÔ¼ö
    
    Âü°í ] 
        CLOB - ¹®ÀÚµ¥ÀÌÅÍ¸¦ 4±â°¡±îÁö ÀúÀåÇÒ ¼ö ÀÖ´Â Å¸ÀÔ
        BLOB - ¹ÙÀÌ³Ê¸®ÄÚµå¸¦ 4±â°¡±îÁö ÀúÀåÇÒ ¼ö ÀÖ´Â Å¸ÀÔ
        Âü°í ] ¹®ÀÚ¿­ µ¥ÀÌÅÍÀÇ µ¥ÀÌÅÍ Å¸ÀÔÀÇ ÃÖ´ë Å©±â´Â 4KB ÀÌ´Ù.
*/

SELECT ABS(-3.14) PI FROM DUAL;

SELECT ROUND(4.13,1)PI FROM DUAL;

--»ç¿øµéÀÇ ±Þ¿©¸¦ 15% ÀÎ»óÇÑ ±Ý¾×À» Á¶È¸ÇØº¸ÀÚ.
-- ´Ü ¼Ò¼ö Ã¹Â°ÀÚ¸®¿¡¼­ ¹Ý¿Ã¸²ÇØ¼­ Á¶È¸ÇÏ¼¼¿ä

SELECT ENAME ÀÌ¸§,SAL ¿ø±Þ¿©,SAL*1.15 °è»ê°ª,ROUND(SAL*1.15,-2) ÀÎ»ó±Þ¿©,FLOOR(SAL*1.15) ¹ö¸²ÇÔ¼ö,TRUNC(SAL*1.15,-2)ÀÚ¸´¼ö¹ö¸² FROM EMP;

SELECT MOD(10,3) "10À» 3À¸·Î ³ª´« ³ª¸ÓÁö" FROM DUAL;
SELECT MOD(10,3) "10³ª´©±â3Àº"FROM DUAL;


--±Þ¿©°¡ Â¦¼öÀÎ »ç¿øÀ» Ãâ·ÂÇÏ¼¼¿ä
SELECT ENAME,JOB,SAL
FROM   EMP
WHERE   MOD(SAL,2) = 0;



---------------------------------------------------------------------------------
/*
    2. ¹®ÀÚÃ³¸® ÇÔ¼ö
        1. LOWER() : ¼Ò¹®ÀÚ·Î º¯È¯
        2. UPPER() : ´ë¹®ÀÚ·Î º¯È¯
        3. INITCAP() : ´Ü¾îÀÇ Ã¹¹®ÀÚ¸¸ ´ë¹®ÀÚ·Î ³ª¸ÓÁö´Â ¼Ò¹®ÀÚ·Î º¯È¯ÇØÁÖ´Â ÇÔ¼ö
        4. LENGTH / LENGTHB() : 
            Çü½Ä ] LENGTH(¹®ÀÚ¿­µ¥ÀÌÅÍ) : ¹®ÀÚ¿­ÀÇ ¹®ÀÚ¼ö¸¦ ¹ÝÈ¯
                   LENGTHB(¹®ÀÚ¿­µ¥ÀÌÅÍ) : ¹®ÀÚ¿­ÀÇ ¹ÙÀÌÆ®¼ö¸¦ ¹ÝÈ¯
        5. CONCAT() : ||(°áÇÕ¿¬»êÀÚ)¿Í °°Àº ±â´É
            Çü½Ä ] CONCAT(µ¥ÀÌÅÍ1,µ¥ÀÌÅÍ2)
        6. SUBSTR() / SUBSTRB() : ¹®ÀÚ¿­ Áß¿¡¼­ Æ¯Á¤ À§Ä¡ÀÇ ¹®ÀÚ¿­¸¸ µû·Î ÃßÃâÇØ¼­ ¹ÝÈ¯ÇØÁÖ´Â ÇÔ¼ö
                    Çü½Ä ) SUBSTR(µ¥ÀÌÅÍ, ½ÃÀÛÀ§Ä¡, ²¨³¾°¹¼ö)
                    ÁÖÀÇ ) À§Ä¡°ªÀº µ¥ÀÌÅÍº£ÀÌ½º¿¡¼­´Â 1ºÎÅÍ ½ÃÀÛÇÑ´Ù. 
                    Âü°í ] °¹¼ö´Â »ý·«ÇÒ ¼ö ÀÖ´Ù. ÀÌ¶§ ²¨³»¿À´Â ¹®ÀÚ¿­Àº ¹®ÀÚ¿­ÀÇ ³¡ºÎºÐ±îÁö ²¨³»¿À°Ô µÈ´Ù.
                    Âü°í ] ½ÃÀÛÀ§Ä¡¸¦ À½¼ö·Î ±âÀÔÇÏ´Â °æ¿ì´Â ¹®ÀÚ¿­ÀÇ µÚ¿¡¼­ºÎÅÍÀÇ ÀÚ¸´¼ö¸¦ ÀÇ¹ÌÇÏ°Ô µÈ´Ù.
                    
        7. INSTR() / INSTRB() : ¹®ÀÚ¿­ Áß¿¡¼­ ¿øÇÏ´Â ¹®ÀÚ¿­ÀÌ ¸î¹øÂ° ±ÛÀÚ¿¡ ÀÖ´ÂÁö¸¦ ¾Ë¾Æ³»ÁÖ´Â ÇÔ¼ö
                                Çü½Ä ] INSTR(µ¥ÀÌÅÍ1, µ¥ÀÌÅÍ2(, ½ÃÀÛÀ§Ä¡, ÃâÇö È½¼ö))
        8. LPAD() / RPAD() : ¹®ÀÚ¿­ÀÇ ±æÀÌ¸¦ ÁöÁ¤ÇÑ ÈÄ ¹®ÀÚ¿­À» ¸¸µå´Âµ¥ ³²´Â °ø°£Àº ÁöÁ¤ÇÑ ¹®ÀÚ·Î Ã¤¿ö¼­ ¹®ÀÚ¿­À» ¸¸µé¾îÁÖ´Â ÇÔ¼ö
        5ÀÚ¸®¹®ÀÚ¸¦ 10ÀÚ¸® ¹®ÀÚ·Î ¸¸µé°í ½ÍÀ»¶§.. ¿ÞÂÊÀ¸·Î ÇÒÁö ¿À¸¥ÂÊÀ¸·Î ÇÒÁö °áÁ¤...
        Â÷ÀÌÁ¡ : ³²´Â °ø°£À» Ã¤¿ì´Âµ¥ ¿ÞÂÊ¿¡ Ã¤¿ï°ÇÁö ¿À¸¥ÂÊ¿¡ Ã¤¿ï°ÇÁö °áÁ¤
        Çü½Ä ] LPAD(µ¥ÀÌÅÍ, ¸¸µé±æÀÌ, Ã¤¿ï¹®ÀÚ)
*/

SELECT LOWER(ENAME) ¼Ò¹®ÀÚÀÌ¸§, UPPER(ENAME) ´ë¹®ÀÚÀÌ¸§,INITCAP(ENAME) "Ã¹±ÛÀÚ¸¸ ´ë¹®ÀÚ"
FROM EMP;


SELECT INITCAP('hello jennie!') from dual;


--»ç¿øµéÀÇ ÀÌ¸§, Á÷±Þ, ±Þ¿©¸¦ Á¶È¸ÇÏ´Âµ¥ Ãâ·ÂÇü½ÄÀº Mr.SMITH, CLEARK Á÷±Þ 800 ´Þ·¯
SELECT CONCAT('Mr.',ENAME) »ç¿øÀÌ¸§, CONCAT(JOB,' Á÷±Þ') Á÷±Þ, CONCAT(SAL,' ´Þ·¯') ±Þ¿©
FROM EMP;



SELECT SUBSTR('HELLO WORLD',1,6) ¹®ÀÚ¿­ÃßÃâ
FROM DUAL;

SELECT SUBSTR('HELLO WORLD',-6,6) ¹®ÀÚ¿­ÃßÃâ
FROM DUAL;

SELECT INSTR('HELLO HONGGILGDONG HI','H',2,2) FROM DUAL;

--»ç¿øÀÌ¸§À» Á¶È¸ÇÏ´Âµ¥ ÀÌ¸§À» 10±ÛÀÚ·Î ¸¸µé¾î¼­ Ç¥ÇöÇÏ¼¼¿ä.(´Ü, ³²´Â ºÎºÐÀº *·Î  Ã¤¿ì¼¼¿ä)
SELECT LPAD(ENAME,10,'*') "¿À¸¥ÂÊ Á¤·Ä",  RPAD(ENAME,10,'*')"¿ÞÂÊ Á¤·Ä"
FROM EMP;
--LPAD *¸¦ ¿ÞÂÊÀ¸·Î Ã¤¿ò,  RPAD *À» ¿À¸¥ÂÊÀ¸·Î Ã¤¿ò



----------------------------------------------------------------------------------------
-- »ç¿øµéÀÇ ÀÌ¸§À» ¾Õ µÎ±ÛÀÚ¸¸ Ç¥½ÃÇÏ°í ³ª¸ÓÁö´Â *·Î Ç¥½ÃÇÏ¼¼¿ä
SELECT
    RPAD(SUBSTR(ENAME,1,2) ,LENGTH(ENAME),'*') ²¨³»¿ÂÀÌ¸§, ENAME ¿øÀÌ¸§
FROM   EMP;


SELECT
    RPAD(SUBSTR(ENAME,1,2), LENGTH(ENAME),'*') ²¨³»¿ÂÀÌ¸§, ENAME ¿øÀÌ¸§
FROM EMP;



--¹®Á¦ 1) »ç¿øÀÌ¸§ÀÌ 5±ÛÀÚ ÀÌÇÏÀÎ »ç¿øµéÀÇ »ç¿ø¹øÈ£, »ç¿øÀÌ¸§, ±ÛÀÚ¼ö, Á÷±Þ, ±Þ¿©¸¦ Á¶È¸ÇÏ¼¼¿ä.
        --Ãâ·ÂÀº ±ÛÀÚ¼ö°¡ ÀÛÀº »ç¿øÀÇ ÀÌ¸§¼øÀ¸·Î Á¤·ÄÇØ¼­ Á¶È¸ÇÏ¼¼¿ä. 
select empno »ç¿ø¹øÈ£,ename »ç¿øÀÌ¸§,length(ename)±ÛÀÚ¼ö, job Á÷±Þ,sal ±Þ¿©
from emp
where
    length(ename)<=5
order by length(ename);


-- ¹®Á¦2) »ç¿øÀÌ¸§ µÚ¿¡ '»ç¿ø'À» ºÙ¿©¼­ »ç¿øÀÌ¸§, »ç¿øÁ÷±Þ, ÀÔ»çÀÏÀ» Á¶È¸ÇÏ¼¼¿ä
select  concat(ename,' »ç¿ø') »ç¿øÀÌ¸§, job »ç¿øÁ÷±Þ, hiredate ÀÔ»çÀÏ
from emp;

--¹®Á¦3) »ç¿øÀÌ¸§ÀÇ ¸¶Áö¸·±ÛÀÚ°¡ 'N'ÀÎ »ç¿øµéÀÇ »ç¿øÀÌ¸§, ÀÔ»çÀÏ, ºÎ¼­¹øÈ£¸¦ Á¶È¸ÇÏ¼¼¿ä
--  (Á¤·ÄÀº ºÎ¼­¹øÈ£ ¼øÀ¸·Î ÇÏ°í °°Àº ºÎ¼­ÀÇ °æ¿ì, ÀÌ¸§¼øÀ¸·Î Á¤·ÄÇØ¼­ Á¶È¸ÇÏ¼¼¿ä)

select ename »ç¿øÀÌ¸§ , hirdate ÀÔ»çÀÏ, empno ºÎ¼­¹øÈ£
from emp;

SELECT  ENAME »ç¿øÀÌ¸§, HIREDATE ÀÔ»çÀÏ, EMPNO ºÎ¼­¹øÈ£
FROM EMP
WHERE SUBSTR(ENAME,LENGTH(ENAME))='N';

--¹®Á¦4 ) »ç¿øÀÌ¸§ Áß 'a'°¡ Á¸ÀçÇÏÁö ¾Ê´Â »ç¿øÀÇ Á¤º¸¸¦ Á¶È¸ÇÏ¼¼¿ä
select ename »ç¿øÀÌ¸§, hiredate ÀÔ»çÀÏ, empno ºÎ¼­¹øÈ£
from emp
where instr(ename,'A') =0;
    


--¹®Á¦ 5) »ç¿øÀÌ¸§ Áß¿¡¼­ µÚ 2±ÛÀÚ¸¸ ³²±â°í ¾Õ ±ÛÀÚ´Â ¸ðµÎ '#'À¸·Î ´ëÃ¼ÇØ¼­ »ç¿øÀÌ¸§, ÀÔ»çÀÏ, ±Þ¿©¸¦ Á¶È¸ÇÏ¼¼¿ä
select lpad(substr(ename,-2),length(ename),'#') »ç¿øÀÌ¸§, hiredate ÀÔ»çÀÏ, sal ±Þ¿©
from emp;

--¹®Á¦ 6) 'jennie@githrd.com' ÀÌ¶ó´Â ¸ÞÀÏ¿¡¼­ ¾ÆÀÌµðºÎºÐÀº ¼¼¹øÂ° ¹®ÀÚ¸¸ Ç¥½ÃÇÏ°í ³ª¸ÓÁö ¹®ÀÚ´Â '*'·Î ´ëÃ¼ÇÏ°í @´Â Ç¥½ÃÇÏ°í
            --.comµµ Ç¥½ÃÇÏ°í ³ª¸ÓÁö´Â *·Î ´ëÃ¼ÇØ¼­ Á¶È¸µÇ´Â ÁúÀÇ¸í·ÉÀ» ÀÛ¼ºÇÏ¼¼¿ä.

--¾ÆÀÌµð :

--jennie@githrd.com Áß @±îÁö´Â ÀÚ¸£±â
select substr('jennie@githrd.com',0,instr('jennie@githrd.com','@')-1)
from dual;

--°ñ¹ðÀÌ Â¥¸£±â
select substr('jennie@githrd.com',instr('jennie@githrd.com','@'),1)
from dual;
--@~com Àü±îÁö Â¥¸£±â
--githrd ÃßÃâ

--select rpad('jennie@githrd.com',substr('jennie@githrd.com,instr('jennie@githrd.com','@'),1))
--from dual;

select substr('jennie@githrd.com',instr('jennie@githrd.com','.'))
from dual;


select length(substr('jennie@githrd.com',instr('jennie@githrd.com','@')+1,instr('jennie@githrd.com','.')))-length(substr('jennie@githrd.com',instr('jennie@githrd.com','.')))
from dual;

-@ ÃßÃâ

select substr('jennie@githrd.com',instr('jennie@githrd.com','@'),1)
from dual;
select rpad(substr('jennie@githrd.com',instr('jennie@githrd.com','@'),1),length(substr('jennie@githrd.com',instr('jennie@githrd.com','@'),instr('jennie@githrd.com','.')))-length(substr('jennie@githrd.com',instr('jennie@githrd.com','.'))),'*')
from dual;


select concat(concat(rpad(substr('jennie@githrd.com',0,3), length(substr('jennie@githrd.com',0,instr('jennie@githrd.com','@')-1)),'*'),rpad(substr('jennie@githrd.com',instr('jennie@githrd.com','@'),1),length(substr('jennie@githrd.com',
instr('jennie@githrd.com','@'),instr('jennie@githrd.com','.')))-length(substr('jennie@githrd.com',instr('jennie@githrd.com','.'))),'*')),substr('jennnie@githrd.com',instr('jennie@githrd.com','c')))
from dual;



