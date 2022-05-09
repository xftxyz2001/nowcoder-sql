SELECT up.university,
    qd.difficult_level,
    COUNT(*) / COUNT(DISTINCT up.device_id) avg_answer_cnt
FROM user_profile up
    INNER JOIN question_practice_detail qpd ON up.device_id = qpd.device_id
    INNER JOIN question_detail qd ON qpd.question_id = qd.question_id
WHERE up.university = '山东大学'
GROUP BY up.university,
    qd.difficult_level;