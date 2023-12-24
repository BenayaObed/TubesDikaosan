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
              <form action="${pageContext.request.contextPath}/dashboard/products/update" method="POST" enctype="multipart/form-data">
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">${title}</h3>
                    </div>
                    <!-- /.card-header -->
                    <!-- Card body - Product Section -->
                    <div class="card-body">
                        <div class="form-group">
                            <label for="name_product">Nama Product:</label>
                            <input type="hidden" name="productID" value="${product.product_id}">
                            <input type="text" class="form-control" id="name_product" name="name_product" autocomplete="on" value="${product.name_product}">
                        </div>
                        <div class="form-group">
                            <!-- category using select -->
                            <label for="category">Category:</label>
                            <select class="form-control" id="category" name="category_id">
                                <c:forEach items="${categories}" var="item">
                                  <option value="${item.category_id}" selected="${item.category_id eq product.category.category_id}">${item.category_name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="description">Description:</label>
                            <textarea class="form-control" id="description" name="description">${product.description}</textarea>
                        </div>
                        <div class="form-group"> 
                              <label for="price">Price:</label>
                              <input type="text" class="form-control" name="price" value="${product.price}">
                        </div> 
                        <div class="form-group">
                            <label for="visible">Status Visible:</label>
                            <select class="form-control" id="visible" name="visible">
                                <option value="${product.visible}" selected>${product.visible == 1 ? "Visible" : "Hidden"}</option>
                                 ${product.visible == 1 ? "<option value='0'>Hidden</option>" : "<option value='1'>Visible</option>"}
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
                          <button type="button" class="btn btn-warning btn-sm ml-auto" data-toggle="modal" data-target="#colorModal">Add Stock</button>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label>Stock:</label>
                            <div id="stockFields">
                                <!-- Stock fields will be dynamically added here -->
                                <c:forEach items="${stocks}" var="item">
                                <div class="row mb-3">
                                  <div class="col-md-3">
                                    <div class="form-group">
                                      <label for="color">Color:</label>
                                      <input type="hidden" class="form-control" name="stock_id" value="${item.value.id}">
                                      <input type="text" class="form-control" name="color[]" value="${item.key}">
                                    </div>
                                  </div>
                                  <div class="col-md-8">
                                    <div class="row">
                                      <div class="col-md-3">
                                        <div class="form-group">
                                          <label for="sizeS">Size S:</label>
                                          <input type="text" class="form-control" name="size[S][]" value="${item.value.S}">
                                        </div>
                                      </div>
                                      <div class="col-md-3">
                                        <div class="form-group">
                                          <label for="sizeM">Size M:</label>
                                          <input type="text" class="form-control" name="size[M][]" value="${item.value.M}">
                                        </div>
                                      </div>
                                      <div class="col-md-3">
                                        <div class="form-group">
                                          <label for="sizeL">Size L:</label>
                                          <input type="text" class="form-control" name="size[L][]" value="${item.value.XL}">
                                        </div>
                                      </div>
                                      <div class="col-md-3">
                                        <div class="form-group">
                                          <label for="sizeXL">Size XL:</label>
                                          <input type="text" class="form-control" name="size[XL][]" value="${item.value.XL}">
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="col-md-1 text-right">
                                    <button type="button" class="btn btn-danger btn-sm remove-btn" onclick="removeField(this, 'stock')">Remove</button>
                                  </div>
                                  </div>
                                </c:forEach>

                            </div>
                        </div>
                    </div>
                </div>
            
                <!-- Card body - Image Section -->
                <div class="card card-primary">
                    <div class="card-header">
                      <div class="row">
                        <h3 class="card-title">Images</h3>
                        <button type="button" class="btn btn-warning btn-sm ml-auto" onclick="addImageField()">Add Image</button>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label>Images:</label>
                            <div id="imageFields">
                                <!-- Image fields will be dynamically added here -->
                                <c:forEach items="${product.images}" var="item">
                                <div class="form-row mb-3">
                                  <div class="col-md-6">
                                    <label for="image">Image file:</label>
                                    <input type="hidden" name="image_id" value="${item.image_id}">
                                    <input type="file" class="form-control" name="images" value="${item.image}">
                                  </div>
                                  <div class="col-md-5">
                                    <label>Preview:</label>
                                    <div class="image-preview text-center">
                                      <img class="img-preview" alt="Preview" src="${pageContext.request.contextPath}/resources/uploads/images/products/${item.image}">
                                    </div>
                                  </div>
                                  <div class="col-md-1 text-right">
                                    <button type="button" class="btn btn-danger btn-sm remove-btn" onclick="removeField(this, 'image')">Remove</button>
                                  </div>
                                </div>
                                </c:forEach>
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

      <!-- Modal -->
<div class="modal fade" id="colorModal" tabindex="-1" role="dialog" aria-labelledby="colorModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="colorModalLabel">Enter Color</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="form-group">
          <label for="colorInput">Color:</label>
          <input type="text" class="form-control" id="colorInput">
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="addStockField()">Add Stock</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

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
    if ($('#stockFields .row').length < 20) {
      // Tampilkan modal
      $('#colorModal').modal('show');
      
      // Hentikan jika pengguna membatalkan atau menutup modal
      $('#colorModal').on('hide.bs.modal', function () {
        $('#colorInput').val('');
      });
      
      
      var color = $('#colorInput').val();

        if (!color) {
          return;
        }

        // cek warna apakah sudah ada
        var colors = [];
        $('#stockFields .row').each(function () {
          colors.push($(this).find('input[name="color[]"]').val());
        });

        if (colors.includes(color)) {
          alert('Warna ' + color + ' sudah ada!');
          return;
        }

        var newStockField = '<div class="row mb-3">' +
          '<div class="col-md-3">' +
          '  <div class="form-group">' +
          '    <label for="color">Color:</label>' +
          '    <input type="hidden" class="form-control" name="stock_id" value="">' +
          '    <input type="text" class="form-control" name="color[]" value="' + color + '">' +
          '  </div>' +
          '</div>' +
          '<div class="col-md-8">' +
          '  <div class="row">' +
          '    <div class="col-md-3">' +
          '      <div class="form-group">' +
          '        <label for="sizeS">Size S:</label>' +
          '        <input type="text" class="form-control" name="size[S][]">' +
          '      </div>' +
          '    </div>' +
          '    <div class="col-md-3">' +
          '      <div class="form-group">' +
          '        <label for="sizeM">Size M:</label>' +
          '        <input type="text" class="form-control" name="size[M][]">' +
          '      </div>' +
          '    </div>' +
          '    <div class="col-md-3">' +
          '      <div class="form-group">' +
          '        <label for="sizeL">Size L:</label>' +
          '        <input type="text" class="form-control" name="size[L][]">' +
          '      </div>' +
          '    </div>' +
          '    <div class="col-md-3">' +
          '      <div class="form-group">' +
          '        <label for="sizeXL">Size XL:</label>' +
          '        <input type="text" class="form-control" name="size[XL][]">' +
          '      </div>' +
          '    </div>' +
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
    if ($('#imageFields .form-row').length < 3) {
      var newImageField = '<div class="form-row mb-3">' +
        '<div class="col-md-6">' +
        '<label for="image">Image file:</label>' +
        '<input type="hidden" name="image_id" value="">'+
        '<input type="file" class="form-control" name="images">' +
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
    }
  }

  function removeField(button, type) {
    if (type === 'stock') {
      // ajax delete stock
      var id = $(button).closest('.row').find('input[name="stock_id"]').val();

      if (id) {
        $.ajax({
          url: '${pageContext.request.contextPath}/dashboard/products/delete_stock',
          method: 'POST',
          data: {
            ProductID: '${product.product_id}',
            stockID: id,
            color: $(button).closest('.row').find('input[name="color[]"]').val()
          },
          success: function (response) {
            console.log(response);
          }
        });
      }
      $(button).closest('.row').remove();
    } else if (type === 'image') {
      var id = $(button).closest('.form-row').find('input[name="image_id"]').val();

      if (id) {
        $.ajax({
          url: '${pageContext.request.contextPath}/dashboard/products/delete_image',
          method: 'POST',
          data: {
            imageID: id
          },
          success: function (response) {
            console.log(response);
          }
        });
      }

      $(button).closest('.form-row').remove();
    }
  }

  $(document).on('change','input[type="file"]',function () {
      var input = this;
      if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
          $(input).closest('.form-row').find('.img-preview').attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
      }
    });
</script>



</body>
</html>