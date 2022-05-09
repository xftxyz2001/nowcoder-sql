SELECT device_id,
    gender,
    CASE
        WHEN age BETWEEN 20 AND 24 THEN "20-24岁"
        WHEN age >= 25 THEN "25岁及以上"
        ELSE "其他"
    END AS age_cut
FROM user_profile;