    <!-- Js Plugins -->
    <!-- <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.nicescroll.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.countdown.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src=${pageContext.request.contextPath}/resources/dikaosan.js"></script>

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

<script>
$(document).ready(function() {
    var url = window.location;
    // for sidebar menu entirely but not cover treeview
    $('div.navbar-nav a').filter(function() {
        return this.href == url;
    }).addClass('active');
});
</script>