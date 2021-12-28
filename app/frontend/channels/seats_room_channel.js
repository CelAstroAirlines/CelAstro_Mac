import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  const element = document.getElementById("ticket-id");
  const ticket_id = element.getAttribute("data-ticket-id");


  consumer.subscriptions.create({ channel: "SeatsRoomChannel", ticket_id: ticket_id }, {
    connected() {
      console.log("搭上線啦！ " + ticket_id)
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      console.log(data)
    }
  });
})

