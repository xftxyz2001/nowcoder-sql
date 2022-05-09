SELECT "25岁以下",
    count(*)
FROM user_profile
WHERE age IS NULL
    OR age < 25
UNION
SELECT "25岁及以上",
    count(*)
FROM user_profile
WHERE age >= 25;