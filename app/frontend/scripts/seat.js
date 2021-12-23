document.addEventListener('turbolinks:load', () => {
  const seats = document.querySelector("#seats")
  if (seats) {
    seats.addEventListener("click", (e) => {
      console.log(e.target.id)
    })
  }

})