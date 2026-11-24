-- 문제: 평균 일일 대여 요금 구하기
-- 플랫폼: 프로그래머스
-- 언어: Oracle
-- 난이도: Level 1
-- URL: https://school.programmers.co.kr/learn/courses/30/lessons/151136

내 답:
-- 코드를 입력하세요
SELECT ROUND(AVG(DAILY_FEE)) AS AVERAGE_FEE 
FROM CAR_RENTAL_COMPANY_CAR 
WHERE CAR_TYPE = 'SUV';
