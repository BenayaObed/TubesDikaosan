<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title> Registartion and Login App</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<br>
<br>
<div class = "container">
    <div class = "row">
        <div class = "col-md-6 col-md-offset-3">

            <h1> User Login Page </h1>
            <form action="${pageContext.request.contextPath}/api/login" method="post">
                <div class="form-group">
                    <label for="Email">Email</label> :
                    <input type="text" class="form-control" id="Email" name="Email"
                           placeholder="Enter Email ID" autofocus="autofocus">
                </div>
            
                <div class="form-group">
                    <label for="password">Password</label>:
                    <input type="password" id="password" name="password" class="form-control"
                           placeholder="Enter Password"/>
                </div>
            
                <div class="form-group">
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3">
                            <input type="submit" name="login-submit" id="login-submit"
                                   class="form-control btn btn-primary" value="Log In"/>
                        </div>
                    </div>
                </div>
            </form>
            <div class="form-group">
						<span>New user? <a href="/api/register">Register
								here</a></span>
            </div>
        </div>
    </div>
</div>
</body>
</html>