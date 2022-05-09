SELECT gender,
    university,
    COUNT(*) user_num,
    AVG(active_days_within_30) avg_active_day,
    AVG(question_cnt) avg_question_cnt
FROM user_profile
GROUP BY gender,
    university;