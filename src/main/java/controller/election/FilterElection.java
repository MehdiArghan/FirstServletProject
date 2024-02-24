package controller.election;

import entity.Person;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(filterName = "FilterElection", servletNames = "ServletElection", urlPatterns = "/Election")
public class FilterElection implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        Person currentPerson = (Person) request.getSession().getAttribute("currentPerson");

        try {
            String voteNameCurrentPerson = currentPerson.getVote().getVoteName();
            if (!voteNameCurrentPerson.isBlank()) {
                String error = "You have already voted";
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("error", error);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/election.jsp");
                requestDispatcher.forward(request, response);
            }
        } catch (NullPointerException e) {
            filterChain.doFilter(request, response);
        }
    }
}
