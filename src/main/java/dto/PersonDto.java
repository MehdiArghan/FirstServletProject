package dto;

import base.entity.BaseEntity;
import entity.Vote;
import jakarta.persistence.Column;
import jakarta.persistence.OneToOne;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@FieldDefaults(level = AccessLevel.PRIVATE)
@Builder
public class PersonDto extends BaseEntity<Long> {
    @NotNull(message = "firstName cannot be null")
    @NotEmpty(message = "firstName cannot be empty")
    @Column(nullable = false)
    String firstName;
    @NotNull(message = "lastName cannot be null")
    @NotEmpty(message = "lastName cannot be empty")
    @Column(nullable = false)
    String lastName;
    @NotNull(message = "userName cannot be null")
    @NotEmpty(message = "userName cannot be empty")
    @Column(nullable = false)
    String userName;
    @NotNull(message = "password cannot be null")
    @NotEmpty(message = "password cannot be empty")
    @Column(nullable = false)
    String password;
    @OneToOne
    Vote vote;
    public PersonDto(String firstName, String lastName, String userName, String password) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.userName = userName;
        this.password = password;
    }
}
