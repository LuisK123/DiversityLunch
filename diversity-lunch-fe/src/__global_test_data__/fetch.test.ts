import { CATEGORY_ENDPOINT } from '../data/category/fetch-category';
import {
    categoryData,
    countryData,
    dietData,
    educationData,
    genderData, hobbyData,
    languageData,
    projectData,
    religionData,
    workExperienceData,
} from './data.test';
import { COUNTRY_ENDPOINT } from '../data/country/fetch-country';
import { DIET_ENDPOINT } from '../data/diet/fetch-diet';
import { EDUCATION_ENDPOINT } from '../data/education/fetch-education';
import { GENDER_ENDPOINT } from '../data/gender/fetch-gender';
import { LANGUAGE_ENDPOINT } from '../data/language/language-fetch';
import { PROJECT_ENDPOINT } from '../data/project/project-fetch';
import { RELIGION_ENDPOINT } from '../data/religion/religion-fetch';
import { WORK_EXPERIENCE_ENDPOINT } from '../data/work-experience/work-experience-fetch';
import { HOBBY_ENDPOINT } from '../data/hobby/fetch-hobby';

export const mockedFetchGet = async (url: string) => {
    if (url.includes(CATEGORY_ENDPOINT)) {
        return new Response(JSON.stringify(categoryData));
    }
    if (url.includes(COUNTRY_ENDPOINT)) {
        return new Response(JSON.stringify(countryData));
    }
    if (url.includes(DIET_ENDPOINT)) {
        return new Response(JSON.stringify(dietData));
    }
    if (url.includes(EDUCATION_ENDPOINT)) {
        return new Response(JSON.stringify(educationData));
    }
    if (url.includes(GENDER_ENDPOINT)) {
        return new Response(JSON.stringify(genderData));
    }
    if (url.includes(LANGUAGE_ENDPOINT)) {
        return new Response(JSON.stringify(languageData));
    }
    if (url.includes(PROJECT_ENDPOINT)) {
        return new Response(JSON.stringify(projectData));
    }
    if (url.includes(RELIGION_ENDPOINT)) {
        return new Response(JSON.stringify(religionData));
    }
    if (url.includes(WORK_EXPERIENCE_ENDPOINT)) {
        return new Response(JSON.stringify(workExperienceData));
    }
    if (url.includes(HOBBY_ENDPOINT)) {
        return new Response(JSON.stringify(hobbyData));
    }
    return new Response('');
};
