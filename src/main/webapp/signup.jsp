<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>SingUp</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/Signup.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>

<body>

<nav class="navbar navbar-expand-lg bg-body-secondary">

    <div class="container-fluid">

        <div class="collapse navbar-collapse">

            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active " style="color: black" aria-current="page" href="index.jsp"><strong>Home</strong></a>
                </li>
            </ul>

            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" style="color: black" aria-current="page" href="signup.jsp"><strong>Signup</strong></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" style="color: black" aria-current="page" href="login.jsp"><strong>Login</strong></a>
                </li>
            </ul>

        </div>
    </div>
</nav>


<div class="container-fluid">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card mt-4">
                <div class="card-header text-center fs-4"><h3>Signup</h3></div>
                <div class="card-body">
                    <form action="" method="post" target="_self">
                        <div class="mb-3">
                            <label for="firstName" class="form-label"><strong>Firstname :</strong></label>
                            <input type="text" class="form-control" id="firstName" name="firstName"
                                   placeholder="Enter your first name..." required>
                        </div>
                        <div class="mb-3">
                            <label for="lastName" class="form-label"><strong>Lastname :</strong></label>
                            <input type="text" class="form-control" id="lastName" name="lastName"
                                   placeholder="Enter your last name..." required>
                        </div>
                        <div class="mb-3">
                            <label for="username" class="form-label"><strong>Username :</strong></label>
                            <input type="text" class="form-control" id="username" name="userName"
                                   placeholder="Enter your username..." required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label"><strong>Password :</strong></label>
                            <input type="password" class="form-control" id="password" name="password"
                                   placeholder="Enter your password..." required>
                        </div>
                        <div class="container text-center">
                            <button type="submit" class="btn btn-primary">Signup</button>
                            <button type="reset" class="btn btn-danger">Reset</button>
                        </div>
                        <div class="mt-3 text-center">
                            <strong>Already have an account? <a href="login.jsp">Login</a></strong>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>