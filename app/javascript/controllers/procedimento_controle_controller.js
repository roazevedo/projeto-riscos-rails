import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="procedimento-controle"
export default class extends Controller {
  static targets = [ "existeControles", "checkEficaz" ]

  connect() {
    this.checkboxControlesExistentesController = this.application.getControllerForElementAndIdentifier(
      document.querySelector("[data-controller='checkbox-controles-existentes']"),
      "checkbox-controles-existentes"
    );
  }

  habilitarCheckboxes() {
    const existeProcedimentoControle = this.existeControlesTarget;
    const checkEficaz = this.checkEficazTarget;

    if (existeProcedimentoControle.checked) {
      checkEficaz.disabled = false;
    } else {
      checkEficaz.checked = false;
      checkEficaz.disabled = true;

      // Chamar a função disable do controller "checkbox-controles-existentes"
      const checkboxController = this.application.getControllerForElementAndIdentifier(
        this.element,
        "checkbox-controles-existentes"
      );

      if (checkboxController) {
        checkboxController.disable();
      }
    }

    // Chamar a função calculateFac do controller "fac"
    const fac = this.application.getControllerForElementAndIdentifier(
      this.element,
      "fac"
    );

    if (fac) {
      fac.calculateFac();
    }
  }
}
