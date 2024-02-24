package controller.election;

import base.repository.util.HibernateUtil;
import entity.Person;
import entity.Vote;
import jakarta.persistence.EntityManager;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import repository.PersonRepository;
import repository.VoteRepository;
import repository.impl.PersonRepositoryImpl;
import repository.impl.VoteRepositoryImpl;
import service.PersonService;
import service.VoteService;
import service.impl.PersonServiceImpl;
import service.impl.VoteServiceImpl;

import java.io.IOException;

@WebServlet(name = "ServletElection", urlPatterns = "/Election")
public class Election extends HttpServlet {
    EntityManager entityManager;
    PersonRepository personRepository;
    PersonService personService;
    VoteRepository voteRepository;
    VoteService voteService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();
        personRepository = new PersonRepositoryImpl(entityManager);
        personService = new PersonServiceImpl(entityManager, personRepository);
        voteRepository = new VoteRepositoryImpl(entityManager);
        voteService = new VoteServiceImpl(entityManager, voteRepository);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String option = req.getParameter("option");
        Person currentPerson = (Person) req.getSession().getAttribute("currentPerson");

        try {
            Vote vote = new Vote(option);
            voteService.save(vote);
            currentPerson.setVote(vote);
            personService.update(currentPerson);
            resp.setCharacterEncoding("UTF-8");
            String message = " The vote was successfully registered";
            req.getSession().setAttribute("error", message);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/election.jsp");
            requestDispatcher.forward(req, resp);
        } catch (Exception e) {
            String error = "option is null";
            HttpSession httpSession = req.getSession();
            httpSession.setAttribute("error", error);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/election.jsp");
            requestDispatcher.forward(req, resp);
        }
    }
}