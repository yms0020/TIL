https://school.programmers.co.kr/learn/courses/30/lessons/132202
내 답:
SELECT MCDP_CD AS 진료과코드,COUNT(APNT_NO) AS "5월예약건수"
FROM APPOINTMENT
WHERE APNT_YMD >= DATE '2022-05-01' AND APNT_YMD < DATE '2022-06-01'
GROUP BY MCDP_CD	
ORDER BY "5월예약건수",진료과코드;
