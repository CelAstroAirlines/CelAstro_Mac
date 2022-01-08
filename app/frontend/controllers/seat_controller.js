import { Controller } from "stimulus"
import httpClient from "lib/http/client"
import consumer from "../channels/consumer"

export default class extends Controller {
  static targets = ["seat_info", "seatstatus"]

  check() {
    const seatId = this.seat_infoTarget.dataset.seat_id
    const ticketId = this.seat_infoTarget.dataset.ticket_id
    let apiSeatCheck = {
      seat: seatId
    }
    httpClient.post(`/seats/${ticketId}/check`, apiSeatCheck)
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
    const seat = document.querySelector(`[data-seat_id='${data.seat_params.id}']`)
    seat.innerHTML = data.message
  }
}