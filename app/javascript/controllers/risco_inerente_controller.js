import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="risco-inerente"
export default class extends Controller {
  static targets = [ "probabilidade", "impacto", "riscoInerente" ]

  calculateInerente() {
    let probabilidade = this.valorProbabilidade();
    let impacto = this.valorImpacto();
    let riscoInerente = probabilidade * impacto;
    let riscoInerenteFormatado = this.valorRiscoInerente(riscoInerente);

    // Atualizando o campo visível com o texto formatado
    this.riscoInerenteTarget.value = riscoInerenteFormatado;

    // Atualizando o atributo data-risco-inerente-value
    this.riscoInerenteTarget.setAttribute("data-risco-inerente-value", riscoInerente);

    // Disparando o evento para notificar o controlador de risco-residual
    const evento = new CustomEvent("riscoInerenteAtualizado", {
        detail: { riscoInerente, riscoInerenteFormatado },
        bubbles: true // Garante que o evento será capturado por elementos pais
    });
    this.element.dispatchEvent(evento);

    // console.log("Evento disparado: riscoInerenteAtualizado", { riscoInerente, riscoInerenteFormatado });
  }

  valorProbabilidade() {
    let probabilidade

    switch (this.probabilidadeTarget.value) {
      case 'Muito Baixa':
        probabilidade = 1
        break
      case 'Baixa':
        probabilidade = 2
        break
      case 'Média':
        probabilidade = 3
        break
      case 'Alta':
        probabilidade = 4
        break
      case 'Muito Alta':
        probabilidade = 5
        break
      default:
        probabilidade = 0
    }
    return probabilidade
  }

  valorImpacto() {
    let impacto

    switch (this.impactoTarget.value) {
      case 'Muito Baixo':
        impacto = 1
        break
      case 'Baixo':
        impacto = 2
        break
      case 'Médio':
        impacto = 3
        break
      case 'Alto':
        impacto = 4
        break
      case 'Crítico':
        impacto = 5
        break
      default:
        impacto = 0
    }

    return impacto
  }

  valorRiscoInerente(riscoInerente) {
    if (riscoInerente >= 1 && riscoInerente <= 3) {
      return `Risco Muito Baixo (${riscoInerente})`
    } else if (riscoInerente >= 4 && riscoInerente <= 7) {
      return `Risco Baixo(${riscoInerente})`
    } else if (riscoInerente >= 8 && riscoInerente <= 10) {
      return `Risco Médio (${riscoInerente})`
    } else if (riscoInerente >= 11 && riscoInerente <= 15) {
      return `Risco Alto (${riscoInerente})`
    } else if (riscoInerente >= 16) {
      return `Risco Crítico (${riscoInerente})`
    } else {
      return 'Calculando Risco Inerente...'
    }
  }
}
