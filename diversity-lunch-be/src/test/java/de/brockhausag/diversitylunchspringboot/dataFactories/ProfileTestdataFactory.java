package de.brockhausag.diversitylunchspringboot.dataFactories;

import de.brockhausag.diversitylunchspringboot.profile.model.dtos.ProfileDto;
import de.brockhausag.diversitylunchspringboot.profile.model.entities.ProfileEntity;

public class ProfileTestdataFactory {

    private static final int numberOfCompleteSets = 3;
    private static final Long[] ids = {666L, 1L,2L,3L};
    private static final String[] names = {"incomplete user", "first user", "second user", "third user"};
    private static final String[] emails = {"incomplete.mail@some.tdl", "first.mail@some.tld", "second.mail@some.tld", "third.mail@some.tld"};
    private static final int[] birthYears = {1901, 1957, 1930, 2001};


    private final  CountryTestDataFactory countryFactory = new CountryTestDataFactory();
    private final DietTestDataFactory dietFactory = new DietTestDataFactory();
    private final EducationTestDataFactory educationFactory = new EducationTestDataFactory();
    private final GenderTestDataFactory genderFactory = new GenderTestDataFactory();
    private final LanguageTestDataFactory languageFactory = new LanguageTestDataFactory();
    private final ProjectTestDataFactory projectFactory = new ProjectTestDataFactory();
    private final ReligionTestDataFactory religionFactory = new ReligionTestDataFactory();
    private final WorkExperienceTestDataFactory workExperienceFactory = new WorkExperienceTestDataFactory();
    private final HobbyTestDataFactory hobbyFactory = new HobbyTestDataFactory();

    public ProfileEntity buildEntity(int setNumber) {
        if ((setNumber >= 1) && (setNumber <= numberOfCompleteSets)){
            return new ProfileEntity(
                    ids[setNumber], names[setNumber], emails[setNumber], birthYears[setNumber],
                    countryFactory.buildEntity(setNumber),
                    dietFactory.buildEntity(setNumber),
                    educationFactory.buildEntity(setNumber),
                    genderFactory.buildEntity(setNumber),
                    languageFactory.buildEntity(setNumber),
                    projectFactory.buildEntity(setNumber),
                    religionFactory.buildEntity(setNumber),
                    workExperienceFactory.buildEntity(setNumber),
                    hobbyFactory.buildEntity(setNumber));
        }
        return new ProfileEntity(
                ids[1], names[1], emails[1], birthYears[1],
                countryFactory.buildEntity(1),
                dietFactory.buildEntity(1),
                educationFactory.buildEntity(1),
                genderFactory.buildEntity(1),
                languageFactory.buildEntity(1),
                projectFactory.buildEntity(1),
                religionFactory.buildEntity(1),
                workExperienceFactory.buildEntity(1),
                hobbyFactory.buildEntity(1));
    }

    public ProfileDto buildDto(int setNumber) {
        if ((setNumber >= 1) && (setNumber <= numberOfCompleteSets)){
            return new ProfileDto(
                    ids[setNumber], names[setNumber], emails[setNumber], birthYears[setNumber],
                    countryFactory.buildDto(setNumber),
                    dietFactory.buildDto(setNumber),
                    educationFactory.buildDto(setNumber),
                    genderFactory.buildDto(setNumber),
                    languageFactory.buildDto(setNumber),
                    projectFactory.buildDto(setNumber),
                    religionFactory.buildDto(setNumber),
                    workExperienceFactory.buildDto(setNumber),
                    hobbyFactory.buildDto(setNumber)
            );
        }
        return new ProfileDto(
                ids[1], names[1], emails[1], birthYears[1],
                countryFactory.buildDto(1),
                dietFactory.buildDto(1),
                educationFactory.buildDto(1),
                genderFactory.buildDto(1),
                languageFactory.buildDto(1),
                projectFactory.buildDto(1),
                religionFactory.buildDto(1),
                workExperienceFactory.buildDto(1),
                hobbyFactory.buildDto(1));
    }
}
