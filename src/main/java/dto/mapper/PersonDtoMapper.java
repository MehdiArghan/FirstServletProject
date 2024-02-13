package dto.mapper;

import dto.PersonDto;
import entity.Person;

public class PersonDtoMapper {
    public PersonDto getPersonToPersonDto(Person person) {
        return PersonDto.builder()
                .firstName(person.getFirstName())
                .lastName(person.getLastName())
                .userName(person.getUserName())
                .password(person.getPassword())
                .vote(person.getVote())
                .build();
    }

    public Person getPersonDtoToPerson(PersonDto personDto) {
        return Person.builder()
                .firstName(personDto.getFirstName())
                .lastName(personDto.getLastName())
                .userName(personDto.getUserName())
                .password(personDto.getPassword())
                .vote(personDto.getVote())
                .build();
    }
}
