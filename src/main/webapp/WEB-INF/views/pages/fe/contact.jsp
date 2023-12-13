<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

  <head>
    <title>Contact</title>
    <%@ include file = "../../includes/fe_includes/_header.jsp" %>
  </head>
  
  <body>
    <!-- Navbar Section Start -->
    <%@ include file = "../../includes/fe_includes/_navbar_contact.jsp" %>
    <!-- Navbar Section End -->

    <!-- Activity Information Start-->
    <section class="activity">
      <div class="activity_page">
        <div class="container activity-cont offset mx-1">
          <div class="row">
            <div class="col-sm-12">
              <div class="activity-nav offset-mx-1">
                <h1>Contact</h1>
                <a class="nav-link" href="${pageContext.request.contextPath}/home" style="word-spacing: 2px;">Home 
                  <svg xmlns="http://www.w3.org/2000/svg" width="10" height="12" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                  </svg>  
                  <a href="${pageContext.request.contextPath}/contact" style="text-decoration: none;"   > 
                    <span>Contact</span>
                  </a>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Activity Information End-->

    <!-- Content Section Start -->
    <section class="contact_section ">
        <!-- <div class="mapouter"><div class="gmap_canvas"><iframe width="600" height="500" id="gmap_canvas" src="https://maps.google.com/maps?q=telkomuniversity%20&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe><a href="https://123movies-to.org">123movies</a><br><style>.mapouter{position:relative;text-align:right;height:500px;width:600px;}</style><a href="https://www.embedgooglemap.net"></a><style>.gmap_canvas {overflow:hidden;background:none!important;height:500px;width:600px;}</style></div></div> -->
        <div class="container contact  my-5 mt-5">
            <div class="row about_us">
                <div class="col-sm-12 title_about d-flex flex-column  p-2">
                    <p class="mb-0 p-0 contact_border border-bottom" style="border-color:#C0BCBC;">ABOUT US</p>
                        <div class="col product-desc mx-3 my-3">
                            <p class="mb-0 p-0">Dikaosan is an online clothing store that offers a wide range of high-quality fashion products. We take pride in providing unique and top-quality clothing collections to cater to your style and needs. Dikaosan offers customers a convenient and enjoyable shopping experience with fast delivery services and a diverse range of styles to choose from. We are committed to providing the best clothing, ensuring that you can look stylish and confident for any occasion.</p>
                        </div>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-sm-6 d-flex flex-column p-0">
                    <img src="./images/Group 14.jpg">
                </div>
                <div class="col-sm-6 d-flex flex-column justify-content-center align-items-center border-danger">
                    <div class="row">
                        <div class="col-sm-12 contact_text my-3">
                            <h1 class="text-center m-0">Our Contact</h1>
                        </div>
                    </div>
                    <div class="info_contact w-75 ">
                        <div class="row">
                            <div class="col-sm-6 ">
                                <h1 class="m-0">Whatsapp</h1>
                                <div class="row  wa_contact mt-2 my-5">
                                    <div class="col-sm-3">
                                        <img src="./images/42.png" alt="">
                                    </div>
                                    <div class="col-sm-9 d-flex align-items-center border-primary p-0 m-0">
                                        <a class="text-left m-0" href="#">081360255137</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 p-0">
                                <h1 class="m-0">Email</h1>
                                <div class="row  wa_contact mt-2 my-5">
                                    <div class="col-sm-3">
                                        <img src="./images/43.png" alt="">
                                    </div>
                                    <div class="col-sm-9 d-flex align-items-center p-0 m-0">
                                        <a class="text-left m-0" href="#">dikaosan@gmail.com</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 ">
                                <h1 class="m-0">Instagram</h1>
                                <div class="row  wa_contact mt-2 my-5">
                                    <div class="col-sm-3">
                                        <img src="./images/44.png" alt="">
                                    </div>
                                    <div class="col-sm-9 d-flex align-items-center p-0 m-0">
                                        <a class="text-left m-0" href="#">@dikaosan_store</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 p-0">
                                <h1 class="m-0">Facebook</h1>
                                <div class="row  wa_contact mt-2 my-5">
                                    <div class="col-sm-3">
                                        <img src="./images/45.png" alt="">
                                    </div>
                                    <div class="col-sm-9 d-flex align-items-center p-0 m-0">
                                        <a class="text-left m-0" href="#">@dikaosan_store</a>
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

    <!-- script Section Start -->
    <%@ include file = "../../includes/fe_includes/_scripts.jsp" %>
    <!-- script Section End -->
  </body>
</html>