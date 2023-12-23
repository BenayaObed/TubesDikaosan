<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="session" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
  <head>
    <title>Checkout</title>
    <%@ include file = "../../includes/fe_includes/_header.jsp" %>
  </head>
  <body>
    <!-- Navbar Section Start -->
    <%@ include file = "../../includes/fe_includes/_navbar.jsp" %>
    <!-- Navbar Section End -->

    <!-- Activity Information Start-->
    <section class="activity">
      <div class="activity_page ">
        <div class="container activity-cont offset mx-1">
          <div class="row">
            <div class="col-sm-12 ">
              <div class="activity-nav offset-mx-1 ">
                <h1>Checkout</h1>
                <a class="nav-link m-0" href="${pageContext.request.contextPath}/home" >Home 
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                  </svg>  
                  <a class="nav-link m-0" href="${pageContext.request.contextPath}/shop">Shop 
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                      <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                    </svg>
                    <a class="nav-link m-0" href="${pageContext.request.contextPath}/shoping_cart">Shoping Cart 
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                      </svg>
                  <!-- <i class="bi bi-chevron-right"></i> -->
                  <a class="nav-link m-0" href="${pageContext.request.contextPath}/checkout" style="text-decoration: none;">
                  <span>Checkout</span>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Activity Information End-->

    <!-- Content Checkout Start-->
    <section class="content">
      <div class="row">
        <div class="col-12 d-flex">
          <div class="col-sm-6 ">

            <div class="row ">
              <div class="fontSize">
                <div class="container activity-image offset mx-4 my-1 w-100" >
                    <div class="col d-flex flex-column my-lg-3 p-3">
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
            <!-- container produk checkout -->
            <div class="col-sm-12">
              <c:forEach items="${products}" var="item">
                <c:if test="${(item.visible == 1)}">
                  <c:if test="${(item.category.visible == 1)}">
                    <div class="col-sm-12">
                      <div class="fontSize">
                        <div class = "container activity-image offset mx-4 w-100">
                          <div class ="row">
                            <div class = bord>
                              <div class = "col d-fex flex-column my-lg-3">
                                <div class = "row">
                            <!-- photo dan harga -->
                                  <div class="col-sm-6 d-flex flex-column">
                                    <div class =row>
                                      <div class="col-sm-4 d-flex flex-column">
                                        <img class="images" src="${pageContext.request.contextPath}/resources/uploads/images/products/${item.images[0 ].image}" />
                                      </div>
                                      <div class = "harga col-sm-8 d-flex flex-column ">
                                        <p>${item.name_product}</p>
                                        <p style="font-weight: bold;"><fmt:formatNumber value="${item.price}" type="currency" currencyCode="IDR" /></p>
                                      </div>
                                    </div>    
                                  </div>
                              <!-- quantitity -->
                                  <div class="col-sm-3 d-flex flex-column justify-content-center align-items-center">
                                    <div class="container">
                                      <div class="number-input">
                                        <button id="minus" class="col-sm-4 btn "><</button>
                                        <input class="col-sm-4" type="text" id="number" value="0">
                                        <button id="plus" class="col-sm-4 btn ">></button>
                                      </div>
                                    </div>
                              
                                    <!-- Script Section Start -->
                                    <%@ include file = "../../includes/fe_includes/_script.jsp" %>
                                    <!-- Script Section End-->
                                  
                                    <!-- Include Bootstrap JS and jQuery (required for Bootstrap) -->
                                    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
                                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                                  </div>
                              <!-- total -->
                                  <div class="col-sm-3 d-flex flex-column ">
                                    <div class = "jumlah_check col-sm-12 flex-column-reverse">
                                      <p style="font-weight: bold;"><fmt:formatNumber value="${item.price}" type="currency" currencyCode="IDR" /></p>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </c:if>
                </c:if>
              </c:forEach>
            </div>
    

            <!-- container produk checkout END -->

            <!-- footer checkout -->
            <div class="footer_checkout col-sm-12 justify-content-center">
              <div class="container activity-foot offset mx-3 w-100 ">
                <div class="row">
                  <div class="col d-flex flex-column my-lg-3 ">
                    <div class="row">
                      <div class="button_continue_shoping col-sm-6 d-flex flex-column">
                        <a href="${pageContext.request.contextPath}/shop" class="btn btn-add-cart d-flex justify-content-center align-items-center">Continue Shoping</a>
                      </div>
                      <div class="button_update_cart col-sm-6 d-flex flex-column align-items-end ">
                          <a href="${pageContext.request.contextPath}/checkout" class="btn btn-add-cart d-flex justify-content-center align-items-center">Update Cart</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- footer checkout END-->

          <!-- right bar checkout-->
          <div class="col-sm-6 mx-5 ">
            <div class="fontSize">
            <div class="your_order col-sm-6 d-flex flex-column activity-right offset mx-5 w-60 ">
              <p style="font-weight: bold; font-size: large;">YOUR ORDER</p>
              <div class="row">
                <div class="col">
                  <div class="row ">
                    <div class="col-sm-6 ">
                      <p class="m-0 p-0" style="font-weight: bold; font-size: large;">Product</p>
                    </div>
                    <div class="col-sm-6 d-flex flex-column  align-items-end">
                      <p class="m-0 p-0" style="font-weight: bold; font-size: large;">Total</p>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6 d-flex flex-column my-1 ">
                      <ol class="list list-group-numbered p-0">
                        <li class="list-group-item">Man Kimono Set</li>
                        <li class="list-group-item">Reebok M1 Shoes</li>
                        <li class="list-group-item">Black Glasses</li>
                        <li class="list-group-item">School Bag</li>
                      </ol>
                    </div>
                    <div class="col-sm-6 d-flex flex-column  align-items-end my-1  ">
                      <ul class="list list-group-flush text-end">
                        <li class="list-group-item">Rp 249.999</li>
                        <li class="list-group-item">Rp 699.999</li>
                        <li class="list-group-item">Rp 149.999</li>
                        <li class="list-group-item">Rp 119.999</li>
                    </ul>
                    </div>
                  </div>
                </div>
              </div>
              <div class="">
                <div class="col d-flex flex-column my-lg-3 ">
                  <div class="row">
                    <div class="col-sm-6 d-flex flex-column">
                      <p class="m-0 p-0" style="font-weight: bold; font-size: large;">Total</p>
                    </div>
                    <div class="col-sm-6 d-flex flex-column  align-items-end">
                      <p class="m-0 p-0" style="color: red; font-weight: bold; font-size: large;">Rp 1.219.999</p>
                    </div>
                  </div>
                </div>
              </div>

              <div class="checkbox ">
                <form class="was-validated">
                  
                  <!-- Bank -->
                  <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="validationFormCheck1" required>
                    <label class="form-check-label" for="validationFormCheck1">
                      Transfer Bank
                    </label>
                    <div class="valid-feedback"> 
                    
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                        <img src="/resources/images/38.png">
                        <label class="form-check-label" for="flexRadioDefault1">
                          Bank Central Asia
                        </label>
                      </div>
        
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                        <img src="/resources/images/40.png">
                        <label class="form-check-label" for="flexRadioDefault1">
                          Bank Negara Indonesia
                        </label>
                      </div>
        
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                        <img src="/resources/images/39.png">
                        <label class="form-check-label" for="flexRadioDefault1">
                          Bank Rakyat Indonesia
                        </label>
                      </div>
        
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                        <img src="/resources/images/41.png">
                        <label class="form-check-label" for="flexRadioDefault1">
                          Bank Mandiri
                        </label>
                      </div>
                    </div>
                  </div>
                  
                  <!-- COD -->
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                    <label class="form-check-label" for="flexCheckChecked">
                      Cash On Delivery
                    </label>
                  </div>
                
                </form>
              </div>
            
                    <div class="button_confirm col d-flex flex-column align-items-center my-3 ">
                      <a href="${pageContext.request.contextPath}/payment" class="btn btn_confirm d-flex justify-content-center align-items-center">Confirmation Payment</a>

                      </div>

                    </div>
                  </div>
              </div>
            </div>
            </div>
    </section>
    <!-- Content Checkout End -->

    <!-- Footer Section Start -->
    <%@ include file = "../../includes/fe_includes/_footer.jsp" %>
    <!-- Footer Section End-->
    
    <!-- Script Section Start -->
    <%@ include file = "../../includes/fe_includes/_scripts.jsp" %>
    <!-- Script Section End -->
  </body>
</html>