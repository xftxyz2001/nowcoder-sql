SELECT count(*) male_num,
    AVG(gpa) avg_gpa
FROM user_profile
WHERE gender = 'male';
-- SELECT count(*) male_num,
--     AVG(gpa) avg_gpa
-- FROM user_profile
-- GROUP BY gender
-- HAVING gender = 'male';