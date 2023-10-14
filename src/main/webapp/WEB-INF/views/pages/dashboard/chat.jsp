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
            <h1 class="m-0">Dashboard Page</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard/">Home</a></li>
              <li class="breadcrumb-item active">Dashboard Page</li>
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
            <div class="col-md-4">
              <div class="card">
                <div class="card-header">
                  <h3 class="card-title">Contacts</h3>
                </div>
                <div class="card-body">
                  <!-- List kontak akan ditambahkan 2 kontak secara dinamis -->
                  <ul id="contact-list" class="list-group">
                    <li class="list-group-item">
                      <img
                        src="https://via.placeholder.com/30"
                        alt="User"
                        class="rounded-circle"
                        style="width: 30px; height: 30px; margin-right: 10px"
                      />
                      John Doe
                    </li>
                    <li class="list-group-item">
                      <img
                        src="https://via.placeholder.com/30"
                        alt="User"
                        class="rounded-circle"
                        style="width: 30px; height: 30px; margin-right: 10px"
                      />
                      Jane Smith
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="col-md-8">
              <div class="card direct-chat direct-chat-primary">
                <div class="card-header">
                  <h3 class="card-title">Chat</h3>
                </div>
                <div class="card-body">
                  <div class="direct-chat-messages">
                    <!-- Chat messages will be dynamically added here -->
                  </div>
                </div>
                <div class="card-footer">
                  <form id="chat-form">
                    <div class="input-group">
                      <input
                        type="text"
                        name="message"
                        placeholder="Type Message ..."
                        class="form-control"
                      />
                      <span class="input-group-append">
                        <button type="submit" class="btn btn-primary">
                          Send
                        </button>
                      </span>
                    </div>
                  </form>
                </div>
              </div>
              <!-- /.card -->
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
