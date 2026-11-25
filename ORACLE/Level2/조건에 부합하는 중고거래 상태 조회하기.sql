-- 문제: 조건에 부합하는 중고거래 상태 조회하기
-- 플랫폼: 프로그래머스
-- 언어: Oracle
-- 난이도: Level 2
-- URL: https://school.programmers.co.kr/learn/courses/30/lessons/164672
내 답:
SELECT BOARD_ID,WRITER_ID,TITLE,PRICE,
                                      CASE 
                                          WHEN STATUS = 'SALE' THEN '판매중'
                                          WHEN STATUS = 'RESERVED' THEN '예약중'
                                          WHEN STATUS = 'DONE' THEN '거래완료'
                                      END AS STATUS
FROM USED_GOODS_BOARD
WHERE CREATED_DATE = DATE '2022-10-05' 
ORDER BY BOARD_ID DESC
