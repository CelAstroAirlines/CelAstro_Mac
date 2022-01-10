import { Controller } from "stimulus"
import httpClient from "lib/http/client"
import consumer from "../channels/consumer"

export default class extends Controller {
  static targets = ["seat_info", "seatBookedInfo"]

  finish() {
    const ticketId = this.seatBookedInfoTarget.dataset.ticket_id
    httpClient.post(`/seats/${ticketId}/finished`)
  }

  check() {
    const seatId = this.seat_infoTarget.dataset.seat_id
    const ticketId = this.seat_infoTarget.dataset.ticket_id
    let apiSeatCheck = {
      seat: seatId
    }
    httpClient.post(`/seats/${ticketId}/check`, apiSeatCheck)
  }

  confirm() {
    const ticketId = this.seat_infoTarget.dataset.ticket_id
    window.location = `/seats/${ticketId}/confirm`
  }

  connect() {
    this.channel = consumer.subscriptions.create({
      channel: 'SeatsRoomChannel'
    },
      {
        received: this._cableReceived.bind(this),
      });
  }
  _cableReceived(data) {
    // console.log(data);
    const seat = document.querySelector(`[data-seat_id='${data.seat_params.id}']`)
    const currentUser = document.querySelector('#current_user')
    if (currentUser.innerHTML != data.seat_params.user_id && data.seat_params.state == "occupied") {
      seat.innerHTML = `
        <img src="/images/green_seat.png">`
    } else { seat.innerHTML = data.message }

  }
}