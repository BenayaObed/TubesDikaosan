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
                    <h3 class="card-title">List Orders</h3>
                  </div>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped text-center">
                  <thead>
                  <tr>
                    <th>OrderID</th>
                    <th>Order By</th>
                    <th>Status</th>
                    <th>Action</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${data}" var="item">
                    <tr>
                      <td>${item.order_id}</td>
                      <td>${item.user_id.first_name} ${item.user_id.last_name}</td>
                      <td> 
                        <c:choose>
                          <c:when test="${item.status == 'pending'}">
                            <span class="badge badge-warning">Pending</span>
                          </c:when>
                          <c:when test="${item.status == 'process'}">
                            <span class="badge badge-info">Processing</span>
                          </c:when>
                          <c:when test="${item.status == 'delivered'}">
                            <span class="badge badge-success">Delivered</span>
                          </c:when>
                          <c:when test="${item.status == 'cancel'}">
                            <span class="badge badge-danger">Cancelled</span>
                          </c:when>
                          <c:when test="${item.status == 'sending'}">
                            <span class="badge badge-primary">Sending</span>
                          </c:when>
                        </c:choose>
                      </td>
                      <td>
                        <a href="${pageContext.request.contextPath}/dashboard/orders/detail?OrderID=${item.order_id}&userID=${user_id=item.user_id.user_id}" class="btn btn-sm btn-warning"><i class="fas fa-edit"></i>Details</a>
                      </td>
                    </tr>
                  </c:forEach>
                  </tbody>
                  <tfoot>
                  <tr>
                    <th>Order ID</th>
                    <th>Order By</th>
                    <th>Status</th>
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

<!-- REQUIRED SCRIPTS -->
<%@ include file = "../../includes/dashboard/_scripts.jsp" %>
</body>
</html>
