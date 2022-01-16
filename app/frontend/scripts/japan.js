document.addEventListener("DOMContentLoaded", function (){
  const modal3 = document.getElementById("Modal3");
  const img_JAPAN = document.getElementById("img_JAPAN");
  const close_btn3 = document.getElementsByClassName("close_btn3")[0];
  
  img_JAPAN.addEventListener('click', function (){
   modal3.style.display = "block";
  });
 
  close_btn3.addEventListener('click', function (){
     modal3.style.display = "none";
   });
 
  window.addEventListener('click', function (event){
   if (event.target == modal3) {
     modal3.style.display = "none";
   }
  });
 });