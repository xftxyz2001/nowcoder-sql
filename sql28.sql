SELECT DAY(date) day,
    COUNT(*) question_cnt
FROM question_practice_detail
GROUP BY day;