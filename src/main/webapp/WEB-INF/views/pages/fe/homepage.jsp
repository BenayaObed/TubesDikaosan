<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="session" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
  
  <!-- Header Section Start -->
  <head>
    <title>Homepage</title>
    <%@ include file = "../../includes/fe_includes/_header.jsp" %>
  </head>
  <!-- Header Section Start -->

  <body>
    <!-- Navbar Section Start -->
    <%@ include file = "../../includes/fe_includes/_navbar.jsp" %>
    <!-- Navbar Section End -->

    <!-- Modal Login Start -->
    <section class="modal">
      <!-- Modal Login -->
      <div class="modal login" id="loginDikaosan" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content login">
            <div class="modal-header title">
              <h1 class="modal-title fs-5" id="loginDikaosan">Welcome to Dikaosan!</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form id="loginForm">
                <div class="row email">
                  <a>Email address</a>
                  <span class="input-Email">
                    <input class="form-control Email" type="text" name="Email" id="Email" placeholder="Enter email">
                  </span>
                </div>
                
                <div class="row password">
                  <a>Password</a>
                  <span class="input-password">
                    <input class="form-control password" type="text" name="password" id="password" placeholder="Enter password">
                  </span>
                </div>
                
                <div class="row forget_pass text-end">
                  <a1 href="#" data-bs-toggle="modal" data-bs-target="#reset-PasswordDikaosan" >Forgot password?</a1>
                </div>  
                
                <div class="row justify-content-center sign_up text-center">
                  <button type="submit" class="btn btn-primary confirm_btn w-50">Login</button>
                  <a class="my-1 " style="text-decoration: none;">Don't have an account? <span class="sign-up_btn" data-bs-toggle="modal" data-bs-target="#Sign-UpDikaosan"> <b>Sign Up</b></span></a>
                </div>
              </form>
              
            

            </div>
            <div class="modal-footer">
            </div>
          </div>
        </div>
      </div>

      <!-- Modal Reset Password -->
      <div class="modal reset_password" id="reset-PasswordDikaosan" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content login">
            <div class="modal-header title">
              <h1 class="modal-title fs-5" id="loginDikaosan">Change Password</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form id="resetPasswordForm">
                <div class="row oldPass">
                  <a>Old Password</a>
                  <span class="input-oldPass">
                    <input class="form-control oldPass" type="text" name="oldPass" id="oldPass" placeholder="">
                  </span>
                </div>
                
                <div class="row newPass">
                  <a>New Password</a>
                  <span class="input-newPass">
                    <input class="form-control newPass" type="text" name="newPass" id="newPass" placeholder="">
                  </span>
                </div>

                <div class="row confirmPass">
                <a>Confirm New Password</a>
                <span class="input-confirmPass">
                  <input class="form-control confirmPass" type="text" name="confirmPass" id="confirmPass" placeholder="">
                </span>
                </div>
              
                <div class="row justify-content-center text-center">
                  <button class="btn btn-primary confirm_btn w-50" data-bs-target="#SuccessfullyResetPass" data-bs-toggle="modal">Set Password</button>
                </div>
              </form>
              
            </div>
            <div class="modal-footer">
            </div>
          </div>
        </div>
      </div>

      <!-- Modal Successfully Reset Password -->
      <div class="modal successResetPass" id="SuccessfullyResetPass" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content Sign-Up">
            <div class="modal-header justify-content-center">
              <h1 class="modal-title fs-5" id="Successfully">Welcome to Dikaosan!</h1>
            </div>
            <div class="modal-body">
              <form id="success_resetPassForm">
                <div class="row succes text-center">
                  <a>Your Account Has Been Successfully<br> 
                    Reset Password!
                  </a>
                </div>
                
                <div class="row justify-content-center text-center my-2">
                  <button type="button" class="btn btn-primary confirm_btn_success w-50" data-bs-dismiss="modal" aria-label="Close">Oke</button>
                </div>
              </form>

            </div>
            <div class="modal-footer">
            </div>
          </div>
        </div>
      </div>

      <!-- Modal Sign-Up -->
      <div class="modal sign_up" id="Sign-UpDikaosan" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content Sign-Up">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="Sign-UpDikaosan">Welcome to Dikaosan!</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form id="sign-upForm">
                <div class="row name">
                  <a>Name</a>
                  <span class="input-name">
                    <input class="form-control name" type="text" name="name" id="name" placeholder="Your name">
                  </span>
                </div>
                
                <div class="row phone_number">
                  <a>Phone Number</a>
                  <span class="input-phone_number">
                    <input class="form-control phone_number" type="text" name="phone_number" id="phone_number" placeholder="Your phone number">
                  </span>
                </div>
  
                <div class="row email">
                  <a>Email address</a>
                  <span class="input-Email">
                    <input class="form-control Email" type="text" name="Email" id="Email" placeholder="Enter email">
                  </span>
                </div>
  
                <div class="row password">
                  <a>Password</a>
                  <span class="input-password">
                    <input class="form-control password" type="text" name="password" id="password" placeholder="Enter password">
                  </span>
                  <div id="passwordHelpBlock" class="form-text">
                    Your password must be 8-20 characters long, contain letters and numbers, and must not contain spaces, special characters, or emoji.
                  </div>
                </div>
                
                <div class="row justify-content-center text-center">
                  <button type="button" class = "btn btn-primary confirm_btn w-50" data-bs-target="#Successfully_signUP" data-bs-toggle="modal">Sign Up</button>
                </div>
              </form>
            </div>
            <div class="modal-footer">
            </div>
          </div>
        </div>
      </div>

      <!-- Modal Successfully Sign-Up -->
      <div class="modal success_sign-up" id="Successfully_signUP" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content Sign-Up">
            <div class="modal-header justify-content-center">
              <h1 class="modal-title fs-5" id="Successfully">Welcome to Dikaosan!</h1>
            </div>
            <div class="modal-body">
              <form id="success_sign-upForm">
                <div class="row succes text-center">
                  <a>Your Account Has Been Successfully<br> 
                    Registered!
                  </a>
                </div>
                
                <div class="row justify-content-center text-center my-2">
                  <button type="button" class="btn btn-primary confirm_btn_success w-50" data-bs-dismiss="modal" aria-label="Close" href="${pageContext.request.contextPath}/shop">Shop Now</button>
                </div>
              </form>
            </div>
            <div class="modal-footer">
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Modal Login End -->

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
                <a class="header_shop" href="#">Best Sellers</a>
              </div>
            </div>
            <div class="row">
              <div class="col mx-5">
                <a class="header_shop"  href="#">New Arrivals</a>
              </div>
            </div>
            <div class="row">
              <div class="col mx-5">
                <a class="header_shop"  href="#">Hot Sales</a>
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
                      <a href="${pageContext.request.contextPath}/cart/push?product=${item.product_id}" class="col-1 product-cart d-flex justify-content-center cart p-0 pt-1">
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
      $('#loginForm').submit(function(e) {
      // Prevent the default form submission
      e.preventDefault();

      // Serialize form data into a query string
      var formData = $(this).serialize();

      // Make a POST request using jQuery AJAX
      $.ajax({
        type: 'POST',
        url: '${pageContext.request.contextPath}/authentication',
        data: $('#loginForm').serialize(),
        success: function(response) {
          // Handle the success response from the server
          console.log('Success:', response);
        },
        error: function(error) {
          // Handle errors
          console.log('Error:', error);
            }
          });
        });

        $('#resetPasswordForm').submit(function(e) {
      // Prevent the default form submission
      e.preventDefault();

      // Serialize form data into a query string
      var formData = $(this).serialize();

      // Make a POST request using jQuery AJAX
      $.ajax({
        type: 'POST',
        url: '${pageContext.request.contextPath}/update',
        data: formData,
        success: function(response) {
          // Handle the success response from the server
          console.log('Success:', response);
        },
        error: function(error) {
          // Handle errors
          console.log('Error:', error);
            }
          });
        });

        $('#success_resetPassForm').submit(function(e) {
      // Prevent the default form submission
      e.preventDefault();

      // Serialize form data into a query string
      var formData = $(this).serialize();

      // Make a POST request using jQuery AJAX
      $.ajax({
        type: 'POST',
        url: '${pageContext.request.contextPath}/alert',
        data: formData,
        success: function(response) {
          // Handle the success response from the server
          console.log('Success:', response);
        },
        error: function(error) {
          // Handle errors
          console.log('Error:', error);
            }
          });
        });

        $('#sign-upForm').submit(function(e) {
      // Prevent the default form submission
      e.preventDefault();

      // Serialize form data into a query string
      var formData = $(this).serialize();

      // Make a POST request using jQuery AJAX
      $.ajax({
        type: 'POST',
        url: '${pageContext.request.contextPath}/registration',
        data: formData,
        success: function(response) {
          // Handle the success response from the server
          console.log('Success:', response);
        },
        error: function(error) {
          // Handle errors
          console.log('Error:', error);
            }
          });
        });

        $('#success_sign-upForm').submit(function(e) {
      // Prevent the default form submission
      e.preventDefault();

      // Serialize form data into a query string
      var formData = $(this).serialize();

      // Make a POST request using jQuery AJAX
      $.ajax({
        type: 'POST',
        url: '${pageContext.request.contextPath}/alert',
        data: formData,
        success: function(response) {
          // Handle the success response from the server
          console.log('Success:', response);
        },
        error: function(error) {
          // Handle errors
          console.log('Error:', error);
            }
          });
        });
      });
    </script>
    <!-- Script Section End -->
  </body>
</html>

