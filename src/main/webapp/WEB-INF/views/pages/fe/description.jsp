<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
  <head>
    <title>Description</title>
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
            <div class="col-sm-12">
              <div class="activity-nav offset-mx-1">
                <h1>Man Kimono Set</h1>
                <a class="nav-link" href="${pageContext.request.contextPath}/home" style="word-spacing: 2px;">Home 
                    <svg xmlns="http://www.w3.org/2000/svg" width="10" height="12" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                      <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                    </svg> 
                    <a class="nav-link" href="${pageContext.request.contextPath}/shop" style="word-spacing: 2px;">Shop
                      <svg xmlns="http://www.w3.org/2000/svg" width="10" height="12" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                      </svg>
                    </a>
                    <a href="${pageContext.request.contextPath}/description" style="text-decoration: none;">
                      <span>Man Kimono Set</span>
                    </a>
                  </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Activity Information End-->

    <!-- Description Section Start -->
    <section class="description_content">
      <div class="container description my-5">
        <div class="row">

          <div class="col-6 d-flex justify-content-center align-items-center">
            <img src="/resources/images/G1.jpg" alt="">
          </div>

          <div class="col-6">
            <div class="row title_product">
              <div class="col-8">
                <h1 class="m-0">Man Kimono Set
                  <br> Rp 249.999</h1>
              </div>
              <div class="col-1 product-cart d-flex cart p-0 my-2 mx-3">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-bag" viewBox="0 0 16 16">
                  <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z" />
                </svg>
              </div>
            </div>

            <div class="d-flex rating-desc">
              <div class="col-2">
                <a style="text-decoration: none;">
                  <span>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="var(--YN300, #FFC400)" class="bi bi-star-fill" viewBox="0 0 16 16">
                      <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                    </svg>
                    <a>4.0</a>
                  </span>
                </a>
              </div>
            </div>

            <div class="row">
              <div class="d-flex justify-content-left align-items-center">
                <div class="product_img">
                  <img src="/resources/images/Deskripsi Produk/G1.jpg" alt="">
                </div>
                <div class="product_img">
                  <img src="/resources/images/Deskripsi Produk/G2.jpg" alt="">
                </div>
                <div class="product_img">
                  <img src="/resources/images/Deskripsi Produk/G3.jpg" alt="">
                </div>
                <div class="product_img">
                  <img src="/resources/images/Deskripsi Produk/G4.jpg" alt="">
                </div>
                <div class="product_img">
                  <img src="/resources/images/Deskripsi Produk/G5.jpg" alt="">
                </div>
              </div>

              

              <div class="d-flex color my-2">
                <div class="justify-content-center align-items-center text_color">
                  <a>Color:</a>
                </div>
                <div id="myBtnColor">
                  <!-- <input type="text" value="" id="color_selected"> <br> -->
                  <button class="btn color-btn" onclick="filterSelection('abu')">Abu</button>
                  <button class="btn color-btn" onclick="filterSelection('biru')">Biru</button>
                  <button class="btn color-btn" onclick="filterSelection('ungu')">Ungu</button>
                </div>
              </div>

              <!-- Size Section Start -->
              <div id="myBtnSize">
                <!-- <input type="text" value="" id="size_selected"> <br> -->
                <button class="btn size-btn" onclick="filterSelection('s')">S</button>
                <button class="btn size-btn" onclick="filterSelection('m')">M</button>
                <button class="btn size-btn" onclick="filterSelection('l')">L</button>
                <button class="btn size-btn" onclick="filterSelection('xl')">XL</button>
              </div>

              <!-- <div class="container">
                <div class="filterDiv S"></div>
                <div class="filterDiv M"></div>
                <div class="filterDiv L"></div>
                <div class="filterDiv XL"></div>
              </div> -->
            
              <script>
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
                    // cek button yg dipilih warna/ukuran
                    console.log(arr1);
                    document.getElementById("color_selected").value = arr1[1];
                    document.getElementById("size_selected").value = arr1[1];
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
                var btnContainer = document.getElementById("myBtnColor");
                var btns = btnContainer.getElementsByClassName("btn");
                for (var i = 0; i < btns.length; i++) {
                btns[i].addEventListener("click", function() {
                    var current = document.getElementsByClassName("active");
                    current[0].className = current[0].className.replace(" active", "");
                    this.className += " active";
                    });
                }

                var btnContainer = document.getElementById("myBtnSize");
                var btns = btnContainer.getElementsByClassName("btn");
                for (var i = 0; i < btns.length; i++) {
                btns[i].addEventListener("click", function() {
                    var current = document.getElementsByClassName("active");
                    current[0].className = current[0].className.replace(" active", "");
                    this.className += " active";
                    });
                }
              </script>
              <!-- Size Section End -->

              <div class="d-flex button_description my-2">
                <!-- <div class="button_cart">
                  <a class="btn btn-add-cart d-flex justify-content-center align-items-center" href="./shoping_cart.html">ADD TO CART</a>
                </div> -->
                <div class="button_buy"> 
                  <a class="btn btn-add-cart d-flex justify-content-center align-items-center" href="${pageContext.request.contextPath}/shoping_cart">BUY NOW</a>
                </div>
              </div>

              <div class="d-flex text_description my-2">
                <div class="description_product">
                  <h1>Description :</h1>
                  <p>
                    Color : Purple, black, blue<br>
                    Sleeve length : Sleeve length 3/4<br>
                    Thickness : Currently<br>
                    Season : Fall<br>
                    Material : Polyester<br>
                    Suitabel Type : Loose<br>
                    Waist Type : Half<br>
                    1 * Top<br>
                    1 * Shorts<br>
                  </p> 
                </div>
              </div>

            </div>
          </div>

        </div>
      </div>
    </section>
    <!-- Description Section End -->

    <!-- Shop Section Start -->
    <section class="shop_content_desc">
      <div class="col-sm-12">
        <div class="container product_cont ">
          <div class="row">
            <div class="row desc_shop row-cols-md-3 row-cols-lg-4 m-0">
              <div class="col d-flex flex-column p-2">
                <img class="product-img" src="/resources/images/Produk/G2.jpg" />
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
    
              <div class="col d-flex flex-column p-2">
                <img class="product-img" src="/resources/images/Produk/G3.jpg" />
                <div class="row p-0 m-0">
                  <div class="col-11 p-0 w product-desc">
                    <p class="mb-0 p-0">Burnion Denim Jacket</p>
                    <p class="mb-0 p-0">Rp 349.999</p>
                  </div>
                  <div class="col-1 product-cart d-flex justify-content-center cart p-0 pt-1">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag" viewBox="0 0 16 16">
                      <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z" />
                    </svg>
                  </div>
                </div>
              </div>
    
              <div class="col d-flex flex-column p-2">
                <img class="product-img" src="/resources/images/Produk/G4.jpg" />
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
    
              <div class="col d-flex flex-column p-2">
                <img class="product-img" src="/resources/images/Produk/G5.jpg" />
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
  
              <div class="col d-flex flex-column p-2">
                <img class="product-img" src="/resources/images/Produk/G6.jpg" />
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
  
              <div class="col d-flex flex-column p-2">
                <img class="product-img" src="/resources/images/Produk/G7.jpg" />
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
  
              <div class="col d-flex flex-column p-2">
                <img class="product-img" src="/resources/images/Produk/G8.jpg" />
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
  
              <div class="col d-flex flex-column p-2">
                <img class="product-img" src="/resources/images/Produk/G9.jpg" />
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
            
          </div>
        </div>
      </div>
    </section>
    <!-- shop Section End -->

    <!-- Chat Section Start -->
    <%@ include file = "../../includes/fe_includes/_chat.jsp" %>
    <!-- Chat Section End -->

    <!-- Footer Section Start -->
    <%@ include file = "../../includes/fe_includes/_footer.jsp" %>
    <!-- Footer Section End-->
    
    <!-- script Section Start -->
    <%@ include file = "../../includes/fe_includes/_scripts.jsp" %>
    <!-- script Section End -->
    </body>
  </html>