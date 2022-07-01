// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

/* navbarのlink先にいるときに、表示を変化させる */
document.addEventListener("turbo:load", () => {
  const navLinks = document.querySelectorAll(".nav-link");
  const nowHref = document.location.href;
  navLinks.forEach(navLink => {
    if (navLink.href === nowHref) {
      navLink.classList.add("active");
      navLink.setAttribute("aria-current", "page");
    }
  });
});
