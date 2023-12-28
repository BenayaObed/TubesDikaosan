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
      <c:if test="${not empty message}">
                    <div class="alert alert-danger my-2" role="message">
                        ${message}
                  </div>
              </c:if>
      <div class="row">
        <div class="col-12 d-flex ">
          <div class="col-sm-6  ">
            <form action="${pageContext.request.contextPath}/updateCart" method="POST">
            <div class="col-sm-12 ">
              <div class="fontSize">
                <div class="container activity-head offset mx-4 my-1 w-100" >
                  <div class="row">
                    <div class="col d-flex flex-column my-lg-3 mx-5">
                      <div class="row mx-5 " style="overflow-y: hidden;">
                        <div class="col-sm-6 d-flex flex-column font-weight-bold"style="font-weight: bold;">
                          <a1>PRODUCT</a1>
                        </div>
                        <div class="MID col-sm-3    d-flex flex-column justify-content-end align-items-end font-weight-bold " style="font-weight: bold;">
                          <a1>QUANTITY</a1>
                        </div>
                        <div class="MID col-sm-3 d-flex flex-column justify-content-end align-items-end"style="font-weight: bold;">
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
                  <!-- if data_cart size 0 / null show message -->
                  <c:choose>
                    <c:when test="${empty data_cart}">
                          Barang tidak ada!
                    </c:when>
                    <c:otherwise>
                      <c:forEach items="${data_cart}" var="item" varStatus="loop">
                    <div class="row">
                      <div class="bord">
                        <div class="col d-flex flex-column my-lg-3">
                          <div class="row">
                            <!-- photo dan harga -->
                            <div class="col-sm-6 d-flex flex-column ">
                              <div class="row">
                                <div class="col-sm-4 d-flex flex-column">
                                  <img class="images" src="${pageContext.request.contextPath}/resources/uploads/images/products/${item.product_id.images[0].image}" alt="${item.product_id.images[0].image}">
                                </div>
                                <div class="harga col-sm-8 d-flex flex-column">
                                  <input type="hidden" name="order_item_id" value="${item.order_item_id}">
                                  <input type="hidden" name="product_id" value="${item.product_id.product_id}">
                                  <p>${item.product_id.name_product} ( ${item.size}, ${item.color} )</p>
                                  <p style="font-weight: bold;" class="price">
                                    RP ${item.product_id.price}
                                  </p> <!-- harga -->
                                </div>
                              </div>
                            </div>
                            <!-- quantity -->
                            <div class="number-size col-sm-2 d-flex flex-column mt-3 pt-3 justify-content-center align-items-center ">
                              <div class="container">
                                <div class="number-input">
                                  <button type="button" class="col-sm-4 btn minus" data-index="${loop.index}">-</button>
                                  <input class="col-sm-4 quantity-input" type="text" value="${item.quantity}" data-index="${loop.index}" readonly name="quantity">
                                  <button type="button" class="col-sm-4 btn plus" data-index="${loop.index}">+</button>
                                </div>
                              </div>
                            </div>
                            <!-- total -->
                            <div class="col-sm-3 d-flex flex-column justify-content-center align-items-center">
                              <div class="jumlah_check col-sm-12 flex-column-reverse">
                                <p style="font-weight: bold;" class="total-price" data-index="${loop.index}">RP ${item.product_id.price}</p> <!-- total harga -->
                              </div>
                            </div>
                            <!-- delete -->
                            <div class="col-sm-1 d-flex  align-items-center  p-0" style="align-content: start;">
                              <a href="${pageContext.request.contextPath}/deleteCart?item-cart=${item.order_item_id}" class="btn btn-danger btn-sm">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"/>
                                  <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"/>
                                </svg>
                              </a>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </c:forEach>
                    </c:otherwise>
                  </c:choose>
                </div>
              </div>
            </div>
            <div class="footer_checkout col-sm-12 justify-content-center">
              <div class="container activity-foot offset mx-3 w-100 ">
                <div class="row">
                  <div class="col d-flex flex-column my-lg-3 ">
                    <div class="row">
                      <div class="button_continue_shoping col-sm-9 d-flex flex-column">
                        <a href="${pageContext.request.contextPath}/shop" class="btn btn-add-cart d-flex justify-content-center align-items-center">Continue Shoping</a>
                      </div>
                      <div class="button_update_cart col-sm-3 d-flex flex-column">
                        <button type="submit" class="btn btn-add-cart d-flex justify-content-center align-items-center " ${empty data_cart ? 'disabled' : ''}>Update Cart</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </form>
          </div>

          <div class="col-sm-6  ">
            <div class="fontSize">
            <div class="your_order col-sm-10 d-flex flex-column activity-right offset mx-5 w-60 ">
              <p style="font-weight: bold; font-size: large;">BILLING DETAILS</p>
              <form action="${pageContext.request.contextPath}/setBillingAddress" method="POST">
                <!-- order_id -->
                <input type="hidden" name="orders_id" value="${order_id}">
              <div class="row">
                <div class="col d-flex flex-column my-lg-3 ">
                  <div class="row">
                    <div class="col-sm-6 d-flex flex-column ">
                      <p>First name <span style="color: red;">*</span></p>
                      <span class="input-search">
                        <input class="inpt form" type="text" name="first_name" id="first_name" value="${sessionScope.user.first_name}" placeholder="${sessionScope.user.first_name}" readonly>
                    </span>
                    </div>
                    <div class="col-sm-6 d-flex flex-column">
                      <p>Last Name <span style="color: red;">*</span></p>
                      <span class="input-search">
                        <input class="inpt form" type="text" name="first_name" id="first_name" value="${sessionScope.user.last_name}" placeholder="${sessionScope.user.last_name}" readonly>
                      </span>
                    </div>
                  </div>
                    <div class="col-sm-12 d-flex flex-column  my-3">
                      <p>Address <span style="color: red;">*</span></p>
                      <span class="input-search">
                        <input class="inpt form" type="text" name="address" id="address" placeholder="Street Address">
                      </span>
                      <div class="my-2"></div>
                    </div>
                    </div>
                  </div>
                    <div class="col-sm-12 d-flex flex-column  my-3 ">
                      <p>Town/City <span style="color: red;">*</span></p>
                      <span class="input-search">
                        <input class="inpt form" type="text" name="city" id="city" placeholder="">
                      </span>

                    </div>
                    <div class="col-sm-12 d-flex flex-column  my-3 ">
                      <p>Province <span style="color: red;">*</span></p>
                      <span class="input-search">
                        <input class="inpt form" type="text" name="province" id="province" placeholder="">
                      </span>
                      
                    </div>
                    <div class="col-sm-12 d-flex flex-column  my-3 ">
                      <p>Post Code/ZIP <span style="color: red;">*</span></p>
                      <span class="input-search">
                        <input class="inpt form" type="text" name="postal_code" id="postal_code" placeholder="">
                      </span>
                      
                    </div>
                    <div class="col-sm-6 d-flex flex-column  my-3 ">
                      <p>Phone <span style="color: red;">*</span></p>
                      <span class="input-search">
                        <input class="inpt form" type="text" name="phone_number" id="phone_number" placeholder="">
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
                      <input class="inpt form" type="text" name="notes" id="notes" placeholder="">
                    </span>
                    
                  </div>
                  <div class="button_confirm col d-flex flex-column align-items-center my-3 ">
                    <!-- <a href="${pageContext.request.contextPath}/checkout" class="btn btn_confirm d-flex justify-content-center align-items-center">Confirm & go to Payment</a> -->
                    <button type="submit" class="btn btn_confirm d-flex justify-content-center align-items-center">Confirm & go to Payment</button>
                  </div>
                  </form>
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
                            <script>
                              $(document).ready(function () {
                                  $('.plus').on('click', function () {
                                    var index = $(this)
                                    updateQuantity(index, 'plus');
                                  });

                                  $('.minus').on('click', function () {
                                    var index = $(this)
                                    updateQuantity(index, 'minus');
                                  });
                                });

                                function updateQuantity(element, action) {
                                  var index = element.data('index');
                                  var inputSelector = '.quantity-input[data-index="' + index + '"]';
                                  var quantityInput = $(inputSelector);
                                  var currentQuantity = parseInt(quantityInput.val());

                                  var priceSelector = '.harga.col-sm-8 p.price';
                                  var priceElement = $('.total-price[data-index="' + index + '"]');
                                  var itemPrice = parseFloat($(element).closest('div.row').find('p.price').text().replace('RP', ''));
                                  if (action === 'plus') {
                                    currentQuantity++;
                                  } else if (action === 'minus' && currentQuantity > 1) {
                                    currentQuantity--;
                                  }

                                  quantityInput.val(currentQuantity);

                                  // Update the total based on quantity and price
                                  var total = currentQuantity * itemPrice;

                                  console.log(itemPrice);
                                  priceElement.text('RP ' + total);

                                  // If the quantity becomes 0, you might want to remove the item or handle it accordingly
                                  if (currentQuantity === 0) {
                                    // ?
                                  }
                                }



                            </script>
                            
                            
  </body>
</html>