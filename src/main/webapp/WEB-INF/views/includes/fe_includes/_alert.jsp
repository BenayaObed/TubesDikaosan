<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
  <div class="page-alerts">
    <div class="alert alert-success page-alert" id="alert-1">
        <button type="button" class="close"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
        <strong>Well done!</strong> You successfully read this important alert message.
    </div>
    <div class="alert alert-info page-alert" id="alert-2">
        <button type="button" class="close"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
        <strong>Heads up!</strong> This alert needs your attention, but it's not super important.
    </div>
    <div class="alert alert-warning page-alert" id="alert-3">
        <button type="button" class="close"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
        <strong>Warning!</strong> Best check yo self, you're not looking too good.
    </div>
    <div class="alert alert-danger page-alert" id="alert-4">
        <button type="button" class="close"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
        <strong>Oh snap!</strong> Change a few things up and try submitting again.
    </div>
    <div class="alert alert-success page-alert" id="alert-5">
        <button type="button" class="close"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
        <strong>Cool!</strong> This alert will close in 3 seconds. The data-delay attribute is in milliseconds.
    </div>
</div>

<script>$(function() {
  $('.page-alert').hide();
  //Show alert
  $('button[data-toggle="page-alert"]').click(function(e) {
      e.preventDefault();
      var id = $(this).attr('data-toggle-id');
      var alert = $('#alert-' + id);
      var timeOut;
      alert.appendTo('.page-alerts');
      alert.slideDown();
      
      //Is autoclosing alert
      var delay = $(this).attr('data-delay');
      if(delay != undefined)
      {
          delay = parseInt(delay);
          clearTimeout(timeOut);
          timeOut = window.setTimeout(function() {
                  alert.slideUp();
              }, delay);
      }
  });
  
  //Close alert
  $('.page-alert .close').click(function(e) {
      e.preventDefault();
      $(this).closest('.page-alert').slideUp();
  });
  
  //Clear all
  $('.clear-page-alerts').click(function(e) {
      e.preventDefault();
      $('.page-alert').slideUp();
  });
});</script>