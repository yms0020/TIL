-- 문제: 상위 n개 레코드
-- 플랫폼: 프로그래머스
-- 언어: Oracle
-- 난이도: Level 1
-- URL: https://school.programmers.co.kr/learn/courses/30/lessons/59405
  
내 답:
SELECT NAME
FROM ANIMAL_INS
WHERE DATETIME = (SELECT MIN(DATETIME) FROM ANIMAL_INS);
