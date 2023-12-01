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
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard/products">Products</a></li>
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
            <div class="card-body">
              <form action="${pageContext.request.contextPath}/dashboard/api/products/add/submit" method="POST">
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">${title}</h3>
                    </div>
                    <!-- /.card-header -->
                    <!-- Card body - Product Section -->
                    <div class="card-body">
                        <div class="form-group">
                            <label for="productName">Nama Product:</label>
                            <input type="text" class="form-control" id="productName" name="productName">
                        </div>
                        <div class="form-group">
                            <!-- category using select -->
                            <label for="category">Category:</label>
                            <select class="form-control" id="category" name="category">
                                <c:forEach items="${categories}" var="category">
                                    <option value="${category.category_id}">${category.category_name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="description">Description:</label>
                            <textarea class="form-control" id="description" name="description"></textarea>
                        </div>
                        <div class="form-group"> 
                              <label for="price">Price:</label>
                              <input type="text" class="form-control" name="price[]"> 
                        </div> 
                        <div class="form-group">
                            <label for="status">Status Visible:</label>
                            <select class="form-control" id="status" name="status">
                                <option value="visible">Visible</option>
                                <option value="hidden">Hidden</option>
                            </select>
                        </div>
                    </div>
                    <!-- /.card-body -->
                </div>
            
                <!-- Card body - Stock Section -->
                <div class="card card-primary">
                    <div class="card-header">
                        <div class="row">
                          <h3 class="card-title">Stock</h3>
                          <button type="button" class="btn btn-warning ml-auto" onclick="addStockField()">Add Stock</button>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label>Stock:</label>
                            <div id="stockFields">
                                <!-- Stock fields will be dynamically added here -->
                            </div>
                        </div>
                    </div>
                </div>
            
                <!-- Card body - Image Section -->
                <div class="card card-primary">
                    <div class="card-header">
                      <div class="row">
                        <h3 class="card-title">Images</h3>
                        <button type="button" class="btn btn-warning ml-auto" onclick="addImageField()">Add Image</button>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label>Images:</label>
                            <div id="imageFields">
                                <!-- Image fields will be dynamically added here -->
                            </div>
                        </div>
                    </div>
                </div>
            
                <button type="submit" class="btn btn-success">Submit</button>
            </form>
            </div>
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
<script>
  function addStockField() {
    // Maximum 4 stock fields
    if ($('#stockFields .row').length < 4) {
      var newStockField = '<div class="row mb-3">' +
        '<div class="col-md-6">' +
        '  <div class="form-group">' +
        '    <label for="stock">Stock:</label>' +
        '    <input type="text" class="form-control" name="stock[]">' +
        '  </div>' +
        '</div>' +
        '<div class="col-md-5">' +
        '  <div class="form-group">' +
        '    <label for="size">Size:</label>' +
        '    <input type="text" class="form-control" name="size[]">' +
        '  </div>' +
        '</div>' +
        '<div class="col-md-1 text-right">' +
        '  <button type="button" class="btn btn-danger btn-sm remove-btn" onclick="removeField(this, \'stock\')">Remove</button>' +
        '</div>' +
        '</div>';
      $('#stockFields').append(newStockField);
    }
  }

  function addImageField() {
    // Maximum 3 image fields
    if ($('#imageFields .form-row').length < 3) {
      var newImageField = '<div class="form-row mb-3">' +
        '<div class="col-md-6">' +
        '<label for="image">Image:</label>' +
        '<input type="file" class="form-control" name="image[]">' +
        '</div>' +
        '<div class="col-md-5">' +
        '<label>Preview:</label>' +
        '<div class="image-preview text-center">' +
        '<img class="img-preview" alt="Preview">' +
        '</div>' +
        '</div>' +
        '<div class="col-md-1 text-right">' +
        '<button type="button" class="btn btn-danger btn-sm remove-btn" onclick="removeField(this, \'image\')">Remove</button>' +
        '</div>' +
        '</div>';
      $('#imageFields').append(newImageField);
      setPreviewHandler();
    }
  }

  function removeField(button, type) {
    if (type === 'stock') {
      $(button).closest('.row').remove();
    } else if (type === 'image') {
      $(button).closest('.form-row').remove();
    }
  }

  function setPreviewHandler() {
    $('input[type="file"]').change(function () {
      var input = this;
      if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
          $(input).closest('.form-row').find('.img-preview').attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
      }
    });
  }
</script>

</body>
</html>
