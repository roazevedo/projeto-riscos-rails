import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="risco-residual"
export default class extends Controller {
  static targets = [ "riscoResidual" ];

  connect() {
    console.log("Controlador 'risco-residual' conectado!");

    // Escutar eventos disparados pelos outros controladores
    this.element.addEventListener("riscoInerenteAtualizado", this.handleInerenteAtualizado.bind(this));
    this.element.addEventListener("facAtualizado", this.handleFacAtualizado.bind(this));

    this.calculateResidual();
  }

  handleInerenteAtualizado(event) {
    const { riscoInerente, riscoInerenteFormatado } = event.detail;

    // console.log("Risco inerente recebido:", riscoInerente, "Formatado:", riscoInerenteFormatado);

    // Atualizar o valor do target de risco inerente residual com o texto formatado
    this.riscoInerenteValor = riscoInerente;

    // Atualizar o cálculo do risco residual
    this.calculateResidual();
  }

  handleFacAtualizado(event) {
    const { facValue, facValueFormatado } = event.detail;

    // console.log("FAC recebido:", facValue, "Formatado:", facValueFormatado);

    // Atualizar o valor do target de fator de avaliação de controles com o texto formatado
    this.facValor = facValue;

    // Atualizar o cálculo do risco residual
    this.calculateResidual();
  }

  calculateResidual() {
    let riscoResidual = (this.riscoInerenteValor * this.facValor).toFixed(1);
    let riscoResidualFormatado = this.valorRiscoResidual(riscoResidual);
    this.riscoResidualTarget.value = riscoResidualFormatado;

    // Disparando o evento para notificar o controlador de risco-residual
    const evento = new CustomEvent("riscoResidualAtualizado", {
      detail: { riscoResidual, riscoResidualFormatado },
      bubbles: true // Garante que o evento será capturado por elementos pais
    });

    this.element.dispatchEvent(evento);
  }

  valorRiscoResidual(riscoResidual) {
    if (riscoResidual > 0 && riscoResidual <= 3.5) {
      return `Risco Muito Baixo (${riscoResidual})`
    } else if (riscoResidual >= 3.6 && riscoResidual <= 7.5) {
      return `Risco Baixo(${riscoResidual})`
    } else if (riscoResidual >= 7.6 && riscoResidual <= 10.5) {
      return `Risco Médio (${riscoResidual})`
    } else if (riscoResidual >= 10.6 && riscoResidual <= 15.5) {
      return `Risco Alto (${riscoResidual})`
    } else if (riscoResidual >= 15.6) {
      return `Risco Crítico (${riscoResidual})`
    } else {
      return 'Calculando Risco Residual...'
    }
  }
}
