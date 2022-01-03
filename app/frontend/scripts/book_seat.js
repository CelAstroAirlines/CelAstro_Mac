// import axios from "axios"

// document.addEventListener('turbolinks:load', () => {

//   const csrf_token = document.querySelector("meta[name='csrf-token']")
//   const seat_confirm = document.querySelector("#seat_confirm")
//   const seats = document.querySelector('#seats')
//   let formated_seat = {}

//   // seats && seats.addEventListener("click", (res) => {
//   //   console.log(res.path[1].id)
//   // })


//   function choose_seats(click_event) {
//     if (click_event.target.checked === true) {
//       formated_seat[`${click_event.path[1].id}`] = true
//       // console.log(res.target.id)
//       // console.log(formated_seat)
//     } else {
//       delete formated_seat[`${click_event.path[1].id}`]
//     }
//   }

//   async function api_seats_check(click_event) {
//     let api_seat_check = {}
//     api_seat_check["seat"] = click_event.path[1].id
//     axios.defaults.headers.common['X-CSRF-TOKEN'] = csrf_token.content
//     let res = await axios.post(`/api/v1/tickets/ATEST123/seats/check`, api_seat_check);
//     let data = res.data.result;
//     if (data === "false") {
//       alert('此位已被選取');
//     } else {
//       choose_seats(click_event)
//     };
//   }


//   seats && seats.addEventListener("click", (res) => {
//     // choose_seats(res)
//     api_seats_check(res)
//   })

//   async function api_seat_confirm(all_seats) {
//     axios.defaults.headers.common['X-CSRF-TOKEN'] = csrf_token.content
//     let seats_key = {}
//     seats_key["seat"] = all_seats
//     let res = await axios.post(`/api/v1/tickets/ATEST123/seats/update`, seats_key);
//     let data = res.data;
//   }

//   function confirm_seats() {
//     if (seat_confirm) {
//       seat_confirm.addEventListener("click", () => {
//         api_seat_confirm(formated_seat);
//       })
//     }
//   }

//   confirm_seats()
// })