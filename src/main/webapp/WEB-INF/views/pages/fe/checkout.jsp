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
        <div class="col-12 d-flex ">
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
              <c:forEach items="${data_cart}" var="item">
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
                                        <img class="images" src="${pageContext.request.contextPath}/resources/uploads/images/products/${item.product_id.images[0].image}" />
                                      </div>
                                      <div class = "harga col-sm-8 d-flex flex-column ">
                                        <p>${item.product_id.name_product}</p>
                                        <p style="font-weight: bold;">
                                          ${item.product_id.price}
                                        </p>
                                      </div>
                                    </div>    
                                  </div>
                              <!-- quantitity -->
                                  <div class="col-sm-3 d-flex flex-column justify-content-center align-items-center">
                                    <div class="container">
                                      <div class="number-input">
                                        <input class="col-sm-4" type="text" id="number" value="${item.quantity}" readonly>
                                      </div>
                                    </div>
                                  </div>
                              <!-- total -->
                                  <div class="col-sm-3 d-flex flex-column ">
                                    <div class = "jumlah_check col-sm-12 flex-column-reverse">
                                      <p style="font-weight: bold;">
                                        ${item.total_price}
                                      </p>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
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
                      <div class="button_update_cart col-sm-6 d-flex flex-column align-items-end">
                        <form action="${pageContext.request.contextPath}/cancelOrder" method="post">
                          <input type="hidden" name="order_id" value="${order_id}">
                          <button type="submit" class="btn btn-add-cart d-flex justify-content-center align-items-center">Cancel Order</button>
                        </form>
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
                          <c:forEach items="${data_cart}" var="item">
                            <li class="list-group-item">${item.product_id.name_product}</li>
                          </c:forEach>
                      </ol>
                    </div>
                    <div class="col-sm-6 d-flex flex-column  align-items-end my-1  ">
                      <ul class="list list-group-flush text-end">
                        <c:forEach items="${data_cart}" var="item">
                          <li class="list-group-item">${item.total_price}</li>
                        </c:forEach>
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
                      <p class="m-0 p-0" style="color: red; font-weight: bold; font-size: large;">Rp ${total}</p>
                    </div>
                  </div>
                </div>
              </div>

              <form class="was-validated" action="${pageContext.request.contextPath}/payment" method="post">
              <input type="hidden" name="total" value="${total}">
              <div class="checkbox ">
                  
                  <!-- Bank -->
                  <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="validationFormCheck1" name="method">
                    <label class="form-check-label" for="validationFormCheck1">
                      Transfer Bank
                    </label>
                    <div class="valid-feedback"> 
                    
                      <c:forEach items="${paymentMethods}" var="item">
                        <div class="form-check">
                          <input class="form-check-input" type="radio" name="bank" id="${item.payment_method_name}" value="${item.id}">
                          <label class="form-check-label" for="${item.payment_method_name}">
                            ${item.payment_method_name}
                          </label>
                        </div>
                      </c:forEach>
                    </div>
                  </div>
                  
                  <!-- COD -->
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="COD" id="flexCheckChecked" name="method">
                    <label class="form-check-label" for="flexCheckChecked">
                      Cash On Delivery
                    </label>
                  </div>
                

              </div>
            
                    <div class="button_confirm col d-flex flex-column align-items-center my-3 ">
                      <!-- <a href="${pageContext.request.contextPath}/payment" class="btn btn_confirm d-flex justify-content-center align-items-center">Confirmation Payment</a> -->
                      <button type="submit" class="btn btn_confirm d-flex justify-content-center align-items-center">Confirmation Payment</button>
                    </div>

                    </div>
                  </div>
                </form>

              </div>
            </div>
            </div>
    </section>
    <!-- Content Checkout End -->
    <c:if test="${not empty alert}">
      <script>
        alert("${alert}")
      </script>
    </c:if>
    <!-- Footer Section Start -->
    <%@ include file = "../../includes/fe_includes/_footer.jsp" %>
    <!-- Footer Section End-->
    
    <!-- Script Section Start -->
    <%@ include file = "../../includes/fe_includes/_scripts.jsp" %>
    <!-- Script Section End -->

    <!-- Include Bootstrap JS and jQuery (required for Bootstrap) -->
                            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
                            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                            <script>
                              $(document).ready(function () {
  $('.plus').on('click', function () {
    var index = $(this).data('index');
    updateQuantity(index, 'plus');
  });

  $('.minus').on('click', function () {
    var index = $(this).data('index');
    updateQuantity(index, 'minus');
  });
});

function updateQuantity(index, action) {
  var inputSelector = '.quantity-input[data-index="' + index + '"]';
  var quantityInput = $(inputSelector);
  var currentQuantity = parseInt(quantityInput.val());

  var priceSelector = '.harga.col-sm-8 p.price'; // Corrected price selector
  var priceElement = $('.total-price[data-index="' + index + '"]');
  var itemPrice = parseInt($(priceSelector).text().replace('IDR', '')); // Corrected price selector
  if (action === 'plus') {
    currentQuantity++;
  } else if (action === 'minus' && currentQuantity > 1) {
    currentQuantity--;
  }

  quantityInput.val(currentQuantity);

  // Update the total based on quantity and price
  var total = currentQuantity * itemPrice;

  console.log(total);
  priceElement.text('IDR ' + total.toFixed(3));

  // If the quantity becomes 0, you might want to remove the item or handle it accordingly
  if (currentQuantity === 0) {
    // ?
  }
}



                            </script>
  </body>
</html>