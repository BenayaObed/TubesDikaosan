<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="session" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
  <head>
    <title>Shoping Cart</title>
    <%@ include file = "../../includes/fe_includes/_header.jsp" %>
  </head>
  <body>
    <!-- Navbar Section Start -->
    <%@ include file = "../../includes/fe_includes/_navbar.jsp" %>
    <!-- Navbar Section End -->

    <!-- Activity Information Start-->
    <section class="activity">
      <div class="activity_page">
        <div class="container activity-cont offset mx-1">
          <div class="row">
            <div class="col-sm-12 ">
              <div class="activity-nav offset-mx-1 ">
                <h1>Shoping Cart </h1>
                <a class="nav-link" href="${pageContext.request.contextPath}/home" >Home 
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                  </svg>  
                  <a class="nav-link" href="${pageContext.request.contextPath}/shop">Shop 
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                      <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                    </svg>
                  <a  href="${pageContext.request.contextPath}/shoping_cart" style="text-decoration: none;">
                    <span>Shoping Cart </span>
                  </a>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Activity Information End-->
    
    <!-- Shoping_cart Section Start -->
    <section class="content">
      <div class="row">
        <div class="col-12 d-flex border-primary">
          <div class="col-sm-6  ">

            <div class="col-sm-12 ">
              <div class="fontSize">
                <div class="container activity-head offset mx-4 my-1 w-100" >
                  <div class="row">
                    <div class="col d-flex flex-column my-lg-3 ">
                      <div class="row">
                        <div class="col-sm-6 d-flex flex-column font-weight-bold"style="font-weight: bold;">
                          <a1>PRODUCT</a1>
                        </div>
                        <div class="MID col-sm-3 d-flex flex-column font-weight-bold"style="font-weight: bold;">
                          <a1>QUANTITY</a1>
                        </div>
                        <div class="MID col-sm-3 d-flex flex-column"style="font-weight: bold;">
                          <a1>TOTAL</a1>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
    
            <div class="col-sm-12 ">
              <div class="fontSize">
                <div class = "container activity-image offset mx-4 w-100">
                  
                  <c:forEach items="${data_cart}" var="item">
                    <div class ="row">
                    <div class = bord>
                      <div class = "col d-fex flex-column my-lg-3">
                        <div class = "row">
                    <!-- photo dan harga -->
                          <div class="col-sm-6 d-flex flex-column">
                            <div class =row>
                              <div class="col-sm-4 d-flex flex-column">
                                <img class="images" src="${pageContext.request.contextPath}/resources/uploads/images/products/${item.product_id.images[0].image}" alt="" >
                              </div>
                              <div class = "harga col-sm-8 d-flex flex-column ">
                                <p>${item.product_id.name_product}</p>
                                <p style="font-weight: bold;"><fmt:formatNumber value="${item.product_id.price}" type="currency" currencyCode="IDR" /></p>
                              </div>
                            </div>    
                          </div>
                      <!-- quantitity -->
                          <div class="number-size col-sm-3 d-flex flex-column">
                            <div class="container">
                              <div class="number-input">
                                <button id="minus" class="col-sm-4 btn "><</button>
                                <input class="col-sm-4" type="text" id="number" value="${item.quantity}">
                                <button id="plus" class="col-sm-4 btn ">></button>
                              </div>
                            </div>
                          </div>
                      <!-- total -->
                          <div class="col-sm-3 d-flex flex-column ">
                            <div class = "jumlah_check col-sm-12 flex-column-reverse">
                              <a1 style="font-weight: bold;">RP 250.000</a1>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    </div>
                  </c:forEach>
                
                </div>
              </div>
            </div>

            <div class="footer_checkout col-sm-12 justify-content-center">
              <div class="container activity-foot offset mx-3 w-100 ">
                <div class="row">
                  <div class="col d-flex flex-column my-lg-3 ">
                    <div class="row">
                      <div class="button_continue_shoping col-sm-6 d-flex flex-column">
                        <a href="${pageContext.request.contextPath}/shop" class="btn btn-add-cart d-flex justify-content-center align-items-center">Continue Shoping</a>
                      </div>
                      <div class="button_update_cart col-sm-6 d-flex flex-column align-items-end ">
                          <a href="" class="btn btn-add-cart d-flex justify-content-center align-items-center">Update Cart</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-sm-6  ">
            <div class="fontSize">
            <div class="your_order col-sm-10 d-flex flex-column activity-right offset mx-5 w-60 ">
              <p style="font-weight: bold; font-size: large;">BILLING DETAILS</p>

              <div class="row">
                <div class="col d-flex flex-column my-lg-3 ">
                  <div class="row">
                    <div class="col-sm-6 d-flex flex-column ">
                      <p>First name <span style="color: red;">*</span></p>
                      <span class="input-search">
                        <input class="inpt form" type="text" name="first_name" id="first_name" placeholder="">
                    </span>
                    </div>
                    <div class="col-sm-6 d-flex flex-column">
                      <p>Last Name <span style="color: red;">*</span></p>
                      <span class="input-search">
                        <input class="inpt form" type="text" name="first_name" id="first_name" placeholder="">
                      </span>
                    </div>
                  </div>
                    <div class="col-sm-12 d-flex flex-column  my-3">
                      <p>Address <span style="color: red;">*</span></p>
                      <span class="input-search">
                        <input class="inpt form" type="text" name="first_name" id="first_name" placeholder="Street Address">
                      </span>
                      <div class="my-2"></div>
                      <span class="input-search">
                        <input class="inpt form" type="text" name="first_name" id="first_name" placeholder="Apartment, suite, unite ect (optinal)">
                      </span>
                    </div>
                    </div>
                  </div>
                    <div class="col-sm-12 d-flex flex-column  my-3 ">
                      <p>Town/City <span style="color: red;">*</span></p>
                      <span class="input-search">
                        <input class="inpt form" type="text" name="first_name" id="first_name" placeholder="">
                      </span>

                    </div>
                    <div class="col-sm-12 d-flex flex-column  my-3 ">
                      <p>Province <span style="color: red;">*</span></p>
                      <span class="input-search">
                        <input class="inpt form" type="text" name="first_name" id="first_name" placeholder="">
                      </span>
                      
                    </div>
                    <div class="col-sm-12 d-flex flex-column  my-3 ">
                      <p>Post Code/ZIP <span style="color: red;">*</span></p>
                      <span class="input-search">
                        <input class="inpt form" type="text" name="first_name" id="first_name" placeholder="">
                      </span>
                      
                    </div>
                    <div class="col-sm-6 d-flex flex-column  my-3 ">
                      <p>Phone <span style="color: red;">*</span></p>
                      <span class="input-search">
                        <input class="inpt form" type="text" name="first_name" id="first_name" placeholder="">
                      </span>
                      
                    </div>
                    <div class="col-sm-12 d-flex flex-column  my-3 ">
                      <p>Create an account by entering the information below. If you are a returning customer please login at the top of the page</p>
                  </div>
                  <div>
                    <input type="checkbox" class="form-check-input" id="exampleCheck">
                    <label class="form-check-label" for="exampleCheck">Note about your order, e.g, special noe for delivery</label>
                  </div>

                  <div class="col-sm-12 d-flex flex-column  my-3 ">
                    <p>Orde Notes <span style="color: red;">*</span></p>
                    <span class="input-search">
                      <input class="inpt form" type="text" name="first_name" id="first_name" placeholder="">
                    </span>
                    
                  </div>
                  <div class="button_confirm col d-flex flex-column align-items-center my-3 ">
                    <a href="${pageContext.request.contextPath}/checkout" class="btn btn_confirm d-flex justify-content-center align-items-center">Confirm & go to Payment</a>

                    </div>
                </div>
              </div>
                    

                    </div>
                  </div>
              </div>
            </div>
            </div>
    </section>
    <!-- Shoping_cart Section End -->

    <!-- Footer Section Start -->
    <%@ include file = "../../includes/fe_includes/_footer.jsp" %>
    <!-- Footer Section End-->
    
    <!-- script Section Start -->
    <%@ include file = "../../includes/fe_includes/_scripts.jsp" %>
    <!-- script Section End -->
    
                            <!-- Include Bootstrap JS and jQuery (required for Bootstrap) -->
                            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
                            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  </body>
</html>