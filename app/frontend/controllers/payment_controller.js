
import { Controller } from "stimulus";
export default class extends Controller {

  static targets = []

  connect(){
    setTimeout(() => {
      this.element.submit()
<<<<<<< HEAD
    }, 1000);
    
=======
    }, 1000);   
>>>>>>> 36ec7d8 (新增藍新傳送動畫&修復首頁跑版)
  }
}
