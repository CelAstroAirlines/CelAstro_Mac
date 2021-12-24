import axios from "axios"

document.addEventListener('turbolinks:load', () => {
  // const seats = document.querySelectora('input[type="checkbox"]:checked')
  const csrf_token = document.querySelector("meta[name='csrf-token']")
  const seat_confirm = document.querySelector("#seat_confirm")




  // if (seat_confirm) {
  //   seat_confirm.addEventListener("click", () => {
  //     console.log(seats)
  //   })
  // }



  // seats.addEventListener("click", (res) => {
  //   if (res.target.checked === true) {
  //     return res.target.id
  //   }
  // })


  if (seat_confirm) {
    seat_confirm.addEventListener("click", () => {
      axios.defaults.headers.common['X-CSRF-TOKEN'] = csrf_token.content
      axios.patch("/api/v1/tickets/1/seats/1").then((res) => {
        console.log(res.data)
      })
    })
  }





})