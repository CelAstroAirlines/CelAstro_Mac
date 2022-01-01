document.addEventListener('turbolinks:load', ()=> {
  const trip = document.getElementById("trip_count")
  trip.onchange = function(){
    const tripType = document.getElementById("trip_count").value
    if (tripType === "round_trip"){
      const returnDate = document.getElementById("departure_date")
      // 2. input
      // const inputEl = document.createElement('template')
      // 3 append form container
      // formComtainer.append(inputEl)
      const template = document.querySelector("#newSearch")
      const clone = template.content.cloneNode(true)
      returnDate.appendChild(clone)
    }

  }

}
)

