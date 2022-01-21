window.onload = function() {
  $(".quantity_selection").change(function () {
    const value = $(this).val();
    $(".quantity").val(value);
  })
}