import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["weather"];

  connect() {
    this.fetchWeatherData();
  }

  async fetchWeatherData() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        async (position) => {
          const latitude = position.coords.latitude;
          const longitude = position.coords.longitude;

          const apiKey = "f63e12e4c7f22c4b3c225c9b1ec5208d"; // Replace with your API key
          const weatherApiUrl = `https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=${apiKey}&units=metric`;

          try {
            const response = await fetch(weatherApiUrl);
            const data = await response.json();
            const weatherDescription = data.weather[0].description;

            // Update the weather description in the weather target
            const cityName = data.name;
            this.weatherTarget.innerHTML = `The weather in <span class="text-warning">${cityName}</span> is <span class="text-warning">${weatherDescription}</span> today!`;
          } catch (error) {
            console.error("Error fetching weather data:", error);
            this.weatherTarget.textContent = "Unable to get weather data.";
          }
        },
        () => {
          this.weatherTarget.textContent = "Unable to retrieve your location.";
        }
      );
    } else {
      this.weatherTarget.textContent = "Geolocation is not supported by this browser.";
    }
  }
}
