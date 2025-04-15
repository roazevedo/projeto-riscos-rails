import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="fac"
export default class extends Controller {
  static targets = [ "checkbox", "fac" ]

  connect() {
    this.calculateFac()
  }

  calculateFac() {
    let fac = 1.0

    this.checkboxTargets.forEach((checkbox) => {
      if (checkbox.checked) {
        fac -= 0.2
      }
    });

    let facValue = fac.toFixed(1);
    let facValueFormatado = `${this.valorFac(facValue)} (${facValue})`;

    this.facTarget.value = facValueFormatado;

    this.facTarget.setAttribute("data-fac-value", facValue);

    const evento = new CustomEvent("facAtualizado", {
      detail: { facValue, facValueFormatado },
      bubbles: true // Garante que o evento será capturado por elementos pais
    });

    this.element.dispatchEvent(evento);

    // console.log("Evento disparado: facAtualizado", { facValue, facValueFormatado });
  }

  valorFac(fac) {
    let fac_value

    switch (parseFloat(fac)) {
      case 1.0:
        fac_value = "Ineficaz"
        break;
      case 0.8:
        fac_value = "Fraco"
        break;
      case 0.6:
        fac_value = "Mediano"
        break;
      case 0.4:
        fac_value = "Satisfatório"
        break;
      case 0.2:
        fac_value = "Forte"
        break;
    }

    return fac_value
  }
}
