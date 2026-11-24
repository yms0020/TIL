-- 문제: 12세 이하인 여자 환자 목록 출력하기
-- 플랫폼: 프로그래머스
-- 언어: Oracle
-- 난이도: Level 1
-- URL: https://school.programmers.co.kr/learn/courses/30/lessons/132201

내 답:
SELECT PT_NAME,PT_NO,GEND_CD,AGE,NVL(TLNO,'NONE') AS TLNO
FROM PATIENT
WHERE AGE <= 12 AND GEND_CD = 'W'
ORDER BY AGE DESC,PT_NAME;
