CREATE TABLE Users(
  user_id INTEGER PRIMARY KEY,
  first_name VARCHAR2(100) NOT NULL,
  last_name VARCHAR2(100) NOT NULL,
  year_of_birth INTEGER,
  month_of_birth INTEGER,
  day_of_birth INTEGER,
  gender VARCHAR2(100)
);

CREATE TABLE Friends(
  user1_id INTEGER NOT NULL,
  user2_id INTEGER NOT NULL,
  PRIMARY KEY (user1_id, user2_id),
  FOREIGN KEY (user1_id) REFERENCES Users,
  FOREIGN KEY (user2_id) REFERENCES Users,
  CHECK (user1_id != user2_id)
);

CREATE TABLE Cities(
  city_id INTEGER PRIMARY KEY,
  city_name VARCHAR2(100) NOT NULL,
  state_name VARCHAR2(100) NOT NULL,
  country_name  VARCHAR2(100) NOT NULL,
  CONSTRAINT cities_unique UNIQUE (city_name, state_name, country_name)
);

CREATE TABLE User_Hometown_Cities(
  user_id INTEGER PRIMARY KEY,
  hometown_city_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES Users,
  FOREIGN KEY (hometown_city_id) REFERENCES Cities
);

CREATE TABLE Messages(
  message_id INTEGER PRIMARY KEY,
  sender_id INTEGER NOT NULL,
  receiver_id INTEGER NOT NULL,
  message_content VARCHAR2(2000) NOT NULL,
  sent_time TIMESTAMP NOT NULL 
);

CREATE TABLE Programs(
  program_id INTEGER PRIMARY KEY,
  institution VARCHAR2(100) NOT NULL,
  concentration VARCHAR2(100) NOT NULL,
  degree VARCHAR2(100) NOT NULL,
  CONSTRAINT programs_unique UNIQUE (institution, concentration, degree)
);

CREATE TABLE Education(
  user_id INTEGER PRIMARY KEY,
  program_id INTEGER NOT NULL,
  program_year INTEGER NOT NULL,
  FORGIEN
)

CREATE TABLE User_Events(
  event_id INTEGER PRIMARY KEY,
  event_creator_id
)
















