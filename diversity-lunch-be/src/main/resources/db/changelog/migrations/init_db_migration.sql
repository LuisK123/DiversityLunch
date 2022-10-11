--liquibase formatted sql

--changeset sharwig:1
CREATE SEQUENCE IF NOT EXISTS "hibernate_sequence" AS BIGINT START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

-- changeset sharwig:2
CREATE TABLE IF NOT EXISTS "work_experience_entity" ("id" BIGSERIAL NOT NULL,
                                       "descriptor" VARCHAR(255),
                                       CONSTRAINT "pk_work_experience" PRIMARY KEY ("id")
);

-- changeset sharwig:3
CREATE TABLE IF NOT EXISTS "religion_entity" ("id" BIGSERIAL NOT NULL,
                                "descriptor" VARCHAR(255),
                                CONSTRAINT "pk_religion" PRIMARY KEY ("id")
);

-- changeset sharwig:4
CREATE TABLE IF NOT EXISTS "project_entity" ("id" BIGSERIAL NOT NULL,
                               "descriptor" VARCHAR(255),
                               CONSTRAINT "pk_project" PRIMARY KEY ("id")
);

-- changeset sharwig:5
CREATE TABLE IF NOT EXISTS "language_entity" ("id" BIGSERIAL NOT NULL,
                                "descriptor" VARCHAR(255),
                                CONSTRAINT "pk_language" PRIMARY KEY ("id")
);

-- changeset sharwig:6
CREATE TABLE IF NOT EXISTS "hobby_category_entity" ("id" BIGSERIAL NOT NULL,
                                      "descriptor" VARCHAR(255),
                                      CONSTRAINT "pk_hobby_category" PRIMARY KEY ("id")
);

