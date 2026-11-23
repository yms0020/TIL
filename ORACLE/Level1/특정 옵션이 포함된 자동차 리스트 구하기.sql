-- 문제: 특정 옵션이 포함된 자동차 리스트 구하기
-- 플랫폼: 프로그래머스
-- 언어: Oracle
-- 난이도: Level 1
-- URL: https://school.programmers.co.kr/learn/courses/30/lessons/157343

내 답:
SELECT * 
FROM CAR_RENTAL_COMPANY_CAR 
WHERE OPTIONS LIKE '%네비게이션%' 
ORDER BY CAR_ID DESC; 
