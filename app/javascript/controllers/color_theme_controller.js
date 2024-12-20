import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="color-theme"
export default class extends Controller {
  static targets = ["icon"]

  initialize() {
    this.setColorTheme(this.getColorTheme)
  }

  connect() {
    this.toggleIcon()
  }

  toggleColorTheme() {
    this.setColorTheme(this.colorTheme === "light" ? "dark" : "light")
    this.toggleIcon()
  }

  toggleIcon() {
    this.iconTarget.classList.toggle("fa-moon", this.colorTheme === "light")
    this.iconTarget.classList.toggle("fa-sun", this.colorTheme === "dark")
  }

  setColorTheme(theme) {
    this.colorTheme = window.localStorage.colorTheme = this.element.dataset.bsTheme = theme
  }

  get getColorTheme() {
    return this.colorTheme || window.localStorage.colorTheme || this.getUserPreference
  }

  get getUserPreference() {
    return window.matchMedia && window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light"
  }
}
