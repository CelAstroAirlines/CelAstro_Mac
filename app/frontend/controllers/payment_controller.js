
import { Controller } from "stimulus";
export default class extends Controller {

  connect(){
    setTimeout(() => {
      this.element.submit()
    }, 1000); 
  }
}
