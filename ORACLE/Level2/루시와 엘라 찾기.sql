-- 문제: 루시와 엘라 찾기
-- 플랫폼: 프로그래머스
-- 언어: Oracle
-- 난이도: Level 2
-- URL: https://school.programmers.co.kr/learn/courses/30/lessons/59046

내 답:
SELECT ANIMAL_ID,NAME,SEX_UPON_INTAKE
FROM ANIMAL_INS
WHERE NAME IN('Lucy','Ella','Pickle','Rogan','Sabrina','Mitty');
