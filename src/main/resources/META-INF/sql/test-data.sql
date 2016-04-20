/* Populate USER_PROFILE Table */
insert into USER_PROFILE(type)
values ('USER');

insert into PROFILE_PIC (ID, PATH)
values (1, 'C:////');
insert into PROFILE_PIC (ID, PATH)
values (2, 'C:////');
insert into PROFILE_PIC (ID, PATH)
values (3, 'C:////');

insert into CATEGORY (CATEGORY_ID, NAME)
values (1, 'clothes');
insert into CATEGORY (CATEGORY_ID, NAME)
values (2, 'electronics');

insert into "USER" (username, password, email, picture_id, profile_id, state)
values ('Matthew', '123', 'matthew@mail.ru', 1, 1, 'Active');
insert into "USER" (username, password, email, picture_id, profile_id, state)
values ('Sam', '123', 'sam@mail.ru', 2, 1, 'Active');
insert into "USER" (username, password, email, picture_id, profile_id, state)
values ('Chester', '123', 'chester@mail.ru', 3, 1, 'Active');

insert into QUESTION (TITLE, DESCRIPTION, USER_ID, DATE_OF_QUESTION)
values ('What size have your T-shirt?', 'I will help you to pick one. ', 1, '1964-02-27');
insert into QUESTION (TITLE, DESCRIPTION, USER_ID, DATE_OF_QUESTION)
values ('Have anybody brought my clothes to washing?', 'I cant find them' , 2, '1999-01-22');
insert into QUESTION (TITLE, DESCRIPTION, USER_ID, DATE_OF_QUESTION)
values ('Didnt receive my iwatch, have you lost them?', 'I have been waiting for ages, whats wrong?', 1, '2015-08-15');
insert into QUESTION (TITLE, DESCRIPTION, USER_ID, DATE_OF_QUESTION)
values ('Can you advice my right color jeans to my coat?', 'I doubt to choose blue coat', 2, '2016-04-15');

insert into ANSWER (USER_ID, QUESTION_ID, TEXT, DATE_OF_ANSWER)
values (1, 1, 'This text is answer for 1th question', '1964-02-28');
insert into ANSWER (USER_ID, QUESTION_ID, TEXT, DATE_OF_ANSWER)
values (2, 3, 'This text is answer for 3th question', '1999-01-23');
insert into ANSWER (USER_ID, QUESTION_ID, TEXT, DATE_OF_ANSWER)
values (3, 4, 'This text is answer for 4th question', '2016-04-19');
insert into ANSWER (USER_ID, QUESTION_ID, TEXT, DATE_OF_ANSWER)
values (2, 1, 'This text is answer for 1th question', '2016-04-19');
insert into ANSWER (USER_ID, QUESTION_ID, TEXT, DATE_OF_ANSWER)
values (3, 3, 'This text is answer for 3th question', '2016-04-09');

-- insert into USER_ANSWERS (USER_ID, ANSWER_ID)
-- values (1, 2);
-- insert into USER_ANSWERS (USER_ID, ANSWER_ID)
-- values (2, 1);
-- insert into USER_ANSWERS (USER_ID, ANSWER_ID)
-- values (3, 3);


/* Populate JOIN Table */
insert into USER_USER_PROFILE (user_id, user_profile_id)
  select user.USER_ID, profile.ID from user user, USER_PROFILE profile
  where user.username='Matthew' and profile.type='USER';

insert into USER_USER_PROFILE (user_id, user_profile_id)
  select user.USER_ID, profile.ID from USER user, USER_PROFILE profile
  where user.username='Sam' and profile.type='USER';

insert into USER_USER_PROFILE (user_id, user_profile_id)
  select user.USER_ID, profile.ID from USER user, USER_PROFILE profile
  where user.username='Chester' and profile.type='USER';

insert into QUESTION_CATEGORY (QUESTION_ID, CATEGORY_ID)
values (1, 1);
insert into QUESTION_CATEGORY (QUESTION_ID, CATEGORY_ID)
values (1, 2);
insert into QUESTION_CATEGORY (QUESTION_ID, CATEGORY_ID)
values (2, 1);
insert into QUESTION_CATEGORY (QUESTION_ID, CATEGORY_ID)
values (3, 2);
insert into QUESTION_CATEGORY (QUESTION_ID, CATEGORY_ID)
values (4, 1);
insert into QUESTION_CATEGORY (QUESTION_ID, CATEGORY_ID)
values (4, 2);