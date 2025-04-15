import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()
import { Portuguese } from "flatpickr/dist/l10n/pt"

export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      locale: Portuguese,
      dateFormat: "d/m/Y"
    });
  }
}
