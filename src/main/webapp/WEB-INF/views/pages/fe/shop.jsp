<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="session" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <a class="nav-link" href="${pageContext.request.contextPath}/home" style="word-spacing: 2px;">Home 
                  <svg xmlns="http://www.w3.org/2000/svg" width="10" height="12" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                  </svg> 
                  <a href="${pageContext.request.contextPath}/shop" style="text-decoration: none;">
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
                    <c:forEach items="${shopPageData.getCategories()}" var = "item">
                      <li class="list-group-item filter">
                        <a href="${pageContext.request.contextPath}/shop?category=${item.category_name}" style="text-decoration: none;">
                          ${item.category_name}
                        </a> 
                      </li>
                  </c:forEach>
                    
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
                  <c:forEach items="${shopPageData.products}" var="product">
                    <c:if test="${product.visible == 1}">

                    <c:set var="isBestSeller" value="${shopPageData.bestSellers.contains(product)}" />
                  <div class="filterDiv ${isBestSeller ? 'best' : 'new'} p-0">
                    <div class="col d-flex flex-column p-2">
                      <a href="${pageContext.request.contextPath}/description?product=${product.product_id}" class="col d-flex flex-column p-0" style="text-decoration: none;">
                      <img class="product-img" style="width: 220px; height: 217px;" src="${pageContext.request.contextPath}/resources/uploads/images/products/${product.images[0].image}" alt="product">
                        <div class="row p-0 m-0">
                          <div class="col-12 p-0 product-desc ">
                            <p class="mb-0 p-0">${product.name_product}</p>
                            <p class="mb-0 p-0">Rp ${product.price}</p>
                          </div>
                      </a>
                        <div class="col-3 product-rating d-flex p-0">
                          <div class="col-7">
                            <a style="text-decoration: none;" >
                              <span>
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="var(--YN300, #FFC400)" class="bi bi-star-fill" viewBox="0 0 16 16">
                                  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                </svg>
                              </span>
                            </a>
                          </div>
                          <div class="col-5" style="text-align: end;">
                            <a>${shopPageData.meanRatings[product.product_id] == null ? 0 : shopPageData.meanRatings[product.product_id]}</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </c:if>

                </c:forEach>
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
    <%@ include file = "../../includes/fe_includes/_script_shop.jsp" %>
    <!-- Script Section End -->
  </body>
</html>
