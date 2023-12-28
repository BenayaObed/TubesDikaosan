<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard/">Dashboard</a></li>
              <li class="breadcrumb-item active">${title} Page</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <div class="row">
                  <div class="col-6">
                    <h3 class="card-title">Employees</h3>
                  </div>
                  <div class="col-6">
                    <a href="${pageContext.request.contextPath}/dashboard/users/create" class="btn btn-sm btn-primary float-right"><i class="fas fa-plus"></i> Add Employees</a>
                  </div>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped text-center">
                  <thead>
                  <tr>
                    <th>Full name</th>
                    <th>Roles</th>
                    <th>Email</th>
                    <th>Action</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${data}" var="item">
                    <c:if test="${item.role.role_id > 1}">
                    <tr>
                      <td>${item.first_name} ${item.last_name}</td>
                      <td>${item.role.role_name}</td>
                      <td>${item.email}</td>
                      <td>
                        <a href="${pageContext.request.contextPath}/dashboard/users/edit?userID=${item.user_id}" class="btn btn-sm btn-warning"><i class="fas fa-edit"></i> Edit</a>
                        <a href="${pageContext.request.contextPath}/dashboard/users/delete?userID=${item.user_id}" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Delete</a>
                      </td>
                    </tr>
                    </c:if>
                  </c:forEach>
                  </tbody>
                  <tfoot>
                  <tr>
                    <th>Full name</th>
                    <th>Roles</th>
                    <th>Email</th>
                    <th>Action</th>
                  </tr>
                  </tfoot>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <%@ include file = "../../includes/dashboard/_footer.jsp" %>
</div>
<!-- ./wrapper -->
<c:if test="${not empty alert}">
  <script>
    alert("${alert}")
  </script>
    </c:if>
<!-- REQUIRED SCRIPTS -->
<%@ include file = "../../includes/dashboard/_scripts.jsp" %>
</body>
</html>
