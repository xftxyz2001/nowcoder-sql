-- 题解
-- 限定条件：第二天再来。
-- 解法1：表里的数据可以看作是全部第一天来刷题了的，那么我们需要构造出第二天来了的字段，因此可以考虑用left join把第二天来了的拼起来，限定第二天来了的可以用date_add(date1, interval 1 day)=date2筛选，并用device_id限定是同一个用户。
-- 解法2：用lead函数将同一用户连续两天的记录拼接起来。先按用户分组partition by device_id，再按日期升序排序order by date，再两两拼接（最后一个默认和null拼接），即lead(date) over (partition by device_id order by date)
-- 平均概率：
-- 解法1：可以count(date1)得到左表全部的date记录数作为分母，count(date2)得到右表关联上了的date记录数作为分子，相除即可得到平均概率
-- 解法2：检查date2和date1的日期差是不是为1，是则为1（次日留存了），否则为0（次日未留存），取avg即可得平均概率。
-- 1
SELECT COUNT(date2) / COUNT(date1) AS avg_ret
FROM (
        SELECT DISTINCT qpd.device_id,
            qpd.date AS date1,
            uniq_id_date.date AS date2
        FROM question_practice_detail AS qpd
            LEFT JOIN(
                SELECT DISTINCT device_id,
                    DATE
                FROM question_practice_detail
            ) AS uniq_id_date ON qpd.device_id = uniq_id_date.device_id
            AND date_add(qpd.date, interval 1 day) = uniq_id_date.date
    ) AS id_last_next_date;
-- 2
SELECT AVG(IF(datediff(date2, date1) = 1, 1, 0)) AS avg_ret
FROM (
        SELECT DISTINCT device_id,
            date AS DATE1,
            LEAD(date) OVER (
                PARTITION BY device_id
                ORDER BY date
            ) AS date2
        FROM (
                SELECT DISTINCT device_id,
                    date
                FROM question_practice_detail
            ) AS uniq_id_date
    ) AS id_last_next_date;