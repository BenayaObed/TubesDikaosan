<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
    <title>Payment</title>
    <%@ include file = "../../includes/fe_includes/_header.jsp" %>
</head>

<body>
    <!-- Navbar Section Start -->
    <%@ include file = "../../includes/fe_includes/_navbar.jsp" %>
    <!-- Navbar Section End -->

    <!-- Activity Section Start -->
    <section class="activity">
        <div class="activity_page">
            <div class="container activity-cont offset mx-1">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="activity-nav offset-mx-1">
                            <h1>Payment</h1>
                            <a class="nav-link" href="./homepage.html" style="word-spacing: 2px;">Home 
                                <svg xmlns="http://www.w3.org/2000/svg" width="10" height="12" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                                </svg>  
                                <a class="nav-link" href="./shop.html" style="word-spacing: 2px;">Shop 
                                    <svg xmlns="http://www.w3.org/2000/svg" width="10" height="12" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                                    </svg>
                                </a>
                                <a class="nav-link" href="./shoping_cart.html" style="word-spacing: 2px;">Shoping Cart 
                                    <svg xmlns="http://www.w3.org/2000/svg" width="10" height="12" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                                    </svg>
                                </a>
                                <a class="nav-link" href="./checkout.html" style="word-spacing: 2px;">Checkout
                                    <svg xmlns="http://www.w3.org/2000/svg" width="10" height="12" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                                    </svg>
                                </a>
                                <a href="./payment.html" style="text-decoration: none;">
                                    <span>Payment</span>
                                </a>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Activity Section End -->

    <!-- Payment Section Start -->
    <section class="payment">
        <div class="container payment">
            <div class="row my-5">
                <div class="col-sm-3 order_info">
                    <div class="row info_order">
                        <div class="col-sm-12 ">
                            <h1 class="my-4 mx-2">YOUR ORDER</h1>
                        </div>
    
                        <div class="d-flex justify-content-center align-items-center">
                            <div class="col-6 ">
                                <h2>Product</h2>
                            </div>
                            <div class="col-6 text-end">
                                <h2>Total</h2>
                            </div>
                        </div>
                        
                        <div class="d-flex">
                            <div class="col-7">
                                <ol class="list list-group-numbered p-0">
                                    <li class="list-group-item">Man Kimono Set</li>
                                    <li class="list-group-item">Reebok M1 Shoes</li>
                                    <li class="list-group-item">Black Glasses</li>
                                    <li class="list-group-item">School Bag</li>
                                </ol>
                            </div>

                            <div class="col-5">
                                <ul class="list list-group-flush text-end">
                                    <li class="list-group-item">Rp 249.999</li>
                                    <li class="list-group-item">Rp 699.999</li>
                                    <li class="list-group-item">Rp 149.999</li>
                                    <li class="list-group-item">Rp 119.999</li>
                                </ul>
                            </div>
                        </div>
    
                        <div class="d-flex justify-content-center align-items-center">
                            <div class="col-2">
                                <h2>Total</h2>
                            </div>
                            <div class="col-10 text-end">
                                <a2>Rp 1.219.996</a2>
                            </div>
                        </div>  
                    </div>
                    
                </div>


                <div class="col-sm-7 payment_info px-3 mx-5 ">
                    <div class="col-sm-12 total_payment">
                        <div class="title_text_payment justify-content-center align-items-center">
                            <h1 class="mx-4 my-2">PAYMENT</h1>
                            <div class="row border-bottom mx-4">
                                <div class="col-9 total_payment p-0">
                                    <a>Total Payment</a>
                                </div>
                                <div class="col-3 p-0 text-end">
                                    <a1>Rp 1.219.996</a1>
                                </div>
                            </div>
                            <div class="row mx-4">
                                <div class="col-7 p-0">
                                    <a>No. Rek/Virtual Account</a>
                                </div>
                                <div class="col-5 p-0 text-end ">
                                    <a1>23 Hour 59 Minute 59 Second</a1>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="my-1">
                        <div class="title_text_bank border-bottom">
                            <img src="./images/38.png"> 
                            <a>Bank Central Asia</a>
                            <div class="row mx-4">
                                <div class="text_norek">
                                    <a>No. Rek/Virtual Account</a>
                                </div>
                            </div>
                            <div class="row mx-4">
                                <div class="col-10">
                                    <a1>126 0812 7432 6424</a1>
                                </div>
                                <div class="col-2 text-end">
                                    <a2 >Copy</a2>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 total_payment my-1">
                        <div class="title_text_instruction justify-content-center align-items-center">
                            <h1 class="border-bottom mx-4">mBanking Transfer Instruction</h1>
                            <div class="row">
                                <div class="d-flex text_1 mx-3">
                                    <div class="d-flex justify-content-center align-items-center mx-2">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-1-circle-fill" viewBox="0 0 16 16">
                                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0ZM9.283 4.002H7.971L6.072 5.385v1.271l1.834-1.318h.065V12h1.312V4.002Z"/>
                                        </svg>
                                        <p  class="m-0 mx-2">Select m-Transfer > BCA Virtual Account.</p>
                                    </div>
                                </div>
    
                                <div class="d-flex text_2 mx-3">
                                    <div class="d-flex justify-content-center align-items-center mx-2">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-2-circle-fill" viewBox="0 0 16 16">
                                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0ZM6.646 6.24c0-.691.493-1.306 1.336-1.306.756 0 1.313.492 1.313 1.236 0 .697-.469 1.23-.902 1.705l-2.971 3.293V12h5.344v-1.107H7.268v-.077l1.974-2.22.096-.107c.688-.763 1.287-1.428 1.287-2.43 0-1.266-1.031-2.215-2.613-2.215-1.758 0-2.637 1.19-2.637 2.402v.065h1.271v-.07Z"/>
                                        </svg>
                                        <p class="m-0 mx-2">Enter the Virtual Account number, then select Send.</p>
                                    </div>
                                </div>
    
                                <div class="d-flex text_3 mx-3">
                                    <div class="d-flex mx-2">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="27" height="27" fill="currentColor" class="bi bi-3-circle-fill" viewBox="0 0 16 16">
                                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0Zm-8.082.414c.92 0 1.535.54 1.541 1.318.012.791-.615 1.36-1.588 1.354-.861-.006-1.482-.469-1.54-1.066H5.104c.047 1.177 1.05 2.144 2.754 2.144 1.653 0 2.954-.937 2.93-2.396-.023-1.278-1.031-1.846-1.734-1.916v-.07c.597-.1 1.505-.739 1.482-1.876-.03-1.177-1.043-2.074-2.637-2.062-1.675.006-2.59.984-2.625 2.12h1.248c.036-.556.557-1.054 1.348-1.054.785 0 1.348.486 1.348 1.195.006.715-.563 1.237-1.342 1.237h-.838v1.072h.879Z"/>
                                        </svg>
                                        <p class="m-0 mx-2">Check the information displayed on the screen. Make sure the merchant is <b>Dikaosan</b>, the <b>Billing Total</b> is correct and your <b>Username </b> is correct. If correct, select Yes.</p>

                                    </div>                                    
                                </div>
    
                                <div class="d-flex text_4 mx-3">
                                    <div class="d-flex justify-content-center align-items-center mx-2">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-4-circle-fill" viewBox="0 0 16 16">
                                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0ZM7.519 5.057c-.886 1.418-1.772 2.838-2.542 4.265v1.12H8.85V12h1.26v-1.559h1.007V9.334H10.11V4.002H8.176c-.218.352-.438.703-.657 1.055ZM6.225 9.281v.053H8.85V5.063h-.065c-.867 1.33-1.787 2.806-2.56 4.218Z"/>
                                        </svg>
                                        <p class="m-0 mx-2">Enter your m-BCA PIN and select <b>OK.</b></p>
                                    </div> 
                                </div>
    
                                <div class="d-flex text_5 mx-3">
                                    <div class="d-flex mx-2">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-5-circle-fill" viewBox="0 0 16 16">
                                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0Zm-8.006 4.158c1.74 0 2.924-1.119 2.924-2.806 0-1.641-1.178-2.584-2.56-2.584-.897 0-1.442.421-1.612.68h-.064l.193-2.344h3.621V4.002H5.791L5.445 8.63h1.149c.193-.358.668-.809 1.435-.809.85 0 1.582.604 1.582 1.57 0 1.085-.779 1.682-1.57 1.682-.697 0-1.389-.31-1.53-1.031H5.276c.065 1.213 1.149 2.115 2.72 2.115Z"/>
                                        </svg>
                                        <p class="m-0 mx-2">If the notification <b>“Transaction Failed. The amount exceeds the daily limit”</b>, please repeat the transaction using KlikBCA (iBanking) or ATM <b>Dikaosan.</b></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 total_payment my-1">
                        <div class="title_text justify-content-center align-items-center">
                            <div class="payment_btn">
                                <a class="btn btn-payment-ok d-flex justify-content-center align-items-center">OK</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                
            </div>
        </div>
    </section>
    <!-- Payment Section End -->

    <!-- Footer Section Start -->
    <%@ include file = "../../includes/fe_includes/_footer.jsp" %>
    <!-- Footer Section End-->

    <!-- Script Section Start -->
    <%@ include file = "../../includes/fe_includes/_scripts.jsp" %>
    <!-- Script Section End -->
</body>
</html>