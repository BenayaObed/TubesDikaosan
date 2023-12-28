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
              <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/home">Home</a>
              <a class="nav-link" aria-current="page"  href="${pageContext.request.contextPath}/shop">Shop</a>
              <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/contact">Contact</a>
            </div>
            <span class="nav-button-right">
                <span class="input-search">
                  <form action="${pageContext.request.contextPath}/shop" method="get">
                    <input class="form-control search" type="text" name="search" id="search" placeholder="Search">
                  </form>
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
                          <button type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">${sessionScope.user.first_name}</button>
                            <!-- <a href="#">${sessionScope.user.first_name}</a>  -->
                        </c:when>
                        <c:otherwise>
                          <a href="#" class="text-decoration-none text-dark" data-bs-toggle="modal" data-bs-target="#loginDikaosan">
                            <a href="#" data-bs-toggle="modal" data-bs-target="#loginDikaosan">Sign in</a> 
                          </a>
                        </c:otherwise>
                      </c:choose>

                      
                      <!-- Modal Login -->
                      <c:if test="${not empty message}">
                        <div class="alert alert-danger my-2" role="message">
                            ${message}
                      </div>
                      </c:if>
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
                                  <input class="form-control password" type="password" name="password" id="password" placeholder="Enter password">
                                </span>
                              </div>

                              <div class="row forget_pass text-end">
                                <a1 data-bs-toggle="modal" data-bs-target="#reset-PasswordDikaosan" >Forgot password?</a1>
                              </div>  

                              <div class="row justify-content-center text-center">
                                <button class="btn btn-primary confirm_btn w-50" data-bs-target="#" data-bs-toggle="modal" type="submit" style="background-color: black;">Login</button>
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
                      <c:if test="${not empty message}">
                        <div class="alert alert-danger my-2" role="message">
                            ${message}
                      </div>
                      </c:if>
                      <div class="modal sign_up" id="Sign-UpDikaosan" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                          <div class="modal-content Sign-Up">
                            <div class="modal-header">
                              <h1 class="modal-title fs-5" id="Sign-UpDikaosan">Welcome to Dikaosan!</h1>
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                              <form action="${pageContext.request.contextPath}/registration" method="post">

                              <div class="row name">
                                <a>First Name</a>
                                <span class="input-name">
                                  <input class="form-control name" type="text" name="first_name" id="first_name" placeholder="First Name">
                                </span>
                              </div>
                              
                              <div class="row phone_number">
                                <a>Last Name</a>
                                <span class="input-phone_number">
                                  <input class="form-control phone_number" type="text" name="last_name" id="last_name" placeholder="Last Name">
                                </span>
                              </div>

                              <div class="row email">
                                <a>Email address</a>
                                <span class="input-Email">
                                  <input class="form-control Email" type="text" name="email" id="email" placeholder="Enter email">
                                </span>
                              </div>

                              <div class="row password">
                                <a>Password</a>
                                <span class="input-password">
                                  <input class="form-control password" type="password" name="password" id="password" placeholder="Enter password">
                                </span>
                                <div id="passwordHelpBlock" class="form-text">
                                  Your password must be 8-20 characters long, contain letters and numbers, and must not contain spaces, special characters, or emoji.
                                </div>
                              </div>
                              
                              <div class="row justify-content-center text-center">
                                <button class="btn btn-primary confirm_btn w-50" style="background-color: black;" type="submit" data-bs-toggle="modal" data-bs-target="#">Sign Up</button>
                              </div>
                            </form>

                            </div>
                            <div class="modal-footer">
                            </div>
                          </div>
                        </div>
                      </div>
                      
                      <!-- Modal Successfully Sign-Up -->
                      <div class="modal success" id="SuccessfullySignUp" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
                                <button type="button" class="btn btn-primary confirm_btn_success w-50" data-bs-dismiss="modal" aria-label="Close" style="background-color: black;">Shop Now</button>
                              </div>
                            </div>
                            <div class="modal-footer">
                            </div>
                          </div>
                        </div>
                      </div>

                      <!-- Modal Reset Password -->
                      <c:if test="${not empty message}">
                        <div class="alert alert-danger my-2" role="message">
                            ${message}
                        </div>
                      </c:if>
                      <div class="modal reset_password" id="reset-PasswordDikaosan" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                          <div class="modal-content login">
                            <div class="modal-header title">
                              <h1 class="modal-title fs-5" id="loginDikaosan">Change Password</h1>
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                              <form action="${pageContext.request.contextPath}/update-password" method="POST">
                                <div class="row oldPass">
                                  <a>Old Password</a>
                                  <span class="input-oldPass">
                                  <input type="hidden" name="user_id" value="${sessionScope.user.user_id}">
                                  <input class="form-control oldPass" type="password" name="oldPass" id="oldPass" placeholder="">
                                </span>
                              </div>
                  
                              <div class="row newPass">
                                <a>New Password</a>
                                <span class="input-newPass">
                                  <input class="form-control newPass" type="password" name="newPass" id="newPass" placeholder="">
                                </span>
                              </div>
                  
                              <div class="row confirmPass">
                                <a>Confirm New Password</a>
                                <span class="input-confirmPass">
                                  <input class="form-control confirmPass" type="password" name="confirmPass" id="confirmPass" placeholder="">
                                </span>
                                <div id="passwordHelpBlock" class="form-text">
                                  Your password must be 8-20 characters long, contain letters and numbers, and must not contain spaces, special characters, or emoji.
                                </div>
                              </div>
                  
                              <div class="row justify-content-center text-center">
                                <button class="btn btn-primary confirm_btn w-50" type="submit" style="background-color: black;" data-bs-toggle="modal" data-bs-target="#">Set Password</button>
                              </div>
                            </form>
                            </div>
                            <div class="modal-footer">
                            </div>
                          </div>
                        </div>
                      </div>
                  
                      <!-- Modal Successfully Reset Password -->
                      <div class="modal successResetPass" id="SuccessfullyResetPass" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                          <div class="modal-content Sign-Up">
                            <div class="modal-header justify-content-center">
                              <h1 class="modal-title fs-5" id="Successfully">Welcome to Dikaosan!</h1>
                            </div>
                            <div class="modal-body">
                  
                              <div class="row succes text-center">
                                <a>Your Account Has Been Successfully<br> 
                                  Reset Password!
                                </a>
                              </div>
                              
                              <div class="row justify-content-center text-center my-2">
                                <button type="button" class="btn btn-primary confirm_btn_success w-50" data-bs-dismiss="modal" aria-label="Close" style="background-color: black;">Oke</button>
                              </div>
                            </div>
                            <div class="modal-footer">
                            </div>
                          </div>
                        </div>
                      </div>

                      <!-- Modal History-->
                      <div class="modal history_pembelian" id="historyPembelian" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content login">
                            <div class="modal-header title">
                                <h1 class="modal-title fs-5" id="loginDikaosan">History Pembelian</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                            <form id="history">
                                <div class="header_list">
                                  <ul class="list-group list-group-horizontal">
                                    <div class="col-4">
                                        <li class="list-group-item" style="text-align: center;">Order Item</li>
                                    </div>
                                    <div class="col-4">
                                        <li class="list-group-item" style="text-align: center;">Status</li>
                                    </div>
                                    <div class="col-4">
                                      <li class="list-group-item" style="text-align: center;">Action</li>
                                  </div>
                                </ul>
                                <c:forEach items="${sessionScope.history}" var="item">
                                  <ul class="list-group list-group-horizontal">
                                      <div class="col-4 d-fex justify-content-center align-items-center">
                                        <li class="list-group-item" style="text-align: center; height: 45px;">${item.order_id}</li>
                                      </div>
                                      <div class="col-4 d-fex justify-content-center align-items-center">
                                        <li class="list-group-item" style="text-align: center; height: 45px;">${item.status}</li>
                                      </div>
                                      <div class="col-4 d-fex justify-content-center align-items-center">
                                        <li class="list-group-item" style="text-align: center;"><a class="m-0" href="${pageContext.request.contextPath}/invoice?order_id=${item.order_id}" class="btn btn-sm btn-warning"><i class="fas fa-edit"></i>Details</a></li>
                                      </div>
                                      
                                  </ul>
                                </c:forEach>
                                </div>
                            </form>
                            </div>
                            <div class="modal-footer">
                            </div>
                            </div>
                        </div>
                        </div>
                    

                      <!-- Modal Logout-->
                      <div class="modal history_pembelian" id="LogOut" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                      <div class="modal-dialog modal-dialog-centered">
                          <div class="modal-content login">
                          <div class="modal-header title">
                              <h1 class="modal-title fs-5" id="loginDikaosan">Ready to Logout?</h1>
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                            <div class="row succes text-center">
                              <a>Select "Logout" below if you are ready to end your current session!</a>
                            </div>
                            
                            <div class="row justify-content-center text-center logout my-2">
                              <a class="btn confirm_btn_success w-50" style="background-color: black; color: white;" href="${pageContext.request.contextPath}/logout">Logout</a>
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

