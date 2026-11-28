-- 문제: 동명 동물 수 찾기
-- 플랫폼: 프로그래머스
-- 언어: Oracle
-- 난이도: Level 2
-- URL: https://school.programmers.co.kr/learn/courses/30/lessons/59041
내 답:
SELECT NAME,COUNT(NAME)
FROM ANIMAL_INS
GROUP BY NAME
HAVING COUNT(NAME) >= 2
ORDER BY NAME;
