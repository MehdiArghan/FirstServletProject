package controller.login;

import base.repository.util.HibernateUtil;
import entity.Person;
import jakarta.persistence.EntityManager;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import repository.PersonRepository;
import repository.impl.PersonRepositoryImpl;
import security.PasswordHash;
import service.PersonService;
import service.impl.PersonServiceImpl;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

@WebFilter(filterName = "FilterLogin", servletNames = "ServletLogin", urlPatterns = "/Login")
public class FilterLogin implements Filter {
    private final EntityManager entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();
    private final PersonRepository personRepository = new PersonRepositoryImpl(entityManager);
    private final PersonService personService = new PersonServiceImpl(entityManager, personRepository);
    private final PasswordHash passwordHash = new PasswordHash();

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        String userName = request.getParameter("userName");
        String password = request.getParameter("password");

        Person person = personService.findByUserName(userName);
        boolean isEqual = false;

        try {
            isEqual = passwordHash.checkEqualityOfHashedPassword(password, person.getPassword());
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }

        HttpSession httpSession = request.getSession();
        if (userName.equals(person.getUserName()) && isEqual) {
            httpSession.setAttribute("currentPerson", person);
            filterChain.doFilter(request, response);
        } else {
            String error = ("username/password is invalid");
            httpSession.setAttribute("error", error);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/login.jsp");
            requestDispatcher.forward(request, response);
        }
    }
}