<!-- MODAL TRIGER -->
<section>
  <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel" style="height: 385px; overflow-y: hidden;">
  <div class="offcanvas-header">
  <h5 class="offcanvas-title" id="offcanvasRightLabel">Edit Profil</h5>
  <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body w-100" style="height:883px;">
    <div class="mb-3 row triger_modal m-0">
      <div class="row nama">
        <label for="staticEmail" class="col-sm-4 col-form-label m-0">Nama</label>
        <div class="col-sm-8">
            <a type="text" readonly class="form-control-plaintext" id="staticEmail" style="text-decoration: none;">${sessionScope.user.first_name} ${sessionScope.user.last_name}</a>
        </div>
      </div>

      <div class="row email">
        <label for="staticEmail" class="col-sm-4 col-form-label">Email</label>
        <div class="col-sm-8">
            <a type="text" readonly class="form-control-plaintext" id="staticEmail" style="text-decoration: none;">${sessionScope.user.email}</a>
        </div>
      </div>

      <div class="row passord">
        <label for="staticEmail" class="col-sm-4 col-form-label setting_button ">Password</label>
        <div class="col-sm-8">
        <button type="button" class="btn btn-primary w-50 m-0" data-bs-toggle="modal" data-bs-target="#reset-PasswordDikaosan" style="color: #767F43; background-color: white; border-radius: 0%; border-color: grey;" >Change</button>
        </div>
      </div>

      <div class="row history">
        <label for="staticEmail" class="col-sm-4 col-form-label setting_button ">History</label>
        <div class="col-sm-8 my-2">
          <button type="button" class="btn btn-primary confirm_btn_success w-50" data-bs-toggle="modal" data-bs-target="#historyPembelian" style="color: #767F43; background-color: white; border-radius: 0%; border-color: grey;">History</button>
        </div>
      </div>
      
      <c:if test="${sessionScope.user.role.role_name == 'ADMIN'}">
      <div class="row dashboard">
        <label for="staticEmail" class="col-sm-4 col-form-label setting_button ">Dashboard</label>
        <div class="col-sm-8">
          <a type="button" class="btn btn-primary confirm_btn_success w-50" href="${pageContext.request.contextPath}/dashboard" style="color: #767F43; background-color: white; border-radius: 0%; border-color: grey;">Dashboard</a>
        </div>
      </div>
      </c:if>
      
      <div class="row logout d-flex justify-content-center align-items-center">
        <button type="button" class="btn btn-primary w-50 my-2 bottom-button" data-bs-toggle="modal" data-bs-target="#LogOut" style="background-color: black; border-color: black;">Logout</button>
      </div>
    </div>
  </div>

</div>
</section>