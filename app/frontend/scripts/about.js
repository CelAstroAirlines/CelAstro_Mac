document.addEventListener("turbolinks:load", function(){
  function togglePageFlip(el){
    setAllPagesBack();
    setClickedPageForward(el);
    el.classList.toggle('turn');
  }
  
  function setAllPagesBack(){
     var pages = document.getElementsByClassName("page");
     for(var i=0; i<pages.length; i++){
         pages[i].classList.remove('z-50');
     }
  }
  
  function setClickedPageForward(el){
     el.classList.add('z-50');
  }
  }
)