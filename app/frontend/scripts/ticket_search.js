document.addEventListener("DOMContentLoaded", function(){
  const tripType = document.getElementById('ticket_type');
  const returnDateForm = document.getElementById('return_date');
  const returnValue = document.getElementById('returnDateField');
  const button = document.getElementById('srcButton')
  if (tripType){
    tripType.addEventListener('change', (e) => {
      if(e.target.value === "roundtrip"){
        if (returnDateForm.style.display === "none") {
          returnDateForm.style.display = "block"
        }}
        // button.addEventListener('click', (e)=> {
        //   if (returnValue.innerText === ""){
        //     alert("請輸入回程日期")
        //     returnValue.innerText = '${Date.today}'
        //   }
        //  })
    })
  }
  }
)