<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="session" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title >Registration</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<!-- create navigation bar (header)-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Registration and Login Module</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#colapsibleNavbar" aria-controls="colapsibleNavbar" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="colapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" th:href="@{/registration}"> Registration <span class="sr-only">(current)</span></a>
                </li>
            </ul>
        </div>
    </nav>
<br>
<br>
<!-- create HTML form (header)-->
    <div class = "container">
        <div class = "row">
            <div class = "col-md-6 col-md-offset-3">
                    <!-- success message -->
                    <div th:if="${param.success}">
                        <div class="alert alert-info">You've successfully registered
                            to our awesome app!</div>
                    </div>

                    <h1>Registration</h1>
                    <form action="${pageContext.request.contextPath}/registration" method="post">
                        <div class="form-group">
                          <label for="first_name" class="control-label">First Name</label>
                          <input type="text" name="first_name" id="first_name" class="form-control" required="required" autofocus="autofocus"/>
                        </div>
                        <div class="form-group">
                          <label for="last_name" class="control-label">Last Name</label>
                          <input type="text" name="last_name" id="last_name" class="form-control" required="required" autofocus="autofocus"/>
                        </div>
                        <div class="form-group">
                          <label for="email" class="control-label">Email</label>
                          <input type="email" name="email" id="email" class="form-control" required="required" autofocus="autofocus"/>
                        </div>
                        <div class="form-group">
                          <label for="password" class="control-label">Password</label>
                          <input type="password" name="password" id="password" class="form-control" required="required" autofocus="autofocus" />
                        </div>
                        <div class="form-group">
                          <button type="submit" class="btn btn-success">Register</button>
                          <span>
                            Already registered?
                            <a href="${pageContext.request.contextPath}/login" class="btn btn-link">Login</a>
                          </span>
                        </div>
                    </form>
            </div>
        </div>
    </div>
</body>
</html>