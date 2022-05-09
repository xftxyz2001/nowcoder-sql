SELECT university,
    AVG(question_cnt) avg_question_cnt,
    AVG(answer_cnt) avg_answer_cnt
FROM user_profile
GROUP BY university
HAVING avg_question_cnt < 5
    OR avg_answer_cnt < 20;