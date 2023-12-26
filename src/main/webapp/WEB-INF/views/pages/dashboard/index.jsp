<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <%@ include file = "../../includes/dashboard/_styles.jsp" %>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <!-- sidebar -->
  <%@ include file = "../../includes/dashboard/_sidebar.jsp" %>
  <!-- /sidebar -->
  <!-- navbar -->
  <%@ include file = "../../includes/dashboard/_navbar.jsp" %>
  <!-- /navbar -->

  <!-- Main content -->
  <div class="content-wrapper">

    <!-- index -->
    
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
    
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <c:if test="${reportOrderStatus[0][1] > 0}">
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner">
                <h3>${reportOrderStatus[0][1]}</h3>

                <p>${reportOrderStatus[0][0]}</p>
              </div>
            </div>
          </div>
          </c:if>

          <c:if test="${reportOrderStatus[1][1] > 0}">
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner">
                <h3>${reportOrderStatus[1][1]}</h3>

                <p>${reportOrderStatus[1][0]}</p>
              </div>
              
            </div>
          </div>
          </c:if>

          <c:if test="${reportOrderStatus[2][1] > 0}">
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner">
                <h3>${reportOrderStatus[2][1]}</h3>

                <p>${reportOrderStatus[2][0]}</p>
              </div>
              
            </div>
          </div>
          </c:if>

          <c:if test="${reportOrderStatus[3][1] > 0}">
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner">
                <h3>${reportOrderStatus[3][1]}</h3>

                <p>
                  ${reportOrderStatus[3][0]}
                </p>
              </div>
              
            </div>
          </div>
          </c:if>

        </div>
        <div class="row">
          <div class="col-md-12">
            <!-- BAR CHART -->
            <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">Pendapatan</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                </div>
              </div>
              <div class="card-body">
                <div class="chart">
                  <canvas id="barChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

          </div>
          <!-- /.col (RIGHT) -->
        </div>

        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <div class="row">
                  <div class="col-6">
                    <h3 class="card-title">Total pendapatan by product</h3>
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
                    <th>Terjual</th>
                    <th>Revenue</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${reportOrderProduct}" var="product">
                    <tr>
                      <td>${product[0]}</td>
                      <td>${product[1]}</td>
                      <td>${product[2]}</td>
                      <td>${product[3]}</td>
                    </tr>
                  </c:forEach>
                  </tbody>
                  <tfoot>
                  <tr>
                    <th>Product</th>
                    <th>Category</th>
                    <th>Terjual</th>
                    <th>Revenue</th>
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
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- REQUIRED SCRIPTS -->
  <%@ include file = "../../includes/dashboard/_scripts.jsp" %>

  <script>
    $(function () {
      /* ChartJS
       * -------
       * Here we will create a few charts using ChartJS
       */

      //-------------
      //- BAR CHART -
      //-------------
      var barChartCanvas = $('#barChart').get(0).getContext('2d')
      var barChartData = {
        labels  : [
        <c:forEach items = "${reportOrderPayment}" var = "month" varStatus = "loop">
          "${month[1]}" <c:if test="${!loop.last}">, </c:if>
        </c:forEach>
        ],
        datasets: [
          {
            label               : 'Pendapatan Perbulan',
            backgroundColor     : 'rgba(60,141,188,0.9)',
            borderColor         : 'rgba(60,141,188,0.8)',
            pointRadius          : false,
            pointColor          : '#3b8bba',
            pointStrokeColor    : 'rgba(60,141,188,1)',
            pointHighlightFill  : '#fff',
            pointHighlightStroke: 'rgba(60,141,188,1)',
            data                : [
            <c:forEach items = "${reportOrderPayment}" var = "month" varStatus = "loop">
              "${month[0]}" <c:if test="${!loop.last}">, </c:if>
            </c:forEach>
            ]
          },
        ]
      }

      var barChartOptions = {
        responsive              : true,
        maintainAspectRatio     : false,
        datasetFill             : false,
        scales: {
          yAxes: [{
            ticks: {
              beginAtZero: true
            }
          }]
        }
      }

      new Chart(barChartCanvas, {
        type: 'bar',
        data: barChartData,
        options: barChartOptions
      })
    })
  </script>
</body>
</html>
