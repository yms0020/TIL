-- 문제: NULL 처리하기
-- 플랫폼: 프로그래머스
-- 언어: Oracle
-- 난이도: Level 2
-- URL: https://school.programmers.co.kr/learn/courses/30/lessons/59410
내 답:
SELECT ANIMAL_TYPE,NVL(NAME,'No name'),SEX_UPON_INTAKE
FROM ANIMAL_INS
ORDER BY ANIMAL_ID
