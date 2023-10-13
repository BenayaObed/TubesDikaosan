
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/dashboard/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${pageContext.request.contextPath}/dashboard/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/dashboard/js/adminlte.min.js"></script>


<script>
    $(document).ready(function() {
      var url = window.location;
      $('ul.nav-sidebar a').filter(function() {
        return this.href == url;
      }).addClass('active');
  
      $('ul.nav-treeview a').filter(function() {
        return this.href == url;
      }).parentsUntil(".nav-sidebar > .nav-treeview").addClass('menu-open').prev('a').addClass('active');
    });
  </script>