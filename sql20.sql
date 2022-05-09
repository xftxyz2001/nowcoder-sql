SELECT university,
    AVG(question_cnt) avg_question_cnt
FROM user_profile
GROUP BY university
ORDER BY avg_question_cnt ASC;