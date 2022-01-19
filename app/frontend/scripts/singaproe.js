document.addEventListener("DOMContentLoaded", () => {
  const modal5 = document.getElementById("Modal5");
  const img_SINGAPROE = document.getElementById("img_SINGAPROE");
  const close_btn5 = document.getElementsByClassName("close_btn5")[0];
  
  if(img_SINGAPROE){
  img_SINGAPROE.addEventListener('click', () => {
   modal5.style.display = "block";
  });
 
  close_btn5.addEventListener('click', () => {
     modal5.style.display = "none";
   });
 
  window.addEventListener('click', (event) =>{
   if (event.target == modal5) {
     modal5.style.display = "none";
   }
  });
  }
 });