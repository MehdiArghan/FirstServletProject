package controller.signup;

import base.repository.util.HibernateUtil;
import dto.PersonDto;
import dto.mapper.PersonDtoMapper;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Validation;
import repository.PersonRepository;
import repository.impl.PersonRepositoryImpl;
import service.PersonService;
import service.impl.PersonServiceImpl;
import util.CheckValidation;

import java.io.IOException;

public class Signup extends HttpServlet {
    EntityManager entityManager;
    PersonRepository personRepository;
    PersonService personService;
    PersonDtoMapper personDtoMapper;

    @Override
    public void init() {
        entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();
        personRepository = new PersonRepositoryImpl(entityManager);
        personService = new PersonServiceImpl(entityManager, personRepository);
        personDtoMapper = new PersonDtoMapper();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String userName = req.getParameter("userName");
        String password = req.getParameter("password");

        PersonDto userDto = PersonDto.builder()
                .firstName(firstName)
                .lastName(lastName)
                .userName(userName)
                .password(password)
                .build();

        boolean validate = CheckValidation.isValid(userDto);

        if (!validate) {
            req.setAttribute("error", "person validation is error");
        } else {
            personService.save(personDtoMapper.getPersonDtoToPerson(userDto));
            resp.setCharacterEncoding("UTF-8");
            String message = firstName + " " + lastName + " added successfully";
            HttpSession httpSession = req.getSession();
            httpSession.setAttribute("message", message);
            getServletContext().getRequestDispatcher("/signup.jsp").forward(req, resp);
        }
    }
}
