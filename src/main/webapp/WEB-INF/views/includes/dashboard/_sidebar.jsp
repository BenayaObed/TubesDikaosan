<aside class="main-sidebar sidebar-dark-primary elevation-4">
  <!-- Brand Logo -->
  <a href="${pageContext.request.contextPath}/dashboard/" class="brand-link text-center">
    <!-- <img src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8"> -->
    <span class="brand-text font-weight-light">Dashboard DiKaosan</span>
  </a>

  <!-- Sidebar -->
  <div class="sidebar">
    <!-- Sidebar user panel (optional) -->
    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
      <div class="image">
        <img src="${pageContext.request.contextPath}/dashboard/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
      </div>
      <div class="info">
        <a href="#" class="d-block">${username}</a>
      </div>
    </div>

    <!-- Sidebar Menu -->
    <nav class="mt-2">
      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        
        <!-- Dashboard  -->
        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/dashboard" class="nav-link">
            <i class="nav-icon fas fa-tachometer-alt"></i>
            <p>
              Dashboard
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/dashboard" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>Dashboard</p>
              </a>
            </li>
          </ul>
        </li>

        <li class="nav-item">
          <a href="#" class="nav-link">
            <!-- icon manage -->
            <i class="nav-icon fas fa-th"></i>
            <p>
              Manage
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <!-- Products -->
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/dashboard/products" class="nav-link">
                <i class="nav-icon fas fa-box"></i>
                <p> Products </p>
              </a>
            </li>
            <!-- Categories -->
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/dashboard/categories" class="nav-link">
                <i class="nav-icon fas fa-list"></i>
                <p> Categories </p>
              </a>
            </li>

            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/dashboard/categories" class="nav-link">
                <i class="nav-icon fas fa-users"></i>
                <p> Employee </p>
              </a>
            </li>

            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/dashboard/categories" class="nav-link">
                <i class="nav-icon fas fa-user-tag"></i>
                <p> Roles </p>
              </a>
            </li>

            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/dashboard/categories" class="nav-link">
                <!-- credit card -->
                <i class="nav-icon fas fa-credit-card"></i>
                <p> Method Payment </p>
              </a>
            </li>
          </ul>

        <!-- Orders -->
        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/dashboard/orders" class="nav-link">
            <i class="nav-icon fas fa-shopping-cart"></i>
            <p> Orders </p>
          </a>
        </li>

        <!-- Chating -->
        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/dashboard/chats" class="nav-link">
            <i class="nav-icon fas fa-comments"></i>
            <p> Chats </p>
          </a>
        </li>
        <!-- Product -->
        
        <!-- Logout -->
        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/logout" class="nav-link">
            <i class="nav-icon fas fa-sign-out-alt"></i>
            <p> Logout </p>
          </a>
        </li>
      </ul>
    </nav>
    <!-- /.sidebar-menu -->
  </div>
  <!-- /.sidebar -->
</aside>