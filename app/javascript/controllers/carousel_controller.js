// TODO: Implement carousel controller

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carousel"
export default class extends Controller {
  static targets = ["carousel"]

  connect() {
    // Set the interval to automatically go to the next slide every 2 seconds
    this.startAutoSlide()
  }

  startAutoSlide() {
    this.interval = setInterval(() => {
      const carousel = this.carouselTarget
      const nextButton = carousel.querySelector('[data-bs-slide="next"]')
      nextButton.click() // Trigger the 'next' slide click
    }, 2500)
  }

  disconnect() {
    // Clear the interval when the controller is disconnected
    clearInterval(this.interval)
  }
}
