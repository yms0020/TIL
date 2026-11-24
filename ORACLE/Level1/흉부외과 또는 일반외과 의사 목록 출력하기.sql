-- 문제: 흉부외과 또는 일반외과 의사 목록 출력하기
-- 플랫폼: 프로그래머스
-- 언어: Oracle
-- 난이도: Level 1
-- URL: https://school.programmers.co.kr/learn/courses/30/lessons/132203

내 답:
SELECT DR_NAME,DR_ID,MCDP_CD,TO_CHAR(HIRE_YMD,'YYYY-MM-DD')
FROM DOCTOR
WHERE MCDP_CD IN ('CS','GS')
ORDER BY HIRE_YMD DESC,DR_NAME;
