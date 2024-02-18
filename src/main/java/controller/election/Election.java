package controller.election;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

@WebServlet(name = "ServletElection",urlPatterns = "/Election")
public class Election extends HttpServlet {
}
