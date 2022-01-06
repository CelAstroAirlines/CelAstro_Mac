import { Controller } from "stimulus"
import httpClient from "lib/http/client"
import consumer from "../channels/consumer"

export default class extends Controller {
  static targets = ["seat_info", "seatstatus"]

  check() {
    const seat_id = this.seat_infoTarget.dataset.seat_id
    const ticket_serial = this.seat_infoTarget.dataset.ticket_serial
    let api_seat_check = {}
    api_seat_check["seat"] = seat_id
    httpClient.post(`/seats/${ticket_serial}/check`, api_seat_check).then(({ data }) => { })
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