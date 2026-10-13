/*
Задача: Population Census (Подсчет количества городов)
Выведите количество городов в таблице CITY, у которых население больше 100 000 человек.
*/
SELECT COUNT(NAME) 
FROM CITY 
WHERE POPULATION > 100000;
