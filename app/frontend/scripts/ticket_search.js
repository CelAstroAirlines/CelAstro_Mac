document.addEventListener("DOMContentLoaded", function(){
  const tripType = document.getElementById('ticket_type');
  const returnDateForm = document.getElementById('return_date');
  const returnValue = document.getElementById('returnDateField');
  const button = document.getElementById('srcButton')
  if (tripType){
    tripType.addEventListener('change', (e) => {
      if(e.target.value === "來回"){
        if (returnDateForm.style.display === "none") {
          returnDateForm.style.display = "block"
        }}
    })
  }
  }
)