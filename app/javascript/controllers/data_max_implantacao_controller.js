import { Controller } from "@hotwired/stimulus"
import { addMonths, format, parseISO } from "date-fns"

// Connects to data-controller="data-max-implantacao"
export default class extends Controller {
  static targets = [ "dataDeCadastro", "residualDataMax", "dataMaxImplantacao" ]

  connect() {
    // Escutar eventos disparados pelos outros controladores
    this.element.addEventListener("riscoResidualAtualizado", this.handleResidualAtualizado.bind(this));
  }

  handleResidualAtualizado(event) {
    const { riscoResidual, riscoResidualFormatado } = event.detail;

    // console.log("Residual recebido:", riscoResidual, "Formatado:", riscoResidualFormatado);

    // Atualizar o valor do target de fator de avaliação de controles com o texto formatado
    this.riscoResidualValor = this.extrairTexto(riscoResidualFormatado);

    // Atualizar a data máxima de implantação
    this.calculateData();
  }

  extrairTexto(riscoResidualFormatado) {
    // Usar expressão regular para remover a parte numérica e os parênteses
    return riscoResidualFormatado.replace(/\(\d+(\.\d+)?\)/, '').trim();
  }

   calculateData() {
    let riscoResidualValor = this.riscoResidualValor;
    const dataDeCadastro = this.dataDeCadastroTarget.value;
    const dataMaxImplantacao = this.valorDataMaxImplantacao(riscoResidualValor, dataDeCadastro);
    console.log("RISCO RESIDUAL: ", riscoResidualValor, "DATA DE CADASTRO: ", dataDeCadastro);
    this.dataMaxImplantacaoTarget.value = dataMaxImplantacao;
  }

  valorDataMaxImplantacao(riscoResidualValor, dataDeCadastro) {
    let dataMaxImplantacao;

    switch (riscoResidualValor) {
      case "Risco Muito Baixo":
        dataMaxImplantacao = "Monitorar";
        break;
      case "Risco Baixo":
        dataMaxImplantacao = this.somarMeses(dataDeCadastro, 36);
        console.log("DATA CONVERTIDA: ", dataMaxImplantacao);
        break;
      case "Risco Médio":
        dataMaxImplantacao = this.somarMeses(dataDeCadastro, 12);
        console.log("DATA CONVERTIDA: ", dataMaxImplantacao);
        break;
      case "Risco Alto":
      case "Risco Crítico":
        dataMaxImplantacao = this.somarMeses(dataDeCadastro, 6);
        console.log("DATA CONVERTIDA: ", dataMaxImplantacao);
        break;
      default:
        dataMaxImplantacao = "";
        break;
    }

    return dataMaxImplantacao;
  }

  somarMeses(data, meses) {
    // Converte a data do formato d/m/Y para um objeto Date
    const [day, month, year] = data.split("/").map(Number);
    const dataFormatada = new Date(year, month - 1, day); // JavaScript usa meses baseados em zero
    if (isNaN(dataFormatada)) {
      return "";
    }
    const novaData = addMonths(dataFormatada, meses);
    return format(novaData, "dd/MM/yyyy"); // Retorna no formato desejado
  }
}
