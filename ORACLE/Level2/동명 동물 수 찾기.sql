https://school.programmers.co.kr/learn/courses/30/lessons/59041
내 답:
SELECT NAME,COUNT(NAME)
FROM ANIMAL_INS
GROUP BY NAME
HAVING COUNT(NAME) >= 2
ORDER BY NAME;
