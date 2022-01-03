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
<<<<<<< HEAD
  booked() {

  }
  connect() {
    const id = this.seat_infoTarget.dataset.id
=======
  connect() {
    const seat_id = this.seat_infoTarget.dataset.seat_id
    const area = this.seat_infoTarget.dataset.area
    const ticket_id = this.seat_infoTarget.dataset.ticket_id
    const id = this.seat_infoTarget.dataset.id
    // console.log("will create a subscription for", area, seat_id)

>>>>>>> 50ecfe7 (actioncable with stimulus)
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
<<<<<<< HEAD
    if (this.seat_infoTarget.dataset["id"] == data.seat_params.id) {
      this.seat_infoTarget.innerHTML = data.message
    }
=======
    // console.log(data.id.id)
    if (this.seat_infoTarget.dataset["id"] == data.id.id) {
      this.seat_infoTarget.innerHTML = data.message
    }

    // console.log(data.id)
    // console.log(data)


>>>>>>> 50ecfe7 (actioncable with stimulus)
  }

}


