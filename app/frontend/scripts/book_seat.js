import axios from "axios"

document.addEventListener('turbolinks:load', () => {
  // const seats = document.querySelectora('input[type="checkbox"]:checked')
  const csrf_token = document.querySelector("meta[name='csrf-token']")
  const seat_confirm = document.querySelector("#seat_confirm")
  const seats = document.querySelector('#seats')
  let formated_seat = {}

  seats.addEventListener("click", (res) => {
    if (res.target.checked === true) {
      formated_seat[`${res.target.id}`] = true
      // console.log(res.target.id)
      // console.log(formated_seat)
    } else {
      delete formated_seat[`${res.target.id}`]
    }
  })

  async function makeGetRequest(all_seats) {
    axios.defaults.headers.common['X-CSRF-TOKEN'] = csrf_token.content
    let seats_key = {}
    seats_key["seat"] = all_seats
    let res = await axios.post(`/api/v1/tickets/1/seats/update`, seats_key);
    let data = res.data;
    console.log(data);
  }

  function confirm_seats() {
    if (seat_confirm) {
      seat_confirm.addEventListener("click", () => {
        makeGetRequest(formated_seat);
      })
    }
  }

  confirm_seats()
})