<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
  <head>
    <title>Checkout</title>
    <%@ include file = "../../includes/FE_includes/_header.jsp" %>
  </head>
  <body>
    <!-- Navbar Section Start -->
    <%@ include file = "../../includes/FE_includes/_navbar.jsp" %>
    <!-- Navbar Section End -->

    <!-- Activity Information Start-->
    <section class="activity">
      <div class="activity_page ">
        <div class="container activity-cont offset mx-1">
          <div class="row">
            <div class="col-sm-12 ">
              <div class="activity-nav offset-mx-1 ">
                <h1>Checkout</h1>
                <a class="nav-link" href="./homepage.html" >Home 
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                  </svg>  
                  <a class="nav-link" href="./shop.html">Shop 
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                      <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                    </svg>
                    <a class="nav-link" href="shoping_cart.html">Shoping Cart 
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                      </svg>
                  <!-- <i class="bi bi-chevron-right"></i> -->
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
        <div class="col-12 d-flex border-primary">
          <div class="col-sm-6 ">

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
            <!-- container produk checkout -->
            <div class="col-sm-12 ">
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
                                <img class="images" src="./picture/Home/Produk/G1.jpg" alt="" >
                              </div>
                              <div class = "harga col-sm-8 d-flex flex-column ">
                                <a1>Man Kimono Set</a1>
                                <a1 style="font-weight: bold;">RP 250.000</a1>
                              </div>
                            </div>    
                          </div>
                      <!-- quantitity -->
                          <div class="number-size col-sm-3 d-flex flex-column">
                            <div class="container">
                              <div class="number-input">
                                <button id="minus" class="col-sm-4 btn "><</button>
                                <input class="col-sm-4" type="text" id="number" value="0">
                                <button id="plus" class="col-sm-4 btn ">></button>
                              </div>
                            </div>
                      
                            <script>
                              // JavaScript to handle the plus and minus functionality
                              document.getElementById("plus").addEventListener("click", function() {
                                var numberInput = document.getElementById("number");
                                numberInput.value = parseInt(numberInput.value) + 1;
                              });
                          
                              document.getElementById("minus").addEventListener("click", function() {
                                var numberInput = document.getElementById("number");
                                if (parseInt(numberInput.value) > 0) {
                                  numberInput.value = parseInt(numberInput.value) - 1;
                                }
                              });
                            </script>
                          
                            <!-- Include Bootstrap JS and jQuery (required for Bootstrap) -->
                            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
                            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
                </div>
              </div>
            </div>
    
            <div class="col-sm-12 ">
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
                                <img class="images" src="./picture/Home/Produk/G2.jpg" alt="" >
                              </div>
                              <div class = "harga col-sm-8 d-flex flex-column ">
                                <a1>Reebok M1 Shoes</a1>
                                <a1 style="font-weight: bold;">RP 699.999</a1>
                              </div>
                            </div>    
                          </div>
                          <!-- quantitity -->
                          <div class="number-size col-sm-3 d-flex flex-column">
                            <div class="container">
                              <div class="number-input">
                                <button id="minus" class="col-sm-4 btn "><</button>
                                <input class="col-sm-4" type="text" id="number" value="0">
                                <button id="plus" class="col-sm-4 btn ">></button>
                              </div>
                            </div>
                  
                            <script>
                              // JavaScript to handle the plus and minus functionality
                              document.getElementById("plus").addEventListener("click", function() {
                                var numberInput = document.getElementById("number");
                                numberInput.value = parseInt(numberInput.value) + 1;
                              });
                          
                              document.getElementById("minus").addEventListener("click", function() {
                                var numberInput = document.getElementById("number");
                                if (parseInt(numberInput.value) > 0) {
                                  numberInput.value = parseInt(numberInput.value) - 1;
                                }
                              });
                            </script>
                  
                              <!-- Include Bootstrap JS and jQuery (required for Bootstrap) -->
                              <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                              <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
                              <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                          </div>
                  <!-- total -->
                          <div class="col-sm-3 d-flex flex-column ">
                            <div class = "jumlah_check col-sm-12 flex-column-reverse">
                              <a1 style="font-weight: bold;">RP 699.999</a1>
                            </div>
                          </div>
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
                  <div class ="row">
                    <div class = bord>
                      <div class = "col d-fex flex-column my-lg-3">
                        <div class = "row">
                        <!-- photo dan harga -->
                          <div class="col-sm-6 d-flex flex-column">
                            <div class =row>
                              <div class="col-sm-4 d-flex flex-column">
                                <img class="images" src="./picture/Home/Produk/G4.jpg" alt="" >
                              </div>
                              <div class = "harga col-sm-8 d-flex flex-column ">
                                <a1>Black Glasses</a1>
                                <a1 style="font-weight: bold;">RP 149.999</a1>
                              </div>
                            </div>    
                          </div>
                          <!-- quantitity -->
                          <div class="number-size col-sm-3 d-flex flex-column">
                            <div class="container">
                              <div class="number-input">
                                <button id="minus" class="col-sm-4 btn "><</button>
                                <input class="col-sm-4" type="text" id="number" value="0">
                                <button id="plus" class="col-sm-4 btn ">></button>
                              </div>
                            </div>
                      
                            <script>
                              // JavaScript to handle the plus and minus functionality
                              document.getElementById("plus").addEventListener("click", function() {
                                var numberInput = document.getElementById("number");
                                numberInput.value = parseInt(numberInput.value) + 1;
                              });
                          
                              document.getElementById("minus").addEventListener("click", function() {
                                var numberInput = document.getElementById("number");
                                if (parseInt(numberInput.value) > 0) {
                                  numberInput.value = parseInt(numberInput.value) - 1;
                                }
                              });
                            </script>
                          
                            <!-- Include Bootstrap JS and jQuery (required for Bootstrap) -->
                            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
                            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                          </div>
                          <!-- total -->
                          <div class="col-sm-3 d-flex flex-column ">
                            <div class = "jumlah_check col-sm-12 flex-column-reverse">
                              <a1 style="font-weight: bold;">RP 149.999</a1>
                            </div>
                          </div>
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
                  <div class ="row">
                    <div class = bord>
                      <div class = "col d-fex flex-column my-lg-3">
                        <div class = "row">
                          <!-- photo dan harga -->
                          <div class="col-sm-6 d-flex flex-column">
                            <div class =row>
                              <div class="col-sm-4 d-flex flex-column">
                                <img class="images" src="./picture/Home/Produk/G5.jpg" alt="" >
                              </div>
                              <div class = "harga col-sm-8 d-flex flex-column ">
                                <a1>School Bag</a1>
                                <a1 style="font-weight: bold;">RP 119.999</a1>
                              </div>
                            </div>    
                          </div>
                          <!-- quantitity -->
                          <div class="number-size col-sm-3 d-flex flex-column">
                            <div class="container">
                              <div class="number-input">
                                <button id="minus" class="col-sm-4 btn "><</button>
                                <input class="col-sm-4" type="text" id="number" value="0">
                                <button id="plus" class="col-sm-4 btn ">></button>
                              </div>
                            </div>
                      
                            <script>
                              // JavaScript to handle the plus and minus functionality
                              document.getElementById("plus").addEventListener("click", function() {
                                var numberInput = document.getElementById("number");
                                numberInput.value = parseInt(numberInput.value) + 1;
                              });
                          
                              document.getElementById("minus").addEventListener("click", function() {
                                var numberInput = document.getElementById("number");
                                if (parseInt(numberInput.value) > 0) {
                                  numberInput.value = parseInt(numberInput.value) - 1;
                                }
                              });
                            </script>
                          
                            <!-- Include Bootstrap JS and jQuery (required for Bootstrap) -->
                            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
                            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                          </div>
                          <!-- total -->
                          <div class="col-sm-3 d-flex flex-column ">
                            <div class = "jumlah_check col-sm-12 flex-column-reverse">
                              <a1 style="font-weight: bold;">RP 119.999</a1>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- container produk checkout END -->

            <!-- footer checkout -->
            <div class="footer_checkout col-sm-12 justify-content-center">
              <div class="container activity-foot offset mx-3 w-100 ">
                <div class="row">
                  <div class="col d-flex flex-column my-lg-3 ">
                    <div class="row">
                      <div class="button_continue_shoping col-sm-6 d-flex flex-column">
                        <a href="" class="btn btn-add-cart d-flex justify-content-center align-items-center">Continue Shoping</a>
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
                      <p>Man Kimono Set</p>
                      <p>Reebok M1 Shoes</p>
                      <p>Black Glasses</p>
                      <p>School Bag</p>
                    </div>
                    <div class="col-sm-6 d-flex flex-column  align-items-end my-1  ">
                      <p>Rp 299.999</p>
                      <p>Rp 699.999</p>
                      <p>Rp 149.999</p>
                      <p>Rp 119.999</p>
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
                    <label class="form-check-label" for="validationFormCheck1">Transfer Bank</label>
                    <div class="valid-feedback"> 
                    
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                        <img src="/TubesDikaosan/Front End/picture/Home/38.png">
                        <label class="form-check-label" for="flexRadioDefault1">
                          Bank Central Asia
                        </label>
                      </div>
        
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                        <label class="form-check-label" for="flexRadioDefault1">
                          Bank Negara Indonesia
                        </label>
                      </div>
        
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                        <img src="/TubesDikaosan/Front End/picture/Home/39.png">
                        <label class="form-check-label" for="flexRadioDefault1">
                          Bank Rakyat Indonesia
                        </label>
                      </div>
        
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                        <img src="/TubesDikaosan/Front End/picture/Home/41.png">
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
                      <a href="./payment.html" class="btn btn_confirm d-flex justify-content-center align-items-center">Confirmation Payment</a>

                      </div>

                    </div>
                  </div>
              </div>
            </div>
            </div>
    </section>
    <!-- Content Checkout End -->

    <!-- Footer Section Start -->
    <%@ include file = "../../includes/FE_includes/_footer.jsp" %>
    <!-- Footer Section End-->
    
    <!-- Script Section Start -->
    <%@ include file = "../../includes/FE_includes/_scripts.jsp" %>
    <!-- Script Section End -->
  </body>
</html>