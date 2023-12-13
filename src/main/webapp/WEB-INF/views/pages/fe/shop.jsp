<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
  <head>
    <title>Shop</title>
    <%@ include file = "../../includes/fe_includes/_header.jsp" %>
  </head>
  <body>

    <!-- Navbar Section Start -->
    <%@ include file = "../../includes/fe_includes/_navbar.jsp" %>
    <!-- Navbar Section End -->

    <!-- Activity Page Section Start -->
    <section class="activity">
      <div class="activity_page">
        <div class="container activity-cont offset mx-1">
          <div class="row">
            <div class="col-sm-12">
              <div class="activity-nav offset-mx-1">
                <h1>Shop</h1>
                <a class="nav-link" href="./homepage.html" style="word-spacing: 2px;">Home 
                  <svg xmlns="http://www.w3.org/2000/svg" width="10" height="12" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                  </svg> 
                  <a href="./shop.html" style="text-decoration: none;">
                    <span>Shop</span>
                  </a> 
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Activity Page Section End -->
    
    <!-- Modal Section Start -->
    <section class="modal">
      <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
        <div class="offcanvas-header">
          <h5 class="offcanvas-title" id="offcanvasRightLabel">Edit Profil</h5>
          <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body w-100">
          <div class="mb-3 row">
            <label for="staticEmail" class="col-sm-2 col-form-label">Nama:</label>
            <div class="col-sm-10">
              <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="Velman Harefa">
            </div>
  
            <label for="staticEmail" class="col-sm-2 col-form-label">Nama:</label>
            <div class="col-sm-10">
              <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="Velman Harefa">
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Modal Section End -->
    
    <!-- Content Section Start -->
    <section class="shop_content">
      <div class="container">
        <div class="row my-5">

          <div class="col-sm-3 filter">
            <div class="d-flex flex-column">
              <div class="my-5">
                <div class="dropdown">
                  <ul class="list-group">
                    <li class="list-group-item category">CATEGORIES</li>
                    <li class="list-group-item filter">
                      <a href="./homepage.html" style="text-decoration: none;">
                        Clothing
                      </a> 
                    </li>
                    <li class="list-group-item filter">
                      <a href="./homepage.html" style="text-decoration: none;">
                        Bag
                      </a> 
                    </li>
                    <li class="list-group-item filter">
                      <a href="./homepage.html" style="text-decoration: none;">
                        Shoes
                      </a> 
                    </li>
                    <li class="list-group-item filter">
                      <a href="./homepage.html" style="text-decoration: none;">
                        Accessories
                      </a> 
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>

          <div class="col-sm-9 ">
            <div class="container product_cont">
              <div class="row">
                <div class="col-12 product_header d-flex justify-content-center align-items-center">
                  
                  <div class="row">
                    <div class="col mx-5 filter_button">
                      <!-- <a class="header_shop" href="#">New Arrivals</a> -->
                      <button class="btn active" onclick="filterSelection('all')">All Product</button>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col mx-5 filter_button">
                      <!-- <a class="header_shop" href="#" >Best Sellers</a> -->
                      <button class="btn" onclick="filterSelection('best')">Best Sellers</button>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col mx-5 filter_button">
                      <!-- <a class="header_shop" href="#">New Arrivals</a> -->
                      <button class="btn" onclick="filterSelection('new')">New Arrivals</button>
                    </div>
                  </div>
                </div>

                
                <div class="row row-cols-1 row-cols-md-3 row-cols-lg-4 m-0">

                  <div class="filterDiv best p-0">
                    <div class="col d-flex flex-column p-2">
                      <a href="./description.html" class="col d-flex flex-column p-0" style="text-decoration: none;">
                      <img class="product-img" src="./images/Produk/G1.jpg" />
                        <div class="row p-0 m-0">
                          <div class="col-11 p-0 w product-desc">
                            <p class="mb-0 p-0">Man Kimono Set</p>
                            <p class="mb-0 p-0">Rp 249.999</p>
                          </div>
                      </a>
                        <div class="col-1 product-cart d-flex justify-content-center p-0">
                            <a href="./shoping_cart.html">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag" viewBox="0 0 16 16">
                              <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z" />
                            </svg>
                            </a>
                          </div>
                        </div>
                    </div>
                  </div>

                  <div class="filterDiv new p-0">
                    <div class="col d-flex flex-column p-2">
                      <img class="product-img" src="./images/Produk/G2.jpg" />
                      <div class="row p-0 m-0">
                        <div class="col-11 p-0 w product-desc">
                          <p class="mb-0 p-0">Reebok M1 Shoes</p>
                          <p class="mb-0 p-0">Rp 699.999</p>
                        </div>
                        <div class="col-1 product-cart d-flex justify-content-center cart p-0 pt-1">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag" viewBox="0 0 16 16">
                            <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z" />
                          </svg>
                        </div>
                      </div>
                    </div>
                  </div>
                  
                  <div class="filterDiv best p-0">
                    <div class="col d-flex flex-column p-2">
                      <a href="#" class="col d-flex flex-column p-0" style="text-decoration: none;">
                      <img class="product-img" src="./images/Produk/G3.jpg" />
                        <div class="row p-0 m-0">
                          <div class="col-11 p-0 w product-desc">
                            <p class="mb-0 p-0">Burnion Denim Jacket</p>
                            <p class="mb-0 p-0">Rp 349.999</p>
                          </div>
                      </a>
                        <div class="col-1 product-cart d-flex justify-content-center p-0">
                            <a href="#">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag" viewBox="0 0 16 16">
                              <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z" />
                            </svg>
                            </a>
                          </div>
                        </div>
                    </div>
                  </div>
                  
                  <div class="filterDiv new p-0">
                    <div class="col d-flex flex-column p-2">
                      <img class="product-img" src="./images/Produk/G4.jpg" />
                      <div class="row p-0 m-0">
                        <div class="col-11 p-0 w product-desc">
                          <p class="mb-0 p-0">Black Glasses</p>
                          <p class="mb-0 p-0">Rp 149.999</p>
                        </div>
                        <div class="col-1 product-cart d-flex justify-content-center cart p-0 pt-1">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag" viewBox="0 0 16 16">
                            <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z" />
                          </svg>
                        </div>
                      </div>
                    </div>
                  </div>
                  
                  <div class="filterDiv best p-0">
                    <div class="col d-flex flex-column p-2">
                      <img class="product-img" src="./images/Produk/G5.jpg" />
                      <div class="row p-0 m-0">
                        <div class="col-11 p-0 w product-desc">
                          <p class="mb-0 p-0">School Bag</p>
                          <p class="mb-0 p-0">Rp 119.999</p>
                        </div>
                        <div class="col-1 product-cart d-flex justify-content-center cart p-0 pt-1">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag" viewBox="0 0 16 16">
                            <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z" />
                          </svg>
                        </div>
                      </div>
                    </div>
                  </div>
                  
                  <div class="filterDiv new p-0">
                    <div class="col d-flex flex-column p-2">
                      <img class="product-img" src="./images/Produk/G6.jpg" />
                      <div class="row p-0 m-0">
                        <div class="col-11 p-0 w product-desc">
                          <p class="mb-0 p-0">Woman Long Pants</p>
                          <p class="mb-0 p-0">Rp 299.999</p>
                        </div>
                        <div class="col-1 product-cart d-flex justify-content-center cart p-0 pt-1">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag" viewBox="0 0 16 16">
                            <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z" />
                          </svg>
                        </div>
                      </div>
                    </div>
                  </div>
                  
                  <div class="filterDiv best p-0">
                    <div class="col d-flex flex-column p-2">
                      <img class="product-img" src="./images/Produk/G7.jpg" />
                      <div class="row p-0 m-0">
                        <div class="col-11 p-0 w product-desc">
                          <p class="mb-0 p-0">Cute Cat T-Shirt Set</p>
                          <p class="mb-0 p-0">Rp 119.999</p>
                        </div>
                        <div class="col-1 product-cart d-flex justify-content-center cart p-0 pt-1">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag" viewBox="0 0 16 16">
                            <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z" />
                          </svg>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="filterDiv new p-0">
                    <div class="col d-flex flex-column p-2">
                      <img class="product-img" src="./images/Produk/G8.jpg" />
                      <div class="row p-0 m-0">
                        <div class="col-11 p-0 w product-desc">
                          <p class="mb-0 p-0">Comfortable Jacket</p>
                          <p class="mb-0 p-0">Rp 499.999</p>
                        </div>
                        <div class="col-1 product-cart d-flex justify-content-center cart p-0 pt-1">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag" viewBox="0 0 16 16">
                            <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z" />
                          </svg>
                        </div>
                      </div>
                    </div>
                  </div>
                  
                  <div class="filterDiv best p-0">
                    <div class="col d-flex flex-column p-2">
                      <img class="product-img" src="./images/Produk/G9.jpg" />
                      <div class="row p-0 m-0">
                        <div class="col-11 p-0 w product-desc">
                          <p class="mb-0 p-0">Nike Vision Set Woman</p>
                          <p class="mb-0 p-0">Rp 799.999</p>
                        </div>
                        <div class="col-1 product-cart d-flex justify-content-center cart p-0 pt-1">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag" viewBox="0 0 16 16">
                            <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z" />
                          </svg>
                        </div>
                      </div>
                    </div>
                  </div>
                  
                  <div class="filterDiv new p-0">
                    <div class="col d-flex flex-column p-2">
                      <img class="product-img" src="./images/Produk/G10.jpg" />
                      <div class="row p-0 m-0">
                        <div class="col-11 p-0 w product-desc">
                          <p class="mb-0 p-0">Purlinama Hat</p>
                          <p class="mb-0 p-0">Rp 39.999</p>
                        </div>
                        <div class="col-1 product-cart d-flex justify-content-center cart p-0 pt-1">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag" viewBox="0 0 16 16">
                            <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z" />
                          </svg>
                        </div>
                      </div>
                    </div>
                  </div>
                  
                  <div class="filterDiv best p-0">
                    <div class="col d-flex flex-column p-2">
                      <img class="product-img" src="./images/Produk/G11.jpg" />
                      <div class="row p-0 m-0">
                        <div class="col-11 p-0 w product-desc">
                          <p class="mb-0 p-0">Man Short Pants</p>
                          <p class="mb-0 p-0">Rp 59.999</p>
                        </div>
                        <div class="col-1 product-cart d-flex justify-content-center cart p-0 pt-1">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag" viewBox="0 0 16 16">
                            <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z" />
                          </svg>
                        </div>
                      </div>
                    </div>
                  </div>
                  
                  <div class="filterDiv new p-0">
                    <div class="col d-flex flex-column p-2">
                      <img class="product-img" src="./images/Produk/G12.jpg" />
                      <div class="row p-0 m-0">
                        <div class="col-11 p-0 w product-desc">
                          <p class="mb-0 p-0">Loafers Man Shoes</p>
                          <p class="mb-0 p-0">Rp 1.499.999</p>
                        </div>
                        <div class="col-1 product-cart d-flex justify-content-center cart p-0 pt-1">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag" viewBox="0 0 16 16">
                            <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z" />
                          </svg>
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
    
    <!-- Footer Section Start -->
    <%@ include file = "../../includes/fe_includes/_footer.jsp" %>
    <!-- Footer Section End-->

    <!-- Script Section Start -->
    <%@ include file = "../../includes/fe_includes/_scripts.jsp" %>
    <section class="script">
      <script>
      filterSelection("all")
      function filterSelection(c) {
          var x, i;
          x = document.getElementsByClassName("filterDiv");
          if (c == "all") c = "";
          // Add the "show" class (display:block) to the filtered elements, and remove the "show" class from the elements that are not selected
          for (i = 0; i < x.length; i++) {
              w3RemoveClass(x[i], "show");
              if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
          }
      }

      // Show filtered elements
      function w3AddClass(element, name) {
          var i, arr1, arr2;
          arr1 = element.className.split(" ");
          arr2 = name.split(" ");
          for (i = 0; i < arr2.length; i++) {
              if (arr1.indexOf(arr2[i]) == -1) {
              element.className += " " + arr2[i];
              }
          }
      }

      // Hide elements that are not selected
      function w3RemoveClass(element, name) {
          var i, arr1, arr2;
          arr1 = element.className.split(" ");
          arr2 = name.split(" ");
          for (i = 0; i < arr2.length; i++) {
              while (arr1.indexOf(arr2[i]) > -1) {
              arr1.splice(arr1.indexOf(arr2[i]), 1);
              }
          }
          element.className = arr1.join(" ");
      }

      // Add active class to the current control button (highlight it)
      var btnContainer = document.getElementById("myBtnContainer");
      var btns = btnContainer.getElementsByClassName("btn");
      for (var i = 0; i < btns.length; i++) {
          btns[i].addEventListener("click", function() {
              var current = document.getElementsByClassName("active");
              current[0].className = current[0].className.replace(" active", "");
              this.className += " active";
          });
      }
      </script>    

    </section>
    <!-- Script Section End -->
  </body>
</html>
