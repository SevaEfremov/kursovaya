CREATE VIEW client_info AS
SELECT 
    c.idperson AS client_id,
    c.first_name AS client_first_name,
    c.middle_name AS client_middle_name,
    c.last_name AS client_last_name,
    p.series_number AS passport_series_number,
    p.gender AS passport_gender,
    p.name AS passport_name,
    p.surname AS passport_surname,
    p.patronymic AS passport_patronymic,
    p.date_birthday AS passport_date_of_birth,
    r.date_to AS reservation_date_to,
    r.date_after AS reservation_date_after,
    comp.name AS computer_name,
    comp.rate AS computer_rate,
    comp.cost AS computer_cost
FROM client c
JOIN pasport p ON c.idperson = p.client_idperson
JOIN reservation r ON c.user_id = r.user_id
JOIN compucter comp ON r.id = comp.reservation_id;