-- changeset sharwig:7
CREATE TABLE IF NOT EXISTS "hobby_entity" ("id" BIGSERIAL NOT NULL,
                             "descriptor" VARCHAR(255),
                             "category_id" BIGINT,
                             CONSTRAINT "pk_hobby" PRIMARY KEY ("id"),
                             CONSTRAINT fk_hobby_category FOREIGN KEY ("category_id") REFERENCES hobby_category_entity("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- changeset sharwig:8
CREATE TABLE IF NOT EXISTS "gender_entity" ("id" BIGSERIAL NOT NULL,
                              "descriptor" VARCHAR(255),
                              CONSTRAINT "pk_gender" PRIMARY KEY ("id")
);

-- changeset sharwig:9
CREATE TABLE IF NOT EXISTS "education_entity" ("id" BIGSERIAL NOT NULL,
                                 "descriptor" VARCHAR(255),
                                 CONSTRAINT "pk_education" PRIMARY KEY ("id")
);

-- changeset sharwig:10
CREATE TABLE IF NOT EXISTS "diet_entity" ("id" BIGSERIAL NOT NULL,
                            "descriptor" VARCHAR(255),
                            CONSTRAINT "pk_diet" PRIMARY KEY ("id")
);

-- changeset sharwig:11
CREATE TABLE IF NOT EXISTS "country_entity" ("id" BIGSERIAL NOT NULL,
                               "descriptor" VARCHAR(255),
                               CONSTRAINT "pk_country" PRIMARY KEY ("id")
);

-- changeset sharwig:12
CREATE TABLE IF NOT EXISTS "profile_entity" ("id" BIGSERIAL NOT NULL,
                               "birth_year" INT,
                               "email" VARCHAR(255),
                               "name" VARCHAR(255),
                               "diet_id" BIGINT,
                               "education_id" BIGINT,
                               "gender_id" BIGINT,
                               "hobby_id" BIGINT,
                               "mother_tongue_id" BIGINT,
                               "origin_country_id" BIGINT,
                               "project_id" BIGINT,
                               "religion_id" BIGINT,
                               "work_experience_id" BIGINT,
                               CONSTRAINT "pk_profile" PRIMARY KEY ("id"),
                               CONSTRAINT fk_diet FOREIGN KEY ("diet_id") REFERENCES diet_entity("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
                               CONSTRAINT fk_education_id FOREIGN KEY ("education_id") REFERENCES education_entity("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
                               CONSTRAINT fk_gender FOREIGN KEY ("gender_id") REFERENCES gender_entity("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
                               CONSTRAINT fk_hobby FOREIGN KEY ("hobby_id") REFERENCES hobby_entity("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
                               CONSTRAINT fk_mother_tongue FOREIGN KEY ("mother_tongue_id") REFERENCES language_entity("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
                               CONSTRAINT fk_origin_country FOREIGN KEY ("origin_country_id") REFERENCES country_entity("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
                               CONSTRAINT fk_project FOREIGN KEY ("project_id") REFERENCES profile_entity("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
                               CONSTRAINT fk_religion FOREIGN KEY ("religion_id") REFERENCES religion_entity("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
                               CONSTRAINT fk_work_experience FOREIGN KEY ("work_experience_id") REFERENCES work_experience_entity("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

--changeset sharwig:13
CREATE TABLE IF NOT EXISTS "meeting_entity" ("id" BIGSERIAL NOT NULL,
                               "created_at" TIMESTAMP WITHOUT TIME ZONE NOT NULL,
                               "from_date_time" TIMESTAMP WITHOUT TIME ZONE NOT NULL,
                               "question" VARCHAR(255) NOT NULL,
                               "score" INTEGER NOT NULL,
                               "partner_id" BIGINT NOT NULL,
                               "proposer_id" BIGINT NOT NULL,
                               "ms_teams_meeting_id" VARCHAR(255) NOT NULL DEFAULT '',
                               CONSTRAINT "pk_meeting" PRIMARY KEY ("id"),
                               CONSTRAINT fk_meeting_partner FOREIGN KEY ("partner_id") REFERENCES profile_entity("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
                               CONSTRAINT fk_meeting_proposer FOREIGN KEY ("proposer_id") REFERENCES profile_entity("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- changeset sharwig:14
CREATE TABLE IF NOT EXISTS "meeting_proposal_entity" ("id" BIGSERIAL NOT NULL,
                                        "created_at" TIMESTAMP WITHOUT TIME ZONE NOT NULL,
                                        "matched" BOOLEAN NOT NULL,
                                        "proposed_date_time" TIMESTAMP WITHOUT TIME ZONE,
                                        "proposer_profile_id" BIGINT,
                                        CONSTRAINT "pk_meeting_proposal" PRIMARY KEY ("id"),
                                        CONSTRAINT fk_meeting_proposal_proposer FOREIGN KEY ("proposer_profile_id") REFERENCES profile_entity("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

--changeset sharwig:15
CREATE TABLE IF NOT EXISTS "account_entity" ("id" BIGSERIAL NOT NULL,
                               "unique_name" VARCHAR(255),
                               "profile_id" BIGINT,
                               "role" INTEGER NOT NULL DEFAULT 0,
                               CONSTRAINT "pk_account" PRIMARY KEY ("id"),
                               CONSTRAINT fk_profile FOREIGN KEY ("profile_id") REFERENCES profile_entity("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

--changeset tgohlisch:16
Insert Into country_entity(descriptor) values ('Algerien'),('Andorra'),('Angola'),('Antiguaundbarbuda'),('Argentinien'),('Armenien'),('Aserbaidschan'),('Australien'),('Bahamas'),('Bahrain'),('Bangladesch'),('Barbados'),('Belgien'),('Belize'),('Benin'),('Bhutan'),('Bolivien'),('Botswana'),('Botwana'),('Brasilien'),('Brunei'),('Bulgarien'),('Burkinafaso'),('Burundi'),('Chile'),('Chinarepubliktaiwan'),('Costarica'),('Deutschland'),('Dominica'),('Dominikanischerepublik'),('Dschibuti'),('Danemark'),('Ecuador'),('Elsalvador'),('Elfenbeinkuste'),('Eritrea'),('Estland'),('Eswatini'),('Finnland'),('Frankreich'),('Faroer'),('Gabun'),('Gambia'),('Georgien'),('Ghana'),('Ginea'),('Gineabissau'),('Grenada'),('Griechenland'),('Gronland'),('Guatemala'),('Guyana'),('Haiti'),('Honduras'),('Hongkong'),('Indien'),('Indonesien'),('Irak'),('Iran'),('Irland'),('Island'),('Israel'),('Italien'),('Jamaika'),('Japan'),('Jemen'),('Jordanien'),('Kambodscha'),('Kamerun'),('Kanada'),('Kapverde'),('Katar'),('Kenia'),('Kirgisistan'),('Kiribati'),('Kolumbien'),('Komoren'),('Kongo'),('Kosovo'),('Kroatien'),('Kuba'),('Kuwait'),('Laos'),('Lesotho'),('Lettland'),('Libanon'),('Liberia'),('Libyen'),('Liechtenstein'),('Litauen'),('Luxemburg'),('Macau'),('Madagaskar'),('Malawi'),('Malaysia'),('Malediven'),('Mali'),('Malta'),('Marokko'),('Mauretanien'),('Mauritius'),('Mexiko'),('Moldawien'),('Monaco'),('Mongolei'),('Mosambik'),('Motenegro'),('Myanmar'),('Namibia'),('Nepal'),('Neuseeland'),('Nicaragua'),('Niederlande'),('Niger'),('Nigeria'),('Nordkorea'),('Nordmazedonien'),('Norwegen'),('Oman'),('Pakistan'),('Palastina'),('Panama'),('Papuaneuguinea'),('Paraguay'),('Peru'),('Philippinen'),('Polen'),('Portugal'),('Republikmoldau'),('Ruanda'),('Rumanien'),('Russland'),('Sambia'),('Saudiarabien'),('Schweden'),('Schweiz'),('Senegal'),('Serbien'),('Seychellen'),('Sierraleone'),('Simbabwe'),('Singapur'),('Slowakei'),('Slowenien'),('Somalia'),('Spanien'),('Srilanka'),('Stkittsundnevis'),('Stlucia'),('Stvincentunddiegrenadinen'),('Sudan'),('Suriname'),('Syrien'),('Saotomeundprincipe'),('Sudafrika'),('Sudkorea'),('Sudsudan'),('Tadschikistan'),('Taiwan'),('Tansania'),('Thailand'),('Timorleste'),('Togo'),('Tonga'),('Trinidadundtobago'),('Tschad'),('Tschechien'),('Tunesien'),('Turkmenistan'),('Tuvalu'),('Turkei'),('Usa'),('Uganda'),('Ukraine'),('Ungarn'),('Uruguay'),('Usbekistan'),('Vatikanstadt'),('Venezuela'),('Vereinigtearabischeemirate'),('Vereinigteskonigreich'),('Vietnam'),('Volksrepublikchina'),('Wallisundfutuna'),('Weissrussland'),('Westsahara'),('Zentralafrikanischerepublik'),('Zypern'),('Agypten'),('Aquatorialguinea'),('Athiopien'),('Osterreich'),('Albanien'),('Bosnienundherzegowina'),('Kasachstan'),('Sanmarino');
Insert Into diet_entity(descriptor)  values ('Fleischesser'),('Vegetarier'),('Veganer'), ('Sonstige');
Insert Into education_entity(descriptor) values ('Ausbildung'), ('Studium'), ('Andere Wege');
Insert Into gender_entity(descriptor) values ('Männlich'), ('Weiblich'), ('Keine Angabe');
Insert Into hobby_category_entity(descriptor) values ('Sport'), ('Kreatives'), ('Natur'), ('Unterhaltung'), ('Kultur'), ('Sonstiges');
Insert Into language_entity(descriptor) values ('Akan'),('Amharisch'),('Arabisch'),('Aserbaidschanisch'),('Assamesisch'),('Awadhi'),('Belutschisch'),('Bengalisch'),('Bhojpuri'),('Bulgarisch'),('Burmesisch'),('Cebuano'),('Chhattisgarhi'),('Chichewa'),('Chittagonisch'),('Dakhini'),('Deutsch'),('Dhundari'),('Daenisch'),('Englisch'),('Estnisch'),('Finnisch'),('Franzoesisch'),('Fulfulde'),('Ganchinesisch'),('Griechisch'),('Guarani'),('Gujarati'),('Haitanischeskreol'),('Hakkachinesisch'),('Haryanvi'),('Hausa'),('Hiligaynon'),('Hindi'),('Hmong'),('Hocharabisch'),('Igbo'),('Ilokano'),('Indonesisch'),('Irisch'),('Italienisch'),('Japanisch'),('Javanisch'),('Jinchinesisch'),('Kannada'),('Kantonesisch'),('Kasachisch'),('Katalanisch'),('Khmer'),('Kinyarwanda'),('Kirundi'),('Konkani'),('Koreanisch'),('Kroatisch'),('Kurdisch'),('Lettisch'),('Litauisch'),('Maduresisch'),('Magahi'),('Maithili'),('Malagasy'),('Malaiisch'),('Malayalam'),('Maltesisch'),('Marathi'),('Marwari'),('Minanchinesisch'),('Minbeichinesisch'),('Mindongchinesisch'),('Moore'),('Nahuatl'),('Nepali'),('Niederlaendisch'),('Oriya'),('Oromo'),('Panjabi'),('Paschtunisch'),('Persisch'),('Polnisch'),('Portugiesisch'),('Quechua'),('Rumaenisch'),('Russisch'),('Saraiki'),('Schwedisch'),('Sindhi'),('Singhalesisch'),('Slowakisch'),('Slowenisch'),('Somali'),('Spanisch'),('Suaheli'),('Sundanesisch'),('Sylheti'),('Tagalog'),('Tamil'),('Telugu'),('Thai'),('Tschechisch'),('Turkmenisch'),('Tuerkisch'),('Uigurisch'),('Ukrainisch'),('Ungarisch'),('Urdu'),('Usbekisch'),('Vietnamesisch'),('Weissrussisch'),('Wuchinesisch'),('Xiangchinesisch'),('Yoruba'),('Zhuangchinesisch'),('Isixhosa'),('Isizulu'),('Aegyptischarabisch'),('Mandarinchinesisch');
Insert Into project_entity(descriptor) values ('Externes Projekt'), ('Internes Projekt');
Insert Into religion_entity(descriptor) values ('Judentum'),('Christentum'),('Islam'),('Hinduismus'),('Buddhismus'),('Sonstige'),('Kein Glaube');
Insert Into work_experience_entity(descriptor) values ('0-3 Jahre'), ('4-10 Jahre'),('über 10 Jahre');

WITH sport AS (SELECT id FROM hobby_category_entity WHERE hobby_category_entity.descriptor = 'Sport' LIMIT 1),
    kreatives AS (SELECT id FROM hobby_category_entity WHERE hobby_category_entity.descriptor = 'Kreatives' LIMIT 1),
    natur AS (SELECT id FROM hobby_category_entity WHERE hobby_category_entity.descriptor = 'Natur' LIMIT 1),
    unterhaltung AS (SELECT id FROM hobby_category_entity WHERE hobby_category_entity.descriptor = 'Unterhaltung' LIMIT 1),
    kultur AS (SELECT id FROM hobby_category_entity WHERE hobby_category_entity.descriptor = 'Kultur' LIMIT 1),
    sonstiges AS (SELECT id FROM hobby_category_entity WHERE hobby_category_entity.descriptor = 'Sonstiges' LIMIT 1)

INSERT INTO hobby_entity(descriptor, category_id) values ('Angeln', (SELECT * FROM natur)), ('Ballsport', (SELECT * FROM sport)), ('Bogenschießen', (SELECT * FROM sport)), ('Camping', (SELECT * FROM natur)),
    ('Dart', (SELECT * FROM sport)), ('DIY', (SELECT * FROM kreatives)), ('Filme', (SELECT * FROM unterhaltung)), ('Gaming', (SELECT * FROM unterhaltung)),
    ('Gärtnern', (SELECT * FROM natur)), ('Fotografie', (SELECT * FROM kreatives)), ('Gesellschaftsspiele', (SELECT * FROM kultur)),
    ('Jagen', (SELECT * FROM natur)), ('Joggen', (SELECT * FROM sport)), ('Kampfsport', (SELECT * FROM sport)), ('Klettern', (SELECT * FROM sport)),
    ('Kochen', (SELECT * FROM kultur)), ('Lesen', (SELECT * FROM unterhaltung)), ('Malen', (SELECT * FROM kreatives)), ('Musik', (SELECT * FROM unterhaltung)),
    ('Puzzlen', (SELECT * FROM unterhaltung)), ('Radsport', (SELECT * FROM sport)), ('Tanzen', (SELECT * FROM sport)), ('Theater', (SELECT * FROM kultur)),
    ('Wandern', (SELECT * FROM natur)), ('Yoga', (SELECT * FROM sport)), ('Sonstiges', (SELECT * FROM sonstiges));
