CREATE TABLE PUBLIC.USER
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    USERNAME VARCHAR(40) NOT NULL,
    PASSWORD VARCHAR(40) NOT NULL,
    EMAIL VARCHAR(60) NOT NULL,
    PICTURE_ID INT NOT NULL,
    ROLE_ID INT NOT NULL,
    CONSTRAINT USER_PICTURE__FK FOREIGN KEY (PICTURE_ID)
    REFERENCES PROFILE_PIC (ID),
    CONSTRAINT USER_ROLE__FK FOREIGN KEY (ROLE_ID)
    REFERENCES ROLE(ID)
);
CREATE UNIQUE INDEX "USER_USERNAME_uindex" ON PUBLIC.USER (USERNAME);

CREATE TABLE PUBLIC.QUESTION
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    TITLE VARCHAR(200) NOT NULL,
    DESCRIPTION TEXT NOT NULL,
    CATEGORY_ID INT NOT NULL,
    USER_ID INT NOT NULL,
    DATE_OF_QUESTION DATETIME NOT NULL,
    CONSTRAINT QUESTION_USER_ID_FK FOREIGN KEY (USER_ID)
    REFERENCES USER(ID),
    CONSTRAINT QUESTION_CATEGORY_ID_FK FOREIGN KEY (CATEGORY_ID)
    REFERENCES CATEGORY(ID)
);

CREATE TABLE PUBLIC.CATEGORY
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NAME VARCHAR(40) NOT NULL
);

CREATE TABLE PUBLIC.ANSWER
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    USER_ID INT NOT NULL,
    QUESTION_ID INT NOT NULL,
    TEXT TEXT NOT NULL,
    DATE_OF_ANSWER DATETIME NOT NULL,
    CONSTRAINT ANSWER_QUESTION_ID_FK FOREIGN KEY (QUESTION_ID)
    REFERENCES QUESTION(ID);
);

CREATE TABLE PUBLIC.PICTURE
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    PATH INT NOT NULL
);

CREATE TABLE PUBLIC.ROLE
(
    ID INT PRIMARY KEY NOT NULL,
    ROLE_NAME VARCHAR(60) NOT NULL
);
CREATE UNIQUE INDEX "ROLE_ROLE_NAME_uindex" ON PUBLIC.ROLE (ROLE_NAME);