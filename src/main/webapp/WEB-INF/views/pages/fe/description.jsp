<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="session" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
                <h1>${data.name_product}</h1>
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
                      <span>${data.name_product}</span>
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
            <img src="${pageContext.request.contextPath}/resources/uploads/images/products/${data.images[0].image}" alt="">
          </div>

          <div class="col-6">
            <div class="row title_product">
              <div class="col-8">
                <h1>${data.name_product}<br><fmt:formatNumber value="${data.price}" type="currency" currencyCode="IDR" /></h1>
              </div>
              <div class="col-1 product-cart d-flex cart p-0 my-2 mx-3">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-bag" viewBox="0 0 16 16">
                  <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z" />
                </svg>
              </div>
            </div>

            <div class="row">
              <div class="d-flex justify-content-left align-items-center">
                <c:forEach items="${data.images}" var="item">
                  <div class="product_img">
                    <img src="${pageContext.request.contextPath}/resources/uploads/images/products/${item.image}" style="max-width: 20em; max-height: 20em; width: 100%; height: 100%; object-fit: cover;">
                  </div>
                </c:forEach>
              </div>

              <div class="d-flex color my-2">
                <div class="justify-content-center align-items-center text_color">
              <a>Color: </a>
                </div>
                <c:forEach items="${data_stock}" var="item">
                  <div class="justify-content-center align-items-center p-0">
                    <a class="btn btn-color" style="border: 1px solid #000; background: none; color: #000;">${item.key}</a>
                  </div>
                </c:forEach>
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
                  <a class="btn btn-add-cart d-flex justify-content-center align-items-center" href="${pageContext.request.contextPath}/shoping_cart">BUY NOW</a>
                </div>
              </div>

              <div class="d-flex text_description my-2">
                <div class="description_product">
                  <h1>Description :</h1>
                  <p>
                    ${data.description}
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
                    <img class="my-1" src="/resources/images/Deskripsi Produk/msg.png">
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

    <!-- Footer Section Start -->
    <%@ include file = "../../includes/fe_includes/_footer.jsp" %>
    <!-- Footer Section End-->
    
    <!-- script Section Start -->
    <%@ include file = "../../includes/fe_includes/_scripts.jsp" %>
    <!-- script Section End -->
    </body>
  </html>