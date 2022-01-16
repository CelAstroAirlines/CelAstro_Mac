document.addEventListener("DOMContentLoaded", function (){
  const modal5 = document.getElementById("Modal5");
  const img_SINGAPROE = document.getElementById("img_SINGAPROE");
  const close_btn5 = document.getElementsByClassName("close_btn5")[0];
  
  img_SINGAPROE.addEventListener('click', function (){
   modal5.style.display = "block";
  });
 
  close_btn5.addEventListener('click', function (){
     modal5.style.display = "none";
   });
 
  window.addEventListener('click', function (event){
   if (event.target == modal5) {
     modal5.style.display = "none";
   }
  });
 });