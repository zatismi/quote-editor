// FETCHING API DATA WITH STIMULUS
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
          // https://developer.mozilla.org/en-US/docs/Web/API/URLSearchParams
          const weatherApiUrl = new URL("https://api.openweathermap.org/data/2.5/weather")
          weatherApiUrl.searchParams.set('lat', position.coords.latitude);
          weatherApiUrl.searchParams.set('lon', position.coords.longitude);
          weatherApiUrl.searchParams.set('appid', "f63e12e4c7f22c4b3c225c9b1ec5208d");
          weatherApiUrl.searchParams.set('units', "metric");
          try {
            const response = await fetch(weatherApiUrl);
            const data = await response.json();
            const weatherDescription = data.weather[0].description;

            const cityName = data.name;
            this.weatherTarget.innerHTML = `The weather in <span class="text-warning">${cityName}</span> is <span class="text-warning">${weatherDescription}</span> today!<br><span class="text-info">Refresh page for updated weather data.</span>`;
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
