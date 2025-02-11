package de.brockhausag.diversitylunchspringboot.profile.utils;

import java.util.List;

public interface Mapper<DtoType, EntityType> {

    DtoType entityToDto(EntityType entity);

    EntityType dtoToEntity(DtoType dto);

    List<DtoType> entityToDto(List<EntityType> entities);

    List<EntityType> dtoToEntity(List<DtoType> dtos);
}
