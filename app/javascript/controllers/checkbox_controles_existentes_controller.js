import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkbox-controles-existentes"
export default class extends Controller {
  static targets = [ "checkbox", "checkboxMaster" ]

  enable() {
    if (this.checkboxMasterTarget.checked) {
      this.checkboxTargets.forEach((checkbox) => {
        checkbox.disabled = !this.checkboxMasterTarget.checked;
      });
    } else {
      this.checkboxTargets.forEach((checkbox) => {
        this.disable();
      });
    }
  }

  disable() {
    this.checkboxTargets.forEach((checkbox) => {
      checkbox.checked = false;
      checkbox.disabled = true;
    });
  }
}
