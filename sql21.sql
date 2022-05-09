SELECT u.device_id,
    q.question_id,
    q.result
FROM user_profile u,
    question_practice_detail q
WHERE u.device_id = q.device_id
    AND u.university = '浙江大学'
ORDER BY q.question_id ASC;