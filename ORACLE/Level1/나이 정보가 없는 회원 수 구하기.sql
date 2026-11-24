-- 문제: 나이 정보가 없는 회원 수 구하기
-- 플랫폼: 프로그래머스
-- 언어: Oracle
-- 난이도: Level 1
-- URL: https://school.programmers.co.kr/learn/courses/30/lessons/131528

내 답:
SELECT COUNT(*) AS USERS
FROM USER_INFO
WHERE AGE IS NULL;
