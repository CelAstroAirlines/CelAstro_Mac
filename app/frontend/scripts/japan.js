document.addEventListener("DOMContentLoaded", () => {
  var modal3 = document.getElementById("Modal3");
  var img_JAPAN = document.getElementById("img_JAPAN");
  var close_btn3 = document.getElementsByClassName("close_btn3")[0];

  if(img_JAPAN){
  img_JAPAN.addEventListener('click', () => {
  modal3.style.display = "block";
  });

  close_btn3.addEventListener('click', () => {
    modal3.style.display = "none";
  });

  window.addEventListener('click', (event) =>{
  if (event.target == modal3) {
    modal3.style.display = "none";
  }
  });
  }
 });