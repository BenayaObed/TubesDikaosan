<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="session" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
  
  <!-- Header Section Start -->
  <head>
    <title>${title}</title>
    <%@ include file = "../../includes/fe_includes/_header.jsp" %>
  </head>
  <!-- Header Section Start -->

  <body>
    <!-- Navbar Section Start -->
    <%@ include file = "../../includes/fe_includes/_navbar.jsp" %>
    <!-- Navbar Section End -->

    <!-- Content Section Start -->
    <section class="homepage_content">
      <!-- div heading iklan -->
      <div class="iklan">
        <div class="row">
          <div id="carouselExample" class="carousel slide">
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="${pageContext.request.contextPath}/resources/images/Group-57.jpg" class="d-block w-100" alt="...">
                <div class="col-md-6 text-hero offset-md-5 my-1">
                  <h1>Elevate Your Style With Trendy <br> 
                      Clothes From Our Store</h1>
                  <a href="${pageContext.request.contextPath}/shop" class="btn btn-shop">SHOP NOW</a>
                </div>
              </div>

              <div class="carousel-item">
                <img src="${pageContext.request.contextPath}/resources/images/Group-58.jpg" class="d-block w-100" alt="...">
                <div class="col-md-6 text-hero offset-md-5 my-1">
                  <h1>Combine Your Style With These <br> 
                      Accessories!</h1>
                  <a href="${pageContext.request.contextPath}/shop" class="btn btn-shop">SHOP NOW</a>
                </div>
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
        </div>
      </div>
      <!-- div end heading iklan -->
  
      <!-- box product start-->
      <div class="box">
        <div class="row">
          <div class="col-6 d-flex align-items-center">
            <div class="col-sm-12 accessories_content d-flex">
              <div class="box_text1 my-5 mx-1">
                <h1 class="box_text m-0">Accessories</h1>
                <a href="${pageContext.request.contextPath}/shop"><u>SHOP NOW</u></a>
              </div> 
              <img src="${pageContext.request.contextPath}/resources/images/Produk/C2.jpg" style="max-width: 100%;height: auto;">
            </div>
          </div>
          <div class="col-6">
            <div class="col-sm-12 d-flex">
              <img src="${pageContext.request.contextPath}/resources/images/Produk/C1.jpg" style="max-width: 100%;height: auto;">
              <div class="box_text2 my-5 mx-1">
                <h1 class="box_text m-0">Clothing</h1>
                <a href="${pageContext.request.contextPath}/shop"><u>SHOP NOW</u></a>
              </div> 
            </div>
            <div class="col-sm-12 d-flex my-4">
              <img src="${pageContext.request.contextPath}/resources/images/Produk/C3.jpg" style="max-width: 100%;height: auto;">
              <div class="box_text3 my-5 mx-1">
                <h1 class="box_text m-0">Shoes</h1>
                <a href="${pageContext.request.contextPath}/shop"><u>SHOP NOW</u></a>
              </div> 
            </div>
          </div>
        </div>
      </div>
      <!-- box product end -->

      <!-- shope_content start -->
      <div class="container product_shop my-3">
        <div class="row homepage_shope">
          <div class="col-12 product_header d-flex justify-content-center align-items-center">
            <div class="row">
              <div class="col mx-5">
                <h1>Our Products</h1>
              </div>
            </div>
          </div>
          <div class="row row-cols-1 row-cols-md-3 row-cols-lg-4 m-0">
            <c:forEach items="${products}" var="item">
                <c:if test="${(item.visible == 1)}">
                  <c:if test="${(item.category.visible == 1)}">
                      <div class="col d-flex flex-column border-danger p-2">
                        <img class="product-img" src="${pageContext.request.contextPath}/resources/uploads/images/products/${item.images[0].image}"/>
                        <div class="row p-0 m-0">
                      <div class="col-11 p-0 w product-desc">
                        <p class="mb-0 p-0">${item.name_product}</p>
                        <p class="mb-0 p-0"><fmt:formatNumber value="${item.price}" type="currency" currencyCode="IDR" /></p>
                      </div>
                      <a href="${pageContext.request.contextPath}/description?product=${item.product_id}" class="col-1 product-cart d-flex justify-content-center cart p-0 pt-1">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag" viewBox="0 0 16 16">
                          <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z" />
                        </svg>
                      </a>
                    </div>
                  </div>
                </c:if>
              </c:if>
            </c:forEach>
          </div>
        </div>
      </div>
      <!-- shope_content end -->
      
      <!-- banner -->
      <div class="banner">
          <div class="row banner_1 my-5">
            <img src="${pageContext.request.contextPath}/resources/images/Group 13.jpg" alt="" srcset="">
                <div class="col-4 offset-7 text_banner my-5">
                  <h1 class="banner_text">High Quality Bag</h1>
                  <a href="${pageContext.request.contextPath}/shop" class="btn btn-shop">SHOP NOW</a>
              </div>
          </div>
      </div> 
      <!-- end banner -->
      
      <!-- Medsos --> 
      <div class="medsos">
        <div class="container">
          <div class="row medsos-pict">
            <div class="col-sm-12 medsos_tittle d-flex justify-content-center align-items-center ">
              <h1 class="medsos_text">Our Media Social</h1>
            </div>

            <div class="row mt-2">
              <div class="col-sm-6 d-flex flex-column p-0">
                  <img src="${pageContext.request.contextPath}/resources/images/Group 14.jpg">
              </div>
              <div class="col-sm-6 d-flex flex-column justify-content-center align-items-left">
                  <div class="info_contact w-75">
                      <div class="row">
                          <div class="d-flex flex-column">
                              <h1 class="m-0">Instagram</h1>
                              <div class="d-flex mt-2 my-5">
                                  <div class="Instagram">
                                      <img src="${pageContext.request.contextPath}/resources/images/44.png" alt="">
                                  </div>
                                  <div class="d-flex align-items-center p-0 m-0">
                                      <a class="text_medsos text-left m-0" href="#">@dikaosan_store</a>
                                  </div>
                              </div>
                          </div>
                          <div class="d-flex flex-column">
                              <h1 class="m-0">Facebook</h1>
                              <div class="d-flex mt-2 my-5">
                                  <div class="Facebook mx-2">
                                      <img src="${pageContext.request.contextPath}/resources/images/45.png" alt="">
                                  </div>
                                  <div class="d-flex align-items-center p-0 mx-1">
                                      <a class="text_medsos text-left m-0" href="#">@dikaosan_store</a>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
            </div>
          </div> 
        </div>     
      </div>
    </section>
    <!-- Content Section End -->

    <!-- Chat Section Start -->
    <%@ include file = "../../includes/fe_includes/_chat.jsp" %>
    <!-- Chat Section End -->

    <!-- Footer Section Start -->
    <%@ include file = "../../includes/fe_includes/_footer.jsp" %>
    <!-- Footer Section End-->

    <!-- Script Section Start -->
    <%@ include file = "../../includes/fe_includes/_scripts.jsp" %>
    <script>
      $(document).ready(function() {

    // Select your form by ID or any other appropriate selector
      // $('#loginForm').submit(function(e) {
      // // Prevent the default form submission
      // e.preventDefault();

      // // Serialize form data into a query string
      // var formData = $(this).serialize();

      // // Make a POST request using jQuery AJAX
      // $.ajax({
      //   type: 'POST',
      //   url: '${pageContext.request.contextPath}/authentication',
      //   data: $('#loginForm').serialize(),
      //   success: function(response) {
      //     // Handle the success response from the server
      //     console.log('Success:', response);
      //   },
      //   error: function(error) {
      //     // Handle errors
      //     console.log('Error:', error);
      //       }
      //     });
      //   });


        // -----

      //   $('#resetPasswordForm').submit(function(e) {
      // // Prevent the default form submission
      // e.preventDefault();

      // // Serialize form data into a query string
      // var formData = $(this).serialize();

      // // Make a POST request using jQuery AJAX
      // $.ajax({
      //   type: 'POST',
      //   url: '${pageContext.request.contextPath}/update',
      //   data: formData,
      //   success: function(response) {
      //     // Handle the success response from the server
      //     console.log('Success:', response);
      //   },
      //   error: function(error) {
      //     // Handle errors
      //     console.log('Error:', error);
      //       }
      //     });
      //   });

      //   $('#success_resetPassForm').submit(function(e) {
      // // Prevent the default form submission
      // e.preventDefault();

      // // Serialize form data into a query string
      // var formData = $(this).serialize();

      // // Make a POST request using jQuery AJAX
      // $.ajax({
      //   type: 'POST',
      //   url: '${pageContext.request.contextPath}/alert',
      //   data: formData,
      //   success: function(response) {
      //     // Handle the success response from the server
      //     console.log('Success:', response);
      //   },
      //   error: function(error) {
      //     // Handle errors
      //     console.log('Error:', error);
      //       }
      //     });
      //   });

      //   $('#sign-upForm').submit(function(e) {
      // // Prevent the default form submission
      // e.preventDefault();

      // // Serialize form data into a query string
      // var formData = $(this).serialize();

      // // Make a POST request using jQuery AJAX
      // $.ajax({
      //   type: 'POST',
      //   url: '${pageContext.request.contextPath}/registration',
      //   data: formData,
      //   success: function(response) {
      //     // Handle the success response from the server
      //     console.log('Success:', response);
      //   },
      //   error: function(error) {
      //     // Handle errors
      //     console.log('Error:', error);
      //       }
      //     });
      //   });

      //   $('#success_sign-upForm').submit(function(e) {
      // // Prevent the default form submission
      // e.preventDefault();

      // // Serialize form data into a query string
      // var formData = $(this).serialize();

      // // Make a POST request using jQuery AJAX
      // $.ajax({
      //   type: 'POST',
      //   url: '${pageContext.request.contextPath}/alert',
      //   data: formData,
      //   success: function(response) {
      //     // Handle the success response from the server
      //     console.log('Success:', response);
      //   },
      //   error: function(error) {
      //     // Handle errors
      //     console.log('Error:', error);
      //       }
      //     });
      //   });
      });
    </script>
    <!-- Script Section End -->
  </body>
</html>

