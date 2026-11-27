-- 문제: 3월에 태어난 여성 회원 목록 출력하기
-- 플랫폼: 프로그래머스
-- 언어: Oracle
-- 난이도: Level 2
-- URL: https://school.programmers.co.kr/learn/courses/30/lessons/131120
내 답:
SELECT MEMBER_ID, MEMBER_NAME,GENDER, TO_CHAR(DATE_OF_BIRTH,'YYYY-MM-DD')
FROM MEMBER_PROFILE
WHERE TO_CHAR(DATE_OF_BIRTH,'YYYY-MM-DD') LIKE '%-03-%' 
AND TLNO IS NOT NULL 
AND GENDER = 'W'
ORDER BY MEMBER_ID;
