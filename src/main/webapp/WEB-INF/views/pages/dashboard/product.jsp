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
                <h1 class="m-0">Products Page</h1>
              </div>
              <!-- /.col -->
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item">
                    <a href="${pageContext.request.contextPath}/dashboard/"
                      >Home</a
                    >
                  </li>
                  <li class="breadcrumb-item active">Products Page</li>
                </ol>
              </div>
              <!-- /.col -->
            </div>
            <!-- /.row -->
          </div>
          <!-- /.container-fluid -->
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
                        <h3 class="card-title">Products</h3>
                      </div>
                      <div class="col-6">
                        <a href="#" class="btn btn-sm btn-primary float-right"><i class="fas fa-plus"></i> Add Product</a>
                      </div>
                    </div>
                  </div>
                  <!-- /.card-header -->
                  <div class="card-body">
                    <table id="example1" class="table table-bordered table-striped text-center">
                      <thead>
                      <tr>
                        <th>Product</th>
                        <th>Category</th>
                        <th>Visibility</th>
                        <th>Photo</th>
                        <th>Action</th>
                      </tr>
                      </thead>
                      <tbody>
                      <tr>
                        <td>Product 1</td>
                        <td>10</td>
                        <td> <span class="badge badge-success">Visible</span></td>
                        <td> <img src="https://dummyimage.com/50x50/000/fff" alt="Product 1" class="img-fluid"></td>
                        <td>
                          <a href="#" class="btn btn-sm btn-warning"><i class="fas fa-edit"></i></a>
                          <a href="#" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></a>
                        </td>
                      </tbody>
                      <tfoot>
                      <tr>
                        <th>Product</th>
                        <th>Category</th>
                        <th>Visibility</th>
                        <th>Photo</th>
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
