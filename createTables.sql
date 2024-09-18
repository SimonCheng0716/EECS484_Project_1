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
  user_id INTEGER NOT NULL,
  program_id INTEGER NOT NULL,
  program_year INTEGER NOT NULL,
  PRIMARY KEY(user_id, program_id),
  FOREIGN KEY(user_id) REFERENCES Users,
  FOREIGN KEY(program_id) REFERENCES Programs
)

CREATE TABLE User_Events(
  event_id INTEGER PRIMARY KEY,
  event_creator_id INTRGER NOT NULL,
  event_name VARCHAR2(100) NOT NULL,
  event_tagline VARCHAR2(100),
  event_description VARCHAR2(100),
  event_host VARCHAR2(100),
  event_type VARCHAR2(100),
  event_subtype VARCHAR2(100),
  event_address VARCHAR2(100),
  event_city_id INTEGER NOT NULL,
  event_start_time TIMESTAMP,
  event_end_time TIMESTAMP,
  FOREIGN KEY(event_creater_id) REFERENCES Users,
  FOREIGN KEY(event_city_id) REFERENCES Cities
)
















