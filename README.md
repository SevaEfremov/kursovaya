# База данных для компьютерного клуба 

![image](https://github.com/SevaEfremov/kursovaya/blob/main/erd.png)

## Типовые запросы к БД
**Запрос 1**
```sql
SELECT c.idperson, c.first_name, c.middle_name, c.last_name, p.series_number, p.gender, p.name, p.surname, p.patronymic, p.date_birthday
FROM client c
JOIN pasport p ON c.idperson = p.client_idperson;
```

**Запрос 2**
```sql
SELECT r.id, r.date_to, r.date_after
FROM reservation r
JOIN client c ON r.user_id = c.user_id
WHERE c.first_name = 'Nikita' AND c.last_name = 'Nikolaev';
```

**Запрос 3**
```sql
SELECT comp.name, comp.rate, comp.description, comp.cost
FROM compucter comp
WHERE comp.reservation_id IS NULL;
```

**Запрос 4**
```sql
UPDATE user u
JOIN reservation r ON u.id = r.user_id
SET u.balance = u.balance - 50, u.play_hours = u.play_hours + 2
WHERE r.id = 1;
```

**Запрос 5**
```sql
SELECT *
FROM client_info;
```
