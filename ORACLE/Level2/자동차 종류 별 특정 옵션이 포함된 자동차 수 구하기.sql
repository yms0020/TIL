-- 문제: 자동차 종류 별 특정 옵션이 포함된 자동차 수 구하기
-- 플랫폼: 프로그래머스
-- 언어: Oracle
-- 난이도: Level 1
-- URL: https://school.programmers.co.kr/learn/courses/30/lessons/151137
내 답:
SELECT CAR_TYPE,COUNT(*) AS CARS
FROM CAR_RENTAL_COMPANY_CAR
WHERE OPTIONS LIKE('%시트%')
GROUP BY CAR_TYPE
ORDER BY CAR_TYPE;
