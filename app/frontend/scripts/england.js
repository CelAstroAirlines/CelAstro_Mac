document.addEventListener("DOMContentLoaded", function (){
 var modal = document.getElementById("Modal");
 var img_ENGLAND = document.getElementById("img_ENGLAND");
 var close_btn = document.getElementsByClassName("close_btn")[0];
 
 img_ENGLAND.addEventListener('click', function (){
  modal.style.display = "block";
 });

 close_btn.addEventListener('click', function (){
    modal.style.display = "none";
  });

 window.addEventListener('click', function (event){
  if (event.target == modal) {
    modal.style.display = "none";
  }
 });
});

