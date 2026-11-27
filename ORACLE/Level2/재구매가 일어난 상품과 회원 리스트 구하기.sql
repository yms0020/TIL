-- 문제: 재구매가 일어난 상품과 회원 리스트 구하기
-- 플랫폼: 프로그래머스
-- 언어: Oracle
-- 난이도: Level 2
-- URL: https://school.programmers.co.kr/learn/courses/30/lessons/131536
내 답:
SELECT USER_ID,PRODUCT_ID
FROM ONLINE_SALE
GROUP BY USER_ID,PRODUCT_ID
HAVING COUNT(*) >= 2
ORDER BY USER_ID,PRODUCT_ID DESC;
