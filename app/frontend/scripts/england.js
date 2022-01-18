document.addEventListener("DOMContentLoaded", () => {
  var modal = document.getElementById("Modal");
  var img_ENGLAND = document.getElementById("img_ENGLAND");
  var close_btn = document.getElementsByClassName("close_btn")[0];

  if (img_ENGLAND) {
    img_ENGLAND.addEventListener('click', () => {
      modal.style.display = "block";
    });

    close_btn.addEventListener('click', () => {
      modal.style.display = "none";
    });

    window.addEventListener('click', (event) => {
      if (event.target == modal) {
        modal.style.display = "none";
      }
    });
  }
});

