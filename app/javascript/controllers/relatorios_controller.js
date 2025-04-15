import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="relatorios"
export default class extends Controller {
  connect() {
    this.orgao = document.getElementById("orgao");
    this.setor = document.getElementById("setor");
    this.processo = document.getElementById("processo");

    this.carregarSetores();
    this.carregarProcessos();
  }

  carregarSetores() {
    const orgao = this.orgao.value;

    // Limpa os dropdowns dependentes
    this.setor.innerHTML = '<option>Carregando...</option>';
    this.processo.innerHTML = '<option>Selecione um setor primeiro</option>';
    this.setor.disabled = true;
    this.processo.disabled = true;

    fetch(`/relatorios/setores?orgao=${orgao}`)
      .then((response) => response.json())
      .then((setores) => {
        this.setor.innerHTML = '<option>Selecione um setor</option>';
        setores.forEach((setor) => {
          const option = document.createElement("option");
          option.value = setor;
          option.textContent = setor;
          this.setor.appendChild(option);
        });
        this.setor.disabled = false;
      });
  }

  carregarProcessos() {
    const orgao = this.orgao.value;
    const setor = this.setor.value;

    this.processo.innerHTML = '<option>Carregando...</option>';
    this.processo.disabled = true;

    fetch(`/relatorios/processos?orgao=${orgao}&setor=${setor}`)
      .then((response) => response.json())
      .then((processos) => {
        this.processo.innerHTML = '<option>Selecione um processo</option>';
        processos.forEach((processo) => {
          const option = document.createElement("option");
          option.value = processo;
          option.textContent = processo;
          this.processo.appendChild(option);
        });
        this.processo.disabled = false;
      });
  }
}
