insert into "USER" (username, password, email, picture_id, role_id)
values ('Matthew', '123', 'matthew@mail.ru', 1, 2);
insert into "USER" (username, password, email, picture_id, role_id)
values ('Sam', '123', 'sam@mail.ru', 2, 2);
insert into "USER" (username, password, email, picture_id, role_id)
values ('Chester', '123', 'chester@mail.ru', 3, 2);

insert into PROFILE_PIC (ID, PATH)
values ('1', 'C:////');
insert into PROFILE_PIC (ID, PATH)
values ('2', 'C:////');
insert into PROFILE_PIC (ID, PATH)
values ('3', 'C:////');

insert into CATEGORY (ID, NAME)
values ('1', 'clothes');
insert into CATEGORY (ID, NAME)
values ('2', 'electronics');

insert into ANSWER (USER_ID, QUESTION_ID, TEXT, DATE_OF_ANSWER)
values ('1', '1', 'Question 1', '1964-02-28');
insert into ANSWER (USER_ID, QUESTION_ID, TEXT, DATE_OF_ANSWER)
values ('2', '3', 'Question 2', '1999-01-23');
insert into ANSWER (USER_ID, QUESTION_ID, TEXT, DATE_OF_ANSWER)
values ('', '', '', '');
insert into ANSWER (USER_ID, QUESTION_ID, TEXT, DATE_OF_ANSWER)
values ('', '', '', '');

insert into QUESTION (TITLE, DESCRIPTION, CATEGORY_ID, USER_ID, DATE_OF_QUESTION)
values ('Question title 1', 'question description 1', '1', '1', '1964-02-27');
insert into QUESTION (TITLE, DESCRIPTION, CATEGORY_ID, USER_ID, DATE_OF_QUESTION)
values ('Question title 2', 'question description 2', '2', '2', '1999-01-22');
insert into QUESTION (TITLE, DESCRIPTION, CATEGORY_ID, USER_ID, DATE_OF_QUESTION)
values ('Question title 3', 'question description 3', '1', '3', '2015-08-15');
insert into QUESTION (TITLE, DESCRIPTION, CATEGORY_ID, USER_ID, DATE_OF_QUESTION)
values ('Question title 4', 'question description 4', '2', '2', '2016-04-15');

insert into ROLE (ID, ROLE_NAME)
values ('1', 'quest');
insert into ROLE (ID, ROLE_NAME)
values ('2', 'user');

