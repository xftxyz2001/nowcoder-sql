SELECT u.university,
    COUNT(*) / COUNT(DISTINCT u.device_id) avg_answer_cnt
FROM user_profile u,
    question_practice_detail q
WHERE u.device_id = q.device_id
GROUP BY u.university
ORDER BY u.university ASC;