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