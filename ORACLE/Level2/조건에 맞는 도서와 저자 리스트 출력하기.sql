-- 문제: 조건에 맞는 도서와 저자 리스트 출력하기
-- 플랫폼: 프로그래머스
-- 언어: Oracle
-- 난이도: Level 2
-- URL: https://school.programmers.co.kr/learn/courses/30/lessons/144854?language=oracle
내 답:
SELECT T.BOOK_ID,S.AUTHOR_NAME,TO_CHAR(T.PUBLISHED_DATE,'YYYY-MM-DD')
FROM BOOK T,AUTHOR S
WHERE T.AUTHOR_ID = S.AUTHOR_ID 
AND T.CATEGORY = '경제' 
ORDER BY T.PUBLISHED_DATE;
