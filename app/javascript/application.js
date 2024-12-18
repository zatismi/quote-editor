// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

// To disable Turbo for the whole application (Not recommended!) we can use the following 2 lines of code
// The two following lines disable Turbo on the whole application
import { Turbo } from "@hotwired/turbo-rails"
// Turbo.session.drive = false
// import "bootstrap";
import "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"

document.addEventListener('turbo:load', () => {
  const toasts = document.querySelectorAll('.toast');
  toasts.forEach(toast => {
    new bootstrap.Toast(toast).show();

    setTimeout(() => {
      bsToast.hide();
    }, 5000);
  });

  const carousel = new bootstrap.Carousel('#myCarousel')
});
