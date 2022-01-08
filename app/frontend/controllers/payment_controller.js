
import { Controller } from "stimulus";
export default class extends Controller {

  static targets = []

  connect(){
    setTimeout(() => {
      this.element.submit()
    }, 1000); 
  }
}
