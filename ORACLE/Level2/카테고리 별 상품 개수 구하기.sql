-- 문제: 카테고리 별 상품 개수 구하기
-- 플랫폼: 프로그래머스
-- 언어: Oracle
-- 난이도: Level 2
-- URL: https://school.programmers.co.kr/learn/courses/30/lessons/131529
내 답:
SELECT SUBSTR(PRODUCT_CODE,1,2) AS CATEGORY,COUNT(SUBSTR(PRODUCT_CODE,1,2)) AS PRODUCTS
FROM PRODUCT
GROUP BY SUBSTR(PRODUCT_CODE,1,2)
ORDER BY CATEGORY
