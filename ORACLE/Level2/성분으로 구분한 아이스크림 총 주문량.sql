-- 문제: 성분으로 구분한 아이스크림 총 주문량
-- 플랫폼: 프로그래머스
-- 언어: Oracle
-- 난이도: Level 2
-- URL: https://school.programmers.co.kr/learn/courses/30/lessons/133026
내 답:
SELECT INGREDIENT_TYPE,SUM(TOTAL_ORDER) AS TOTAL_ORDER
FROM FIRST_HALF T,ICECREAM_INFO S
WHERE T.FLAVOR = S.FLAVOR
GROUP BY INGREDIENT_TYPE
ORDER BY TOTAL_ORDER;
