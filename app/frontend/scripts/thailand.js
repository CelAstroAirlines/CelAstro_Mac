document.addEventListener("DOMContentLoaded", function (){
  const modal2 = document.getElementById("Modal2");
  const img_THAILAND = document.getElementById("img_THAILAND");
  const close_btn2 = document.getElementsByClassName("close_btn2")[0];
  
  img_THAILAND.addEventListener('click', function (){
   modal2.style.display = "block";
  });
 
  close_btn2.addEventListener('click', function (){
     modal2.style.display = "none";
   });
 
  window.addEventListener('click', function (event){
   if (event.target == modal2) {
     modal2.style.display = "none";
   }
  });
 });