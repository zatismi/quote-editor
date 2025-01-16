// REDIRECTING PAGE WITH STIMULUS
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = { shopsCount: Number, redirectPath: String }

  connect() {
    if (this.quotesCountValue === 0) {
      window.location.href = this.redirectPathValue;
    }
  }
}
