CREATE VIEW VIEW_USER_INFORMATION AS
SELECT U.user_id, U.first_name, U.last_name, U.year_of_birth, U.month_of_birth, U.day_of_birth, U.gender,
CC.city_name AS current_city,
CC.state_name AS current_state,
CC.country_name AS current_country,
HC.city_name AS hometown_city,
HC.state_name AS hometown_state,
HC.country_name AS hometown_country,
P.institution AS institution_name,
E.program_year AS,
P.concentration AS program_concentration,
P.degree AS program_degree
FROM USERS U
LEFT JOIN USER_CURRENT_CITY UCC ON U.user_id = UCC.user_id
LEFT JOIN CITIES CC ON UCC.current_city_id = CC.city_id
LEFT JOIN USER_HOMETOWN_CITIES UHC ON U.user_id = UHC.user_id
LEFT JOIN CITIES HC ON UHC.hometown_city_id = HC.city_id
LEFT JOIN EDUCATION E ON U.user_id = E.user_id
LEFT JOIN PROGRAMS P ON E.program_id = P.program_id;

CREATE VIEW VIEW_ARE_FRIENDS AS
SELECT FRIENDD.user1_id, FRIENDD.user2_id
FROM FRIENDS FRIENDD;
