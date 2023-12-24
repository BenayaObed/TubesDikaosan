<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="session" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section class="header">
    <div class="heading">
        <div class="container-fluid">
            <p class="iklan mx-5 mt-2 mb-2">
              &nbsp;
            </p>
        </div>
    </div>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid mx-5">
          <a1 class="navbar-brand" href="${pageContext.request.contextPath}/home">DIKAOSAN</a1>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav mx-auto">
              <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/home">Home</a>
              <a class="nav-link" href="${pageContext.request.contextPath}/shop">Shop</a>
              <a class="nav-link" href="${pageContext.request.contextPath}/contact">Contact</a>
            </div>
            <span class="nav-button-right">
                <span class="input-search">
                    <input class="form-control search" type="text" name="search" id="search" placeholder="Search">
                </span>
                <span class="Cart mx-3 mt-2 m3">
                    <div class="cart">
                        <a href="${pageContext.request.contextPath}/shoping_cart"><i class="fa-solid fa-shopping-cart"></i></a>
                    </div>
                </span>
                <span class="sign">
                    <div class="sign-in mt-1">
                      <!-- Trigger Modal -->
                      <!-- session scope -->
                      <c:choose>
                        <c:when test="${sessionScope.user != null}">
                            <a href="#">${sessionScope.user.first_name}</a> 
                        </c:when>
                        <c:otherwise>
                          <a href="#" class="text-decoration-none text-dark" data-bs-toggle="modal" data-bs-target="#loginDikaosan">
                            <a href="#" data-bs-toggle="modal" data-bs-target="#loginDikaosan">Sign in</a> 
                          </a>
                        </c:otherwise>
                      </c:choose>

                      <!-- Modal Login -->
                      <div class="modal login" id="loginDikaosan" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                          <div class="modal-content login">
                            <div class="modal-header title">
                              <h1 class="modal-title fs-5" id="loginDikaosan">Welcome to Dikaosan!</h1>
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                              <form action="${pageContext.request.contextPath}/authentication" method="post">

                              <div class="row email">
                                <a>Email address</a>
                                <span class="input-Email">
                                  <input class="form-control Email" type="text" name="Email" id="Email" placeholder="Enter email">
                                </span>
                              </div>

                              <div class="row password">
                                <a>Password</a>
                                <span class="input-password">
                                  <input class="form-control password" type="text" name="password" id="password" placeholder="Enter password">
                                </span>
                              </div>

                              <div class="row forget_pass text-end">
                                <a1 href="#" >Forgot password?</a1>
                              </div>  

                              <div class="row justify-content-center text-center">
                                <button class="btn btn-primary confirm_btn w-50" data-bs-target="#" data-bs-toggle="modal" type="submit">Login</button>
                                <a class="my-1">Don't have an account? <span class="sign-up_btn" data-bs-toggle="modal" data-bs-target="#Sign-UpDikaosan"> <b>Sign Up</b></span></a>
                              </div>
                            </form>

                            </div>
                            <div class="modal-footer">
                            </div>
                          </div>
                        </div>
                      </div>

                      <!-- Modal Sign-Up -->
                      <div class="modal sign_up" id="Sign-UpDikaosan" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                          <div class="modal-content Sign-Up">
                            <div class="modal-header">
                              <h1 class="modal-title fs-5" id="Sign-UpDikaosan">Welcome to Dikaosan!</h1>
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">

                              <div class="row name">
                                <a>Name</a>
                                <span class="input-name">
                                  <input class="form-control name" type="text" name="name" id="name" placeholder="Your name">
                                </span>
                              </div>
                              
                              <div class="row phone_number">
                                <a>Phone Number</a>
                                <span class="input-phone_number">
                                  <input class="form-control phone_number" type="text" name="phone_number" id="phone_number" placeholder="Your phone number">
                                </span>
                              </div>

                              <div class="row email">
                                <a>Email address</a>
                                <span class="input-Email">
                                  <input class="form-control Email" type="text" name="Email" id="Email" placeholder="Enter email">
                                </span>
                              </div>

                              <div class="row password">
                                <a>Password</a>
                                <span class="input-password">
                                  <input class="form-control password" type="text" name="password" id="password" placeholder="Enter password">
                                </span>
                                <div id="passwordHelpBlock" class="form-text">
                                  Your password must be 8-20 characters long, contain letters and numbers, and must not contain spaces, special characters, or emoji.
                                </div>
                              </div>
                              
                              <div class="row justify-content-center text-center">
                                <button class="btn btn-primary confirm_btn w-50" data-bs-target="#Successfully" data-bs-toggle="modal">Sign Up</button>
                              </div>
                            </div>
                            <div class="modal-footer">
                            </div>
                          </div>
                        </div>
                      </div>

                      <!-- Modal Successfully Sign-Up -->
                      <div class="modal success" id="Successfully" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                          <div class="modal-content Sign-Up">
                            <div class="modal-header justify-content-center">
                              <h1 class="modal-title fs-5" id="Successfully">Welcome to Dikaosan!</h1>
                            </div>
                            <div class="modal-body">

                              <div class="row succes text-center">
                                <a>Your Account Has Been Successfully<br> 
                                  Registered!
                                </a>
                              </div>
                              
                              <div class="row justify-content-center text-center my-2">
                                <button type="button" class="btn btn-primary confirm_btn_success w-50" data-bs-dismiss="modal" aria-label="Close">Shop Now</button>
                              </div>
                            </div>
                            <div class="modal-footer">
                            </div>
                          </div>
                        </div>
                      </div>

                    </div>
                </span>
            </span>
          </div>
        </div>
    </nav>
</section>