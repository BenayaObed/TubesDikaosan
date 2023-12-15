
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/resources/dashboard/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${pageContext.request.contextPath}/resources/dashboard/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Data tables -->
<script src="${pageContext.request.contextPath}/resources/dashboard/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/dashboard/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/dashboard/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/dashboard/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/dashboard/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/dashboard/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/dashboard/plugins/jszip/jszip.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/dashboard/plugins/pdfmake/pdfmake.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/dashboard/plugins/pdfmake/vfs_fonts.js"></script>
<script src="${pageContext.request.contextPath}/resources/dashboard/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/dashboard/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/dashboard/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/resources/dashboard/js/adminlte.min.js"></script>
<script>
  // Active sidebar menu
  $(document).ready(function() {
    var url = window.location;
    // for sidebar menu entirely but not cover treeview
    $('ul.nav-sidebar a').filter(function() {
      return this.href == url;
    }).addClass('active');

    // for treeview
    $('ul.nav-treeview a').filter(function() {
      return this.href == url;
    }).parentsUntil(".nav-sidebar > .nav-treeview").addClass('menu-open').prev('a').addClass('active');
  });
</script>

<script>
  $(function () {
    $("#example1").DataTable({
      "responsive": true, "lengthChange": false, "autoWidth": false,
      "buttons": ["csv", "excel", "pdf", "print"]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });

  // Custome color from buttons csv, excel, pdf, print
  $(document).ready(function() {
    $('.buttons-csv, .buttons-excel, .buttons-pdf, .buttons-print').addClass('btn-sm btn-default');
  });
</script>