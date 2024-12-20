import { Controller } from "@hotwired/stimulus"

// only import what you need where you need it
import { Toast } from "bootstrap"

// Connects to data-controller="toast"
export default class extends Controller {
  static targets = ["toast"]

  toastTargetConnected (target) {
    const toast = new Toast(target)
    toast.show()

    target.addEventListener('hidden.bs.toast', event => { event.target.remove() })
  }
}
