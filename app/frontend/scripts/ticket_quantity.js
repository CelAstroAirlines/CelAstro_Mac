// jQuery
// window.onload = function() {
//   $(".quantity_selection").change(function () {
//     const value = $(this).val();
//     $(".quantity").val(value);
//   })
// }

document.addEventListener("DOMContentLoaded", () => {
  const quantitySelection = document.querySelectorAll('.quantity_selection');
  const quantity = document.querySelectorAll('.quantity');
  for(let i=0; i<quantitySelection.length; i++){
    if(quantitySelection[i]){
      quantitySelection[i].addEventListener('change', (e) => {
        const value = e.target.value;
        for(let j=0; j<quantity.length; j++){
          quantity[j].value = Number(value);
        }
      })
    }
  }
})