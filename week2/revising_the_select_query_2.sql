/*
Задача: Revising the Select Query II
Выведите поле NAME для всех американских городов из таблицы CITY,
население которых превышает 120 000 человек. Код страны — USA.
*/

SELECT NAME 
FROM CITY 
WHERE POPULATION > 120000 
  AND COUNTRYCODE = 'USA';
