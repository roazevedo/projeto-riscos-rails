import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="show-form"
export default class extends Controller {
  showForm(event) {
    console.log(event);
    event.preventDefault();
    this.url = this.element.getAttribute("href");
    fetch(this.url, {
      headers: {
        Accept: "text/vnd.turbo-stream.html",
      }
    })
    .then(response => response.text())
    .then(html => {
      Turbo.renderStreamMessage(html)

      // Salva o estado do modal como aberto
      sessionStorage.setItem('showModal', 'true');
    });
  }
}
