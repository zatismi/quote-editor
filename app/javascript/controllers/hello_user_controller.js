// AUTO TOGGLING TEXTS AND SENDING DATA FROM BACKEND TO FRONTEND WITH STIMULUS

import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["message"];

  connect() {
    // this.messages = ["Hello User", "The weather is nice today!"];
    // this.index = 0;
    this.startTextRotation();
  }

  // Default implementation without getting data from backend sent to here in the frontend
  // startTextRotation() {
  //   this.interval = setInterval(() => {
  //     this.index = (this.index + 1) % this.messages.length;
  //     // A Very Good Use of Modulo Operator:
  //     // a very nice way to switch between 0 and 1
  //     // so according to the index starting number, it will switch to number -1 index of the array or the number of elements in the array
  //     // so to switch between 4 elements the starting index should be 4, so the switch will start with 0, then 1, 2, 3 and then 0 again″
  //     this.messageTarget.textContent = this.messages[this.index];
  //   }, 2000);
  // }

  // Implementation with getting data from backend sent to here in the frontend
  // startTextRotation() {
  //   // Get the user's name from the data attribute
  //   const userName = this.element.querySelector('[data-user-name]').getAttribute('data-user-name');

  //   let texts = [
  //     `Hello ${userName}`,
  //     "I wish you a very nice day!"
  //   ];

  //   let index = 0;
  //   this.messageTarget.textContent = texts[index];

  //   setInterval(() => {
  //     index = (index + 1) % texts.length;
  //     this.messageTarget.textContent = texts[index];
  //   }, 2000);
  // }

  // disconnect() {
  //   clearInterval(this.interval); // Stop interval when disconnected
  // }

  startTextRotation() {
    const userName = this.element.querySelector('[data-user-name]').getAttribute('data-user-name');
    let texts = [
      `Hello ${userName}`,
      "I wish you a very nice day!"
    ];

    let index = 0;
    let charIndex = 0;
    let currentText = texts[index];
    let isDeleting = false;

    const type = () => {
      this.messageTarget.textContent = currentText.substring(0, charIndex);

      if (!isDeleting && charIndex < currentText.length) {
        charIndex++;
      } else if (isDeleting && charIndex > 0) {
        charIndex--;
      } else {
        isDeleting = !isDeleting;
        if (!isDeleting) {
          index = (index + 1) % texts.length;
          currentText = texts[index];
        }
      }

      setTimeout(type, isDeleting ? 100 : 200);
    };

    type();
  }
}
