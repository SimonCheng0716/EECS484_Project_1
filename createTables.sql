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

CREATE TABLE User_Current_Cities(
  user_id INTEGER PRIMARY KEY,
  current_city_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES Users,
  FOREIGN KEY (current_city_id) REFERENCES Cities
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
  sent_time TIMESTAMP NOT NULL,
  FOREIGN KEY (sener_id) REFERENCES Users,
  FOREIGN KEY (receiver_id) REFERENCES Users
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
  PRIMARY KEY (user_id, program_id),
  FOREIGN KEY (user_id) REFERENCES Users,
  FOREIGN KEY (program_id) REFERENCES Programs
);

CREATE TABLE User_Events(
  event_id INTEGER PRIMARY KEY,
  event_creator_id INTRGER NOT NULL,
  event_name VARCHAR2(100) NOT NULL,
  event_tagline VARCHAR2(100),
  event_description VARCHAR2(100),
  event_host VARCHAR2(100),
  event_type VARCHAR2(100),
  event_subtype VARCHAR2(100),
  event_address VARCHAR2(2000),
  event_city_id INTEGER NOT NULL,
  event_start_time TIMESTAMP,
  event_end_time TIMESTAMP,
  FOREIGN KEY (event_creater_id) REFERENCES Users,
  FOREIGN KEY (event_city_id) REFERENCES Cities
);

CREATE TABLE Participants(
  event_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  confirmation VARCHAR2(100) NOT NULL,
  CHECK (confirmation IN ('Attending', 'Unsure', 'Declines', 'Not_Replied')),
  PRIMARY KEY (event_id, user_id),
  FOREIGN KEY (event_id) REFERENCES User_Events,
  FOREIGN KEY (user_id) REFERENCES Users
);

CREATE TABLE Albums(
  album_id INTEGER PRIMARY KEY,
  album_owner_id INTEGER NOT NULL,
  album_name VARCHAR2(100) NOT NULL,
  album_created_time TIMESTAMP NOT NULL,
  album_modified_time TIMESTAMP,
  album_link VARCHAR2(200) NOT NULL,
  album_visibility VARCHAR2(100) NOT NULL,
  cover_photo_id INTEGER NOT NULL,
  FOREIGN KEY (album_owner_id) REFERENCES Users,
  FOREIGN KEY (cover_photo_id) REFERENCES Photos INITIALLY DEFERRED DEFERRABLE,
  CHECK (album_visibility IN ('Everyone', 'Friends', 'Friends_Of_Friends', 'Myself'))
);

-- notice
CREATE TABLE Photos(
  photo_id INTEGER PRIMARY KEY,
  album_id INTEGER NOT NULL,
  photo_caption VARCHAR2(100),
  photo_created_time TIMESTAMP NOT NULL,
  photo_modified_time TIMESTAMP,
  photo_link VARCHAR2(200) NOT NULL,
  FOREIGN KEY (album_id) REFERENCES Albums INITIALLY DEFERRED DEFERRABLE
)；

CREATE TABLE Tags(
  tag_photo_id INTEGER NOT NULL,
  tag_subject_id INTEGER NOT NULL,
  tag_created_time TIMESTAMP NOT NULL,
  tag_x INTEGER NOT NULL,
  tag_y INTEGER NOT NULL,
  PRIMARY KEY (tag_photo_id, tag_subject_id),
  FOREIGN KEY (tag_photo_id) REFERENCES Photos,
  FOREIGN KEY (tag_subject_id) REFERENCES Users
);

CREATE SEQUENCE City_Sequence
    START WITH 1
    INCREMENT BY 1;

CREATE TRIGGER ADD_CITY
    BEFORE INSERT ON CITIES
    FOR EACH ROW
    BEGIN
        SELECT CITY_SEQUENCE.NEXTVAL INTO :NEW.CITY_ID FROM DUAL;
    END;
/

CREATE SEQUENCE Program_Sequence
    START WITH 1
    INCREMENT BY 1;

CREATE TRIGGER ADD_PROGRAM
    BEFORE INSERT ON PROGRAMS
    FOR EACH ROW
    BEGIN
        SELECT PROGRAM_SEQUENCE.NEXTVAL INTO :NEW.PROGRAM_ID FROM DUAL;
    END;
/

CREATE TRIGGER Order_Friend_Pairs
    BEFORE INSERT ON FRIENDS
    FOR EACH ROW
        DECLARE temp INTEGER;
        BEGIN
            IF :NEW.USER1_ID > :NEW.USER2_ID THEN
                temp := :NEW.USER2_ID;
                :NEW.USER2_ID := :NEW.USER1_ID;
                :NEW.USER1_ID := temp;
            END IF;
        END;
/
















