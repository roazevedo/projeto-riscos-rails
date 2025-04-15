class RelatoriosController < ApplicationController
  def obter_orgao
    # Carrega os órgãos únicos para o dropdown inicial
    @orgaos = Processo.select(:orgao).distinct.pluck(:orgao)
  end

  def setores
    # Carrega os setores relacionados ao órgão selecionado
    setores = Processo.where(orgao: params[:orgao]).select(:setor).distinct.pluck(:setor)
    render json: setores
  end

  def processos
    # Carrega os processos relacionados ao órgão e setor selecionados
    processos = Processo.where(orgao: params[:orgao], setor: params[:setor]).pluck(:nome)
    render json: processos
  end
end
