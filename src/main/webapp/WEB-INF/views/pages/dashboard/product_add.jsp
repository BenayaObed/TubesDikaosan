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
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard/categories">Categories</a></li>
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
            <form action="${pageContext.request.contextPath}/dashboard/products/add/submit" method="POST">
              <div class="card card-primary">
                <div class="card-header">
                  <h3 class="card-title">${title}</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                  <button type="button" class="btn btn-sm btn-warning float-right" id="addStock"><i class="fas fa-plus"></i> Add stock</button>
                  <div class="form-group">
                    <label for="exampleInputBorder">Product</label>
                    <input type="text" class="form-control form-control-border" id="product_name" name="product_name" placeholder="Enter category">
                  </div>
                  
                  <div class="form-group">
                    <label for="exampleInputBorder">Category</label>
                    <select class="custom-select form-control-border" id="category_id" name="category_id">
                      <c:forEach items="${categories}" var="category">
                        <option value="${category.category_id}">${category.category_name}</option>
                      </c:forEach>
                    </select>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputBorder">Description</label>
                    <textarea class="form-control form-control-border" id="description" name="description" placeholder="Enter description"></textarea>
                  </div>
                  <div class="form-group w-100">
                    <label for="exampleSelectBorder">Status visibles</label>
                    <select class="custom-select form-control-border" id="visible" name="visible">
                      <option value="1">Visible</option> <!-- yes -->
                      <option value="0">Non Visible</option> <!-- no -->
                    </select>
                  </div>
                  <button type="button" class="btn btn-sm btn-warning float-right mr-2" id="addImage"><i class="fas fa-plus"></i> Add image</button>
                  <button type="submit" class="btn btn-primary" name="submit" id="submit">Submit</button>
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
<script>
 $(document).ready(function() {
  var counter = 1;

  $('#addStock').click(function() {
    if (counter > 4) {
      alert('You can only add 4 stock.');
      return false;
    }
    counter++;
    if (counter == 2) {
      $('#submit').before('<label for="exampleInputBorder" class="mt-2 mb-4" id="qty-product">Quantity Product</label>');
    }
    // add new before button Add Image
    var newRow = $('<div class="form-group row" id="row' + counter + '"><div class="col-6"><label for="exampleInputBorder"><button type="button" class="btn btn-danger btn-sm remove-row" data-rowid="' + counter + '"><i class="fas fa-trash-alt"></i></button>&nbsp;Stock</label><input type="number" class="form-control form-control-border" id="stock' + counter + '" name="stock' + counter + '" placeholder="Enter stock"></div><div class="col-6"><label for="exampleInputBorder">Price</label><input type="number" class="form-control form-control-border" id="price' + counter + '" name="price' + counter + '" placeholder="Enter price"></div></div>');
    $('#submit').before(newRow);
  });

  $(document).on('click', '.remove-row', function() {
    var rowId = $(this).data('rowid');
    $('#row' + rowId).remove();
    counter--;
    if (counter < 2) {
      $('#qty-product').remove();
    }
  });

  $('#submit').click(function() {
    var isValid = true;
    $('input[type="number"]').each(function() {
      if ($(this).val() < 0) {
        isValid = false;
        return false;
      }
    });

    if (!isValid) {
      alert('Stock value cannot be negative.');
      return false;
    }
  });
});


</script>

<script>
  // add image preview
  $(document).ready(function() {
    $('#image').change(function() {
      var reader = new FileReader();
      reader.onload = function(e) {
        $('#image + img').remove();
        // after label priview
        $('#label-priview').after('<div class="priview-image text-center" style="border: 1px solid #ddd; border-radius: 4px; padding: 5px;"><img src="' + e.target.result + '" width="100" height="100" /></div>');
      };
      reader.readAsDataURL(this.files[0]);
    });
  }); 
</script>

<script>
  // add image and image preview, include delete
  // max 4 image
  $(document).ready(function() {
    var counter = 1;
    // after button add image
    $('#addImage').click(function() {
      if (counter > 3) {
        alert('You can only add 3 image.');
        return false;
      }
      counter++;
      if (counter == 2) {
        $('#submit').before('<label for="exampleInputBorder" id="label-image" class="mt-2 mb-4">Image</label>');
      }
      var newRow = $('<div class="form-group row" id="row' + counter + '"><div class="col-6"><label for="exampleInputBorder"><button type="button" class="btn btn-danger btn-sm remove-row" data-rowid="' + counter + '"><i class="fas fa-trash-alt"></i></button>&nbsp;Image</label><input type="file" class="form-control form-control-border" id="image' + counter + '" name="image' + counter + '" placeholder="Enter image"></div><div class="col-6"><label for="exampleInputBorder">Priview</label><div class="priview-image text-center" style="border: 1px solid #ddd; border-radius: 4px; padding: 5px;"><img src="" width="100" height="100" /></div></div></div>');
      $('#submit').before(newRow);
    });
    
    // remove row
    $(document).on('click', '.remove-row', function() {
      var rowId = $(this).data('rowid');
      $('#row' + rowId).remove();
      counter--;
      if (counter < 2) {
        $('#label-image').remove();
      }
      console.log(counter);
    });

    // Preview image
    $(document).on('change', 'input[type="file"]', function() {
      var reader = new FileReader();
      var rowId = $(this).attr('id').replace('image', '');
      reader.onload = function(e) {
        $('#image' + rowId + ' + img').remove();
        $('#row' + rowId + ' .priview-image').html('<img src="' + e.target.result + '" width="100" height="100" />');
      };
      reader.readAsDataURL(this.files[0]);
    });

    });
</script>
</body>
</html>
