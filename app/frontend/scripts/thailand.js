document.addEventListener("DOMContentLoaded", () => {
  const modal2 = document.getElementById("Modal2");
  const img_THAILAND = document.getElementById("img_THAILAND");
  const close_btn2 = document.getElementsByClassName("close_btn2")[0];
  
  if(img_THAILAND){
  img_THAILAND.addEventListener('click', () => {
   modal2.style.display = "block";
  });
 
  close_btn2.addEventListener('click', () => {
     modal2.style.display = "none";
   });
 
  window.addEventListener('click', (event) => {
   if (event.target == modal2) {
     modal2.style.display = "none";
   }
  });
  }
 });