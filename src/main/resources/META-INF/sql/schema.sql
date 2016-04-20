CREATE TABLE PUBLIC.USER_PROFILE (
  ID   BIGINT      NOT NULL AUTO_INCREMENT,
  TYPE VARCHAR(30) NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE (TYPE)
);

CREATE TABLE PUBLIC.CATEGORY
(
  CATEGORY_ID INT AUTO_INCREMENT PRIMARY KEY,
  NAME        VARCHAR(40) NOT NULL
);

CREATE TABLE PUBLIC.PROFILE_PIC
(
  ID   INT AUTO_INCREMENT PRIMARY KEY,
  PATH VARCHAR(60) NOT NULL
);

CREATE TABLE PUBLIC.USER
(
  USER_ID    INT AUTO_INCREMENT PRIMARY KEY,
  USERNAME   VARCHAR(40) NOT NULL,
  PASSWORD   VARCHAR(40) NOT NULL,
  EMAIL      VARCHAR(60) NOT NULL,
  PICTURE_ID INT         NOT NULL,
  PROFILE_ID INT         NOT NULL,
  STATE      VARCHAR(30) NOT NULL,
  CONSTRAINT USER_PICTURE__FK FOREIGN KEY (PICTURE_ID)
  REFERENCES PROFILE_PIC (ID),
  CONSTRAINT USER_USER_PROFILE__FK FOREIGN KEY (PROFILE_ID)
  REFERENCES USER_PROFILE (ID)
);
CREATE UNIQUE INDEX "USER_USERNAME_uindex" ON PUBLIC.USER (USERNAME);

CREATE TABLE PUBLIC.QUESTION
(
  ID               INT AUTO_INCREMENT PRIMARY KEY,
  TITLE            VARCHAR(200) NOT NULL,
  DESCRIPTION      TEXT         NOT NULL,
  USER_ID          INT          NOT NULL,
  DATE_OF_QUESTION DATETIME     NOT NULL,
  CONSTRAINT QUESTION_USER_ID_FK FOREIGN KEY (USER_ID) REFERENCES USER (USER_ID)
);


CREATE TABLE PUBLIC.ANSWER
(
  ID             INT AUTO_INCREMENT PRIMARY KEY,
  USER_ID        INT      NOT NULL,
  QUESTION_ID    INT      NOT NULL,
  TEXT           TEXT     NOT NULL,
  DATE_OF_ANSWER DATETIME NOT NULL,
  CONSTRAINT ANSWER_QUESTION_ID_FK FOREIGN KEY (QUESTION_ID)
  REFERENCES QUESTION (ID),
  CONSTRAINT USER_ANSWER__FK FOREIGN KEY (USER_ID)
  REFERENCES USER (USER_ID)
);

-- CREATE TABLE PUBLIC.USER_ANSWERS
-- (
--   USER_ID   INT NOT NULL,
--   ANSWER_ID INT NOT NULL,
--   PRIMARY KEY (USER_ID, ANSWER_ID),
--   CONSTRAINT FK_USER_ANSWERS_1 FOREIGN KEY (USER_ID)
--   REFERENCES USER (USER_ID) ON DELETE CASCADE,
--   CONSTRAINT FK_USER_ANSWERS_2 FOREIGN KEY (ANSWER_ID)
--   REFERENCES ANSWER (ID)
-- );


CREATE TABLE PUBLIC.USER_USER_PROFILE (
  USER_ID         BIGINT NOT NULL,
  USER_PROFILE_ID BIGINT NOT NULL,
  PRIMARY KEY (USER_ID, USER_PROFILE_ID),
  CONSTRAINT FK_USER FOREIGN KEY (USER_ID) REFERENCES USER (USER_ID),
  CONSTRAINT FK_USER_PROFILE FOREIGN KEY (USER_PROFILE_ID) REFERENCES USER_PROFILE (ID)
);

CREATE TABLE PUBLIC.QUESTION_CATEGORY (
  QUESTION_ID INT NOT NULL,
  CATEGORY_ID INT NOT NULL,
  PRIMARY KEY (QUESTION_ID, CATEGORY_ID),
  CONSTRAINT FK_QUESTION FOREIGN KEY (QUESTION_ID) REFERENCES QUESTION (ID),
  CONSTRAINT FK_CATEGORY FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORY (CATEGORY_ID)
);




