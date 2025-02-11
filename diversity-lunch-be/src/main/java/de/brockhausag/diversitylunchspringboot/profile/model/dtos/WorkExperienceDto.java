package de.brockhausag.diversitylunchspringboot.profile.model.dtos;

import de.brockhausag.diversitylunchspringboot.profile.utils.baseApi.BaseDto;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@EqualsAndHashCode
public class WorkExperienceDto implements BaseDto {
    private Long id;

    @Schema(description = "Your workExperience in years", example = "2 Jahre")
    @Size(min=1, max=255, message = "workExperience must be between 5 and 255 chars long")
    @NotNull
    @NotBlank
    private String descriptor;
}
