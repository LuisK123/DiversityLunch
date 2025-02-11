package de.brockhausag.diversitylunchspringboot.match.utils;

import de.brockhausag.diversitylunchspringboot.meeting.model.Category;
import de.brockhausag.diversitylunchspringboot.profile.model.entities.ProfileEntity;
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Slf4j
@UtilityClass
public class MatchingUtils {

    private static final Random random = new Random();


    public ScoreAndCategory getCurrentScore(ProfileEntity profile1, ProfileEntity profile2) {
        List<Category> categories = new ArrayList<>();
        int currentScore = 0;
        //GeschlechtPunkte
        currentScore += compareProfileAttr(categories, profile1.getGender().getDescriptor(), profile2.getGender().getDescriptor(), Category.GENDER);
        //KundePunkte
        currentScore += compareProfileAttr(categories, profile1.getProject().getDescriptor(), profile2.getProject().getDescriptor(), Category.CUSTOMER);
        //HerkunftslandPunkte
        currentScore += compareProfileAttr(categories, profile1.getOriginCountry().getDescriptor(), profile2.getOriginCountry().getDescriptor(), Category.COUNTRY_OF_ORIGIN);
        //MuttersprachePunkte
        currentScore += compareProfileAttr(categories, profile1.getMotherTongue().getDescriptor(), profile2.getMotherTongue().getDescriptor(), Category.MOTHER_TONGUE);
        //HobbyPunkte
        currentScore += compareProfileAttr(categories, profile1.getHobby().getCategory().getDescriptor(), profile2.getHobby().getCategory().getDescriptor(), Category.HOBBY);
        //ReligionsPunkte
        currentScore += compareProfileAttr(categories, profile1.getReligion().getDescriptor(), profile2.getReligion().getDescriptor(), Category.RELIGION);
        //BildungswegPunkte
        currentScore += compareProfileAttr(categories, profile1.getEducation().getDescriptor(), profile2.getEducation().getDescriptor(), Category.EDUCATION);
        //ErnährungsweisePunkte
        currentScore += compareProfileAttr(categories, profile1.getDiet().getDescriptor(), profile2.getDiet().getDescriptor(), Category.DIET);

        currentScore = getScoreAndAddCategoriesForBirthYearAndWorkExperience(currentScore, categories, profile1, profile2);

        int randomIndex = random.nextInt(categories.size());

        return new ScoreAndCategory(currentScore, categories.get(randomIndex));
    }

    private int getScoreAndAddCategoriesForBirthYearAndWorkExperience(int score, List<Category> categories, ProfileEntity profile1, ProfileEntity profile2) {
        int scoreFromBirthYear = compareBirthYear(profile1, profile2);
        int scoreFromWorkExperience = compareWorkExperience(profile1, profile2);

        if (scoreFromBirthYear == 3) {
            categories.add(Category.AGE);
        }
        if (scoreFromWorkExperience == 3) {
            categories.add(Category.WORK_EXPERIENCE);
        }
        if (score == 0) {
            if (scoreFromBirthYear == 2 && scoreFromWorkExperience < 3) {
                categories.add(Category.AGE);
            }
            if (scoreFromBirthYear == 1 && scoreFromWorkExperience < 2) {
                categories.add(Category.AGE);
            }
            if (scoreFromWorkExperience == 2 && scoreFromBirthYear < 3) {
                categories.add(Category.WORK_EXPERIENCE);
            }
            if (scoreFromWorkExperience == 1 && scoreFromBirthYear < 2) {
                categories.add(Category.WORK_EXPERIENCE);
            }
        }
        //GeburtsjahrPunkte
        score += scoreFromBirthYear;
        //BerufserfahrungPunkte
        score += scoreFromWorkExperience;
        return score;
    }

    private int compareWorkExperience(ProfileEntity profile1, ProfileEntity profile2) {
        int currentScore;
        if (profile1.getWorkExperience().getDescriptor().equals(profile2.getWorkExperience().getDescriptor())) {
            currentScore = 1;
        } else if ((profile1.getWorkExperience().getDescriptor().equals("low experience")
                && profile2.getWorkExperience().getDescriptor().equals("high experience"))
                || (profile1.getWorkExperience().getDescriptor().equals("high experience")
                && profile2.getWorkExperience().getDescriptor().equals("low experience"))) {
            currentScore = 3;
        } else {
            currentScore = 2;
        }
        return currentScore;
    }

    private int compareBirthYear(ProfileEntity profile1, ProfileEntity profile2) {
        int currentScore = 0;
        int i = Math.abs(profile1.getBirthYear() - profile2.getBirthYear());
        if (i > 3 && i <= 10) {
            currentScore = 1;
        } else if ((i < 20) && (i > 10)) {
            currentScore = 2;
        } else if (i >= 20) {
            currentScore = 3;
        }
        return currentScore;
    }

    private int compareProfileAttr(List<Category> categories, String attr1, String attr2, Category category) {
        if (!attr1.equals(attr2)) {
            categories.add(category);
            return 3;
        }
        return 0;
    }
}
