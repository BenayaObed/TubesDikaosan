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
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard">Dashboard</a></li>
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard/payment-method">Payment-method</a></li>
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
            <form action="${pageContext.request.contextPath}/dashboard/payment-method/update?methodID=${data.id}" method="POST">
              <div class="card card-primary">
                <div class="card-header">
                  <h3 class="card-title">${title}</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputBorder">Payment Method</label>
                    <input type="text" class="form-control form-control-border" id="payment_method_name" name="payment_method_name" placeholder="Enter category" value="${data.payment_method_name}">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputBorder">Nomor Rekening / Virtual Account</label>
                    <input type="text" class="form-control form-control-border" id="norek" name="norek" placeholder="Enter Nomor rekening / virtual account" value="${data.norek}">
                  </div>
                  <div class="form-group">
                    <label for="exampleSelectBorders">Status active</label>
                    <select class="custom-select form-control-border" id="isActive" name="isActive">
                      <option value="${data.isActive}" selected>${data.isActive == 1 ? "Active" : "Non Active"}</option>
                      ${data.isActive == 1 ? "<option value='0'>Non Active</option>" : "<option value='1'>Active</option>"}
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
<c:if test="${not empty alert}">
  <script>
    alert("${alert}")
  </script>
    </c:if>
<!-- REQUIRED SCRIPTS -->
<%@ include file = "../../includes/dashboard/_scripts.jsp" %>
</body>
</html>
