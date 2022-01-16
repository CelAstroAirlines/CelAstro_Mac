document.addEventListener("DOMContentLoaded", function (){
  const modal4 = document.getElementById("Modal4");
  const img_KOREA = document.getElementById("img_KOREA");
  const close_btn4 = document.getElementsByClassName("close_btn4")[0];
  
  img_KOREA.addEventListener('click', function (){
   modal4.style.display = "block";
  });
 
  close_btn4.addEventListener('click', function (){
     modal4.style.display = "none";
   });
 
  window.addEventListener('click', function (event){
   if (event.target == modal4) {
     modal4.style.display = "none";
   }
  });
 });