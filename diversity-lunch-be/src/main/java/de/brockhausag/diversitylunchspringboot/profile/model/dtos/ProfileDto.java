package de.brockhausag.diversitylunchspringboot.profile.model.dtos;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;

import javax.validation.constraints.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@EqualsAndHashCode
@ToString
@Builder
public class ProfileDto {
    private Long id;
    @Schema(description = "name of user")
    @Size(min=2, max=50, message = "name must be between 2 and 50 chars long")
    private String name;
    @Schema(description = "e-mail of the user", example = "example.mail@brockhaus-ag.de")
    @Size(min = 3, max = 320)
    private String email;
    @Schema(description = "year of birth", example = "1999")
    @Min(value = 1900, message = "year of birth must be greater than or equal to 1900")
    @Max(value=2022, message = "year of birth must be smaller than or equal to 2022")
    private int birthYear;
    @NotNull
    private CountryDto originCountry;
    @NotNull
    private DietDto diet;
    @NotNull
    private EducationDto education;
    @NotNull
    private GenderDto gender;
    @NotNull
    private LanguageDto motherTongue;
    @NotNull
    private ProjectDto project;
    @NotNull
    private ReligionDto religion;
    @NotNull
    private WorkExperienceDto workExperience;
    @NotNull
    private HobbyDto hobby;
}
