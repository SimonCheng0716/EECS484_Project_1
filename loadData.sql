INSERT INTO Users(
    user_id, first_name, last_name, year_of_birth, month_of_birth, day_of_birth, gender
)
SELECT DISTINCT user_id, first_name, last_name, year_of_birth, month_of_birth, day_of_birth, gender
FROM project1.Public_User_Information;

INSERT INTO Cities(
    city_name, state_name, country_name
)
SELECT DISTINCT current_city, current_state, current_country
FROM project1.Public_User_Information

INSERT INTO Cities(
    city_name, state_name, country_name
)
SELECT DISTINCT hometown_city, hometown_state, hometown_country
FROM project1.Public_User_Information


