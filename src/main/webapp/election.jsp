<%@ page import="entity.Person" %>
<%@ page import="java.util.List" %>
<%@ page import="base.repository.util.HibernateUtil" %>
<%@ page import="jakarta.persistence.EntityManager" %>
<%@ page import="repository.impl.PersonRepositoryImpl" %>
<%@ page import="service.PersonService" %>
<%@ page import="service.impl.PersonServiceImpl" %>
<%@ page import="java.util.Optional" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="org.hibernate.dialect.function.ListaggStringAggEmulation" %>
<%@ page import="service.VoteService" %>
<%@ page import="service.impl.VoteServiceImpl" %>
<%@ page import="repository.impl.VoteRepositoryImpl" %>
<%@ page import="entity.Vote" %>
<%
    Person currentPerson = (Person) session.getAttribute("currentPerson");
    if (currentPerson == null) {
        session.setAttribute("error", "You are not logged-in! Login first.");
        response.sendRedirect("/login.jsp");
        return;
    }
%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Election</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/election.css">
    <link rel="icon" href="picture/images.jpg">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
</head>

<body>

<nav class="navbar navbar-expand-lg bg-body-secondary">

    <div class="container-fluid">

        <div class="collapse navbar-collapse">

            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active " style="color: black" aria-current="page"
                       href="index.jsp"><strong>Home</strong></a>
                </li>
            </ul>

            <ul class="navbar-nav ml-auto">
                <%
                    Person person = (Person) session.getAttribute("currentPerson");
                    if (person == null) {
                %>
                <li class="nav-item">
                    <a class="nav-link" style="color: black" aria-current="page"
                       href="signup.jsp"><strong>Signup</strong></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" style="color: black" aria-current="page" href="login.jsp"><strong>Login</strong></a>
                </li>
                <%
                } else {
                %>
                <li class="nav-item">
                    <a class="nav-link" style="color: black" aria-current="page" href="election.jsp">
                        <strong><%=person.getUserName()%>
                        </strong>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" style="color: black" aria-current="page"
                       data-bs-toggle="modal" data-bs-target="#statsModal" href="">
                        <strong>Result</strong></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" style="color: black" aria-current="page"
                       href="Logout"><strong>Logout</strong></a>
                </li>
                <%
                    }
                %>
            </ul>

        </div>
    </div>
</nav>


<div class="container-fluid">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card mt-3">
                <%
                    String error = (String) session.getAttribute("error");
                    if (error != null) {
                %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong><%= error %>
                    </strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%
                        session.removeAttribute("error");
                    }
                %>
                <div class="card-header text-center fs-4"><h3>survey</h3></div>
                <div class="card-body">
                    <div class="mb-3">
                        <strong>which team will be the champion of the Premier League this season?</strong>
                    </div>
                    <form method="post" action="Election" target="_self">
                        <div>
                            <strong><label for="esteghlal">Esteghlal</label>
                                <input type="radio" id="esteghlal" name="option" value="esteghlal"
                                       style="margin-left: 20px" checked><br>
                                <label for="persepolis">Persepolis</label>
                                <input type="radio" id="persepolis" name="option" value="persepolis"
                                       style="margin-left: 11px"><br>
                                <label for="sepahan">Sepahan</label>
                                <input type="radio" id="sepahan" name="option" value="sepahan"
                                       style="margin-left: 23px"><br>
                                <label for="tractor">Tractor</label>
                                <input type="radio" id="tractor" name="option" value="tractor"
                                       style="margin-left: 33px"><br>
                                <label for="other">other</label>
                                <input type="radio" id="other" name="option" value="other"
                                       style="margin-left:45px"></strong><br><br>
                        </div>
                        <div class="mb-2 text-center">
                            <button type="submit" class="btn btn-primary">vote</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%--<script>
    $(document).ready(function () {
        $('#Survey').submit(function (e) {
            e.preventDefault();
            var selectedOption = $('input[name=option]:checked', '#Survey').val();
            $.ajax({
                type: 'POST',
                url: 'http://localhost:8080/Election',
                data: {option: selectedOption},
                success: function (response) {
                    window.location = '/election.jsp';
                },
                error: function (error) {
                    console.log(error)
                }
            });
        });
    });
</script>--%>


<div class="modal fade" id="statsModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5">Result</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <%
                    EntityManager entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();
                    VoteService voteService = new VoteServiceImpl(entityManager, new VoteRepositoryImpl(entityManager));
                    Optional<List<Vote>> voteList = Optional.ofNullable(voteService.findAll());
                    if (voteList.isPresent()) {
                        List<Vote> voteList1 = voteList.get();
                        int numberEsteghlal = 0;
                        int numberPersepolis = 0;
                        int numberSepahan = 0;
                        int numberTractor = 0;
                        int numberOther = 0;
                        for (Vote vote : voteList1) {
                            switch (vote.getVoteName()) {
                                case "esteghlal":
                                    numberEsteghlal++;
                                    break;
                                case "persepolis":
                                    numberPersepolis++;
                                    break;
                                case "sepahan":
                                    numberSepahan++;
                                    break;
                                case "tractor":
                                    numberTractor++;
                                    break;
                                case "other":
                                    numberOther++;
                                    break;
                            }
                        }
                %>
                <strong>Esteghlal:<%=numberEsteghlal%>
                </strong><br>
                <strong>Persepolis:<%=numberPersepolis%>
                </strong><br>
                <strong>Sepahan:<%=numberSepahan%>
                </strong><br>
                <strong>Tractor:<%=numberTractor%>
                </strong><br>
                <strong>Other:<%=numberOther%>
                </strong>
            </div>
            <% }%>
            <div class="modal-footer">
                <div class="container text-center">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>