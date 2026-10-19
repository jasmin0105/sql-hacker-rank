/*
   Требуется:
  1. Соединить 5 таблиц: Contests -> Colleges -> Challenges -> (View_Stats и Submission_Stats).
  2. Для каждого конкурса (contest_id) вычислить общие суммы:
     - total_submissions (всего отправок)
     - total_accepted_submissions (успешных отправок)
     - total_views (всего просмотров)
     - total_unique_views (уникальных просмотров)
  3. Отфильтровать результаты: исключить конкурсы, у которых все четыре суммы равны 0.
  4. Отсортировать итоговую таблицу по возрастанию contest_id.
*/


-- БЛОК 1: Что выводим (SELECT) и связываем главные 3 таблицы (Конкурсы -> Колледжи -> Задачи)
SELECT 
    con.contest_id, 
    con.hacker_id, 
    con.name,
    SUM(ss.total_submissions),
    SUM(ss.total_accepted_submissions),
    SUM(vs.total_views),
    SUM(vs.total_unique_views)
FROM Contests con
JOIN Colleges col ON con.contest_id = col.contest_id
JOIN Challenges cha ON col.college_id = cha.college_id

-- БЛОК 2: Подключаем статистику отправок (ss) через подзапрос с предварительным суммированием
LEFT JOIN (
    SELECT challenge_id, 
           SUM(total_submissions) AS total_submissions, 
           SUM(total_accepted_submissions) AS total_accepted_submissions
    FROM Submission_Stats
    GROUP BY challenge_id
) ss ON cha.challenge_id = ss.challenge_id

-- БЛОК 3: Подключаем статистику просмотров (vs) через подзапрос с предварительным суммированием
LEFT JOIN (
    SELECT challenge_id, 
           SUM(total_views) AS total_views, 
           SUM(total_unique_views) AS total_unique_views
    FROM View_Stats
    GROUP BY challenge_id
) vs ON cha.challenge_id = vs.challenge_id

-- БЛОК 4: Группируем по конкурсам, отсекаем нулевые через HAVING и сортируем по ID
GROUP BY con.contest_id, con.hacker_id, con.name
HAVING SUM(ss.total_submissions) + 
       SUM(ss.total_accepted_submissions) + 
       SUM(vs.total_views) + 
       SUM(vs.total_unique_views) > 0
ORDER BY con.contest_id;
