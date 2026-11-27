-- 문제: 상품 별 오프라인 매출 구하기
-- 플랫폼: 프로그래머스
-- 언어: Oracle
-- 난이도: Level 2
-- URL: https://school.programmers.co.kr/learn/courses/30/lessons/131533
내 답:
SELECT T.PRODUCT_CODE,SUM(T.PRICE * SALES_AMOUNT) AS SALES
FROM PRODUCT T,OFFLINE_SALE S 
WHERE T.PRODUCT_ID = S.PRODUCT_ID
GROUP BY T.PRODUCT_CODE
ORDER BY SALES DESC,PRODUCT_CODE;
