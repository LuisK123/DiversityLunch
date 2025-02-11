package de.brockhausag.diversitylunchspringboot.profile.model.entities;

import de.brockhausag.diversitylunchspringboot.profile.utils.baseApi.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class HobbyEntity implements BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String descriptor;

    @ManyToOne
    private HobbyCategoryEntity category;


    @Override
    public int hashCode() {
        String hashString = this.id.toString() + this.descriptor + this.category.getDescriptor();
        return hashString.hashCode() ;
    }

    @Override
    public boolean equals(Object obj) {
        if ((obj == null) || (obj.getClass() != this.getClass())) {
            return false;
        }
        final HobbyEntity other = (HobbyEntity) obj;
        return other.id.equals(this.id) && other.descriptor.equals(this.descriptor) && other.category.equals(this.category);
    }
}
