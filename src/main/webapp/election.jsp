<%@ page import="entity.Person" %>
<%
    Person currentPerson = (Person) session.getAttribute("currentPerson");
    if (currentPerson == null) {
        session.setAttribute("error", "You are not logged-in! Login first.");
        response.sendRedirect("/login.jsp");
        return;
    }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Election</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/election.css">
    <link rel="icon" href="picture/images.jpg">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
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
                <div class="card-header text-center fs-4"><h3>survey</h3></div>
                <div class="card-body">
                    <div class="mb-3">
                        <strong>which team will be the champion of the Premier League this season?</strong>
                    </div>
                    <form id="Survey">
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


</body>
</html>
