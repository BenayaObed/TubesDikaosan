<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="session" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <%@ include file = "../../includes/dashboard/_styles.jsp" %>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">

  <!-- Navbar -->
  <%@ include file = "../../includes/dashboard/_navbar.jsp" %>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <%@ include file = "../../includes/dashboard/_sidebar.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">${title} Page</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard">Dashboard</a></li>
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard/Employees">Employees</a></li>
              <li class="breadcrumb-item active">${title}</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <form action="${pageContext.request.contextPath}/dashboard/users/update" method="POST">
              <div class="card card-primary">
                <div class="card-header">
                  <h3 class="card-title">${title}</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputBorder">First name</label>
                    <input type="text" class="form-control form-control-border" id="first_name" name="first_name" placeholder="Enter first name" value="${user.first_name}">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputBorder">Last name</label>
                    <input type="text" class="form-control form-control-border" id="last_name" name="last_name" placeholder="Enter last name" value="${user.last_name}">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputBorder">Email</label>
                    <input type="email" class="form-control form-control-border" id="email" name="email" placeholder="Enter email" value="${user.email}">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputBorder">Password</label>
                    <input type="password" class="form-control form-control-border" id="password" name="password" placeholder="Enter password" value="${user.password}">
                  </div>
                  <div class="form-group">
                    <label for="exampleSelectBorders">Set Role</label>
                    <select class="custom-select form-control-border" id="role" name="role">
                      <c:forEach items="${data}" var="item">
                        <option value="${item.role_id}" selected="${item.role_id == user.role.role_id}">${item.role_name}</option>
                      </c:forEach>
                    </select>
                  </div>
                  <button type="submit" class="btn btn-primary" name="submit">Submit</button>
                </div>
                <!-- /.card-body -->
              </div>
            </form>
          </div>
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <%@ include file = "../../includes/dashboard/_footer.jsp" %>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->
<%@ include file = "../../includes/dashboard/_scripts.jsp" %>
</body>
</html>
