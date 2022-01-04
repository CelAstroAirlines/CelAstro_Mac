import { Controller } from "stimulus"
import httpClient from "lib/http/client"
import consumer from "../channels/consumer"


export default class extends Controller {
  static targets = ["seat_info", "seatstatus"]

  check() {
    const seat_id = this.seat_infoTarget.dataset.seat_id
    const area = this.seat_infoTarget.dataset.area
    let api_seat_check = {}
    api_seat_check["seat_id"] = seat_id
    api_seat_check["area"] = area
    httpClient.post(`/api/v1/tickets/ATEST123/seats/check`, api_seat_check).then(({ data }) => { })
  }
  booked() {

  }
  connect() {
    const id = this.seat_infoTarget.dataset.id
    this.channel = consumer.subscriptions.create({
      channel: 'SeatsRoomChannel',
      id: id
    },
      {
        connected: this._cableConnected.bind(this),
        disconnected: this._cableDisconnected.bind(this),
        received: this._cableReceived.bind(this),
      });
  }
  _cableConnected() {
    console.log('Connected !!!')
  }
  _cableDisconnected() {
    console.log('Disconnected !!!')
  }
  _cableReceived(data) {
    if (this.seat_infoTarget.dataset["id"] == data.seat_params.id) {
      this.seat_infoTarget.innerHTML = data.message
    }
  }

}


