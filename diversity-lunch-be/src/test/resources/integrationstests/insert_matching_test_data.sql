WITH algerien AS (SELECT id FROM  country_entity WHERE country_entity.descriptor='Algerien' LIMIT 1),
    andorra AS (SELECT id FROM  country_entity WHERE country_entity.descriptor='Andorra' LIMIT 1),
    meat AS (SELECT id FROM  diet_entity WHERE diet_entity.descriptor='Fleischesser' LIMIT 1),
    vegan AS (SELECT id FROM  diet_entity WHERE diet_entity.descriptor='Veganer' LIMIT 1),
    study AS (SELECT id FROM  education_entity WHERE education_entity.descriptor='Studium' LIMIT 1),
    training AS (SELECT id FROM  education_entity WHERE education_entity.descriptor='Ausbildung' LIMIT 1),
    male AS (SELECT id FROM  gender_entity WHERE gender_entity.descriptor='Männlich' LIMIT 1),
    female AS (SELECT id FROM  gender_entity WHERE gender_entity.descriptor='Weiblich' LIMIT 1),
    english AS (SELECT id FROM  language_entity WHERE language_entity.descriptor='Englisch' LIMIT 1),
    german AS (SELECT id FROM  language_entity WHERE language_entity.descriptor='Deutsch' LIMIT 1),
    externProject AS (SELECT id FROM project_entity WHERE project_entity.descriptor='Externes Projekt' LIMIT 1),
    internProject  AS (SELECT id FROM project_entity WHERE project_entity.descriptor='Externes Projekt' LIMIT 1),
    jewish AS (SELECT id FROM  religion_entity WHERE religion_entity.descriptor='Judentum' LIMIT 1),
    christian AS (SELECT id FROM  religion_entity WHERE religion_entity.descriptor='Christentum' LIMIT 1),
    lowExperience AS (SELECT id FROM  work_experience_entity WHERE work_experience_entity.descriptor='0-3 Jahre' LIMIT 1),
    cooking AS (SELECT id FROM  hobby_entity WHERE hobby_entity.descriptor='Kochen' LIMIT 1),
    gaming AS (SELECT id FROM  hobby_entity WHERE hobby_entity.descriptor='Gaming' LIMIT 1)

INSERT INTO profile_entity VALUES (1, 1998, 'first.profile@some.tdl', 'first', (SELECT * FROM meat), (SELECT * FROM study), (SELECT * FROM male), (SELECT * FROM cooking), (SELECT * FROM german), (SELECT * FROM algerien), (SELECT * FROM internProject), (SELECT * FROM jewish),(SELECT * FROM lowExperience) ),
    (2, 1999, 'second.profile@some.tdl', 'second', (SELECT * FROM vegan), (SELECT * FROM study), (SELECT * FROM male), (SELECT * FROM cooking), (SELECT * FROM german), (SELECT * FROM algerien), (SELECT * FROM internProject), (SELECT * FROM jewish),(SELECT * FROM lowExperience) ),
    (3, 1990, 'third.profile@some.tdl', 'third', (SELECT * FROM vegan), (SELECT * FROM training), (SELECT * FROM female), (SELECT * FROM cooking), (SELECT * FROM german), (SELECT * FROM algerien), (SELECT * FROM internProject), (SELECT * FROM jewish),(SELECT * FROM lowExperience) ),
    (4, 1974, 'fourth.profile@some.tdl', 'fourth', (SELECT * FROM vegan), (SELECT * FROM training), (SELECT * FROM female), (SELECT * FROM gaming), (SELECT * FROM english), (SELECT * FROM andorra), (SELECT * FROM externProject), (SELECT * FROM christian),(SELECT * FROM lowExperience) ),
    (5, 1998, 'copyOfFirst.profile@some.tdl', 'copyOfFirst', (SELECT * FROM meat), (SELECT * FROM study), (SELECT * FROM male), (SELECT * FROM cooking), (SELECT * FROM german), (SELECT * FROM algerien), (SELECT * FROM internProject), (SELECT * FROM jewish),(SELECT * FROM lowExperience) );


/*Score under 9, matching algorithm at date 26.09.2022 gives a score of 4*/
INSERT INTO meeting_proposal_entity VALUES (1, '2022-03-16 16:23:53.786276', false, '2022-03-18 12:30:00.000000', 1),
            (2, '2022-03-16 16:23:53.786276', false, '2022-03-18 12:30:00.000000', 2);

/*Score between 9 and 21, matching algorithm at date 26.09.2022 gives a score of 11*/
INSERT INTO meeting_proposal_entity VALUES (3, '2022-03-16 16:23:53.786276', false, '2022-03-18 11:30:00.000000', 1),
         (4, '2022-03-16 16:23:53.786276', false, '2022-03-18 11:30:00.000000', 3);

/*Score over 21, matching algorithm at date 26.09.2022 gives a score of 25*/
INSERT INTO meeting_proposal_entity VALUES (5, '2022-03-16 16:23:53.786276', false, '2022-04-05 13:30:00.000000', 1),
    (6, '2022-03-16 16:23:53.786276', false, '2022-04-05 13:30:00.000000', 4);

/*unmatched*/
INSERT INTO meeting_proposal_entity VALUES (7, '2022-03-16 16:23:53.786276', false, '2022-04-05 13:30:00.000000', 5);