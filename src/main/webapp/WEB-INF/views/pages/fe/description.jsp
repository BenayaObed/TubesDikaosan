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
                <a class="nav-link" href="homepage.html" style="word-spacing: 2px;">Home 
                    <svg xmlns="http://www.w3.org/2000/svg" width="10" height="12" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                      <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                    </svg> 
                    <a class="nav-link" href="homepage.html" style="word-spacing: 2px;">Shop
                      <svg xmlns="http://www.w3.org/2000/svg" width="10" height="12" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                      </svg>
                    </a>
                    <a href="./description.html" style="text-decoration: none;">
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

          <div class="col-sm-3">
            <div class="d-flex flex-column">
              <div class="my-3">
                <div class="accordion" id="accordionExample">
                  <div class="accordion-item">
                    <h2 class="accordion-header">
                      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        CATEGORIES
                      </button>
                    </h2>
                    <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
                      <div class="accordion-body">
                        <ul class="p-0 m-0">
                          <li><a href="#">Men (20)</a></li>
                          <li><a href="#">Women (20)</a></li>
                          <li><a href="#">Bags (20)</a></li>
                          <li><a href="#">Clothing (20)</a></li>
                          <li><a href="#">Shoes (20)</a></li>
                          <li><a href="#">Accessories (20)</a></li>
                          <li><a href="#">Kids (20)</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="accordion-item">
                    <h2 class="accordion-header">
                      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        FILTER PRICE
                      </button>
                    </h2>
                    <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                      <div class="accordion-body">
                        <ul class="p-0">
                          <li><a href="#">Rp0 - Rp50.000</a></li>
                          <li><a href="#">Rp50.000 - Rp100.000</a></li>
                          <li><a href="#">Rp100.000 - Rp200.000</a></li>
                          <li><a href="#">Rp200.000 - Rp300.000</a></li>
                          <li><a href="#">Rp300.000 - Rp400.000</a></li>
                          <li><a href="#">Rp450.000+</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="accordion-item">
                    <h2 class="accordion-header">
                      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                        TAGS
                      </button>
                    </h2>
                    <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                      <div class="accordion-body">
                        <ul class="p-0 my-3">
                          <div class="d-flex tags-content my-1 ">
                            <li><a class="btn btn-tags d-flex justify-content-center align-items-center ">PRODUCT</a></li>
                            <li><a class="btn btn-tags d-flex justify-content-center align-items-center mx-2">BAGS</a></li>
                          </div>
                          <div class="d-flex my-1">
                            <li><a class="btn btn-tags d-flex justify-content-center align-items-center">SHOES</a></li>
                            <li><a class="btn btn-tags d-flex justify-content-center align-items-center mx-2">ACCESSORIES</a></li>
                          </div>
                          <div class="d-flex my-1">
                            <li><a class="btn btn-tags d-flex justify-content-center align-items-center">CLOTHING</a></li>
                            <li><a class="btn btn-tags d-flex justify-content-center align-items-center mx-2">HATS</a></li>
                          </div>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-4 d-flex justify-content-center product_pic align-items-center">
            <img src="./images/G1.jpg" alt="">
          </div>

          <div class="col-5">
            <div class="row title_product">
              <div class="col-8">
                <h1>Man Kimono Set<br> Rp 249.999</h1>
              </div>
              <div class="col-1 product-cart d-flex cart p-0 my-2 mx-3">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-bag" viewBox="0 0 16 16">
                  <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z" />
                </svg>
              </div>
            </div>

            <div class="row">
              <div class="d-flex justify-content-left align-items-center">
                <div class="product_img">
                  <img src="./images/Deskripsi Produk/G1.jpg" alt="">
                </div>
                <div class="product_img">
                  <img src="./images/Deskripsi Produk/G2.jpg" alt="">
                </div>
                <div class="product_img">
                  <img src="./images/Deskripsi Produk/G3.jpg" alt="">
                </div>
                <div class="product_img">
                  <img src="./images/Deskripsi Produk/G4.jpg" alt="">
                </div>
                <div class="product_img">
                  <img src="./images/Deskripsi Produk/G5.jpg" alt="">
                </div>
              </div>

              <div class="d-flex color my-2">
                <div class="justify-content-center align-items-center text_color">
                  <a>Color:</a>
                </div>
                <div class="justify-content-center align-items-center p-0">
                  <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#7A7A7C" class="bi bi-circle-fill" viewBox="0 0 16 16">
                    <circle cx="8" cy="8" r="8"/>
                  </svg>
                </div>
                <div class="justify-content-center align-items-center p-0">
                  <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#577F8D" class="bi bi-circle-fill" viewBox="0 0 16 16">
                    <circle cx="8" cy="8" r="8"/>
                  </svg>
                </div>
                <div class="justify-content-center align-items-center p-0">
                  <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#7E6F94" class="bi bi-circle-fill" viewBox="0 0 16 16">
                    <circle cx="8" cy="8" r="8"/>
                  </svg>
                </div>
              </div>

              <div class="d-flex size my-2">
                <div class="size_product">
                  <a class="btn btn-size">S</a>
                </div>
                <div class="size_product">
                  <a class="btn btn-size">M</a>
                </div>
                <div class="size_product">
                  <a class="btn btn-size">L</a>
                </div>
                <div class="size_product">
                  <a class="btn btn-size">XL</a>
                </div>
              </div>

              <div class="d-flex button_description my-2">
                <!-- <div class="button_cart">
                  <a class="btn btn-add-cart d-flex justify-content-center align-items-center" href="./shoping_cart.html">ADD TO CART</a>
                </div> -->
                <div class="button_buy"> 
                  <a class="btn btn-add-cart d-flex justify-content-center align-items-center" href="./shoping_cart.html">BUY NOW</a>
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
                  </p> 

                  <h1>Package Contents :</h1>
                  <p>
                    1 * Top<br>
                    1 * Shorts<br>
                  </p> 

                  <h1>Remember :</h1>
                  <p>
                    Please refer to the Size Reference to find the correct size.
                  </p> 
                  
                </div>
              </div>

              <div class="d-flex message">
                <div class="message_box">
                  <div class="col-12 d-flex align-items-center justify-content-center my-2">
                    <img class="my-1" src="./images/Deskripsi Produk/msg.png">
                    <a>Message Now!</a>
                  </div>
                </div>
              </div>
              <!-- <a class="btn-message-desc border">Message Now!</a> -->
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
    
              <div class="col d-flex flex-column p-2">
                <img class="product-img" src="./images/Produk/G3.jpg" />
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
            
          </div>
        </div>
      </div>
    </section>
    <!-- shop Section End -->

    <!-- Footer Section Start -->
    <%@ include file = "../../includes/fe_includes/_footer.jsp" %>
    <!-- Footer Section End-->
    
    <!-- script Section Start -->
    <%@ include file = "../../includes/FE_includes/_scripts.jsp" %>
    <!-- script Section End --
    </body>
  </html>