# Решения задач по SQL


## О проекте
Здесь собраны решения практических задач по SQL с платформы HackerRank.

### Пример кода
```sql
SELECT DISTINCT CITY 
FROM STATION 
WHERE SUBSTR(CITY, 1, 1) IN ('A', 'E', 'I', 'O', 'U');
