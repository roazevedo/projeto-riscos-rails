class ProcessosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :set_processo, only: [:show, :edit, :update, :destroy]
  before_action :set_dropboxes_values_form, only: [:new, :edit]

  def home
    @resource = User.new
    @resource_name = :user
    @devise_mapping = Devise.mappings[:user]

    redirect_to dashboards_path if user_signed_in?
  end

  def index
    @processos = Processo.all
    @processo = Processo.new
  end

  def show
    @risco = Risco.new
  end

  def new
    @processo = Processo.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @processo = Processo.new(processo_params)
    if @processo.save
      redirect_to processo_path(@processo), notice: "Processo criado com sucesso!"
    else
      render :new, alert: "Erro ao criar processo!", status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @processo.update(processo_params)
      redirect_to processo_path(@processo), notice: "Processo atualizado com sucesso!"
    else
      render :edit, alert: "Erro ao atualizar processo!", status: :unprocessable_entity
    end
  end

  def destroy
    if @processo.destroy
      redirect_to processos_path, notice: "Processo excluído com sucesso!"
    else
      redirect_to processo_path(@processo), alert: "Erro ao excluir processo!", status: :unprocessable_entity
    end
  end

  private

  def processo_params
    params.require(:processo).permit(:nome, :orgao, :setor, :gestor_processo, :servidor_responsavel, :objetivo_estrategico, :embasamento_legal, :sistemas_utilizados, :partes_interessadas)
  end

  def set_processo
    @processo = Processo.find(params[:id])
  end

  def set_dropboxes_values_form
    @tipo_de_risco = ['Suporte', 'Operacional']
    @associacao_risco = ['Projeto', 'Processo', 'Objetivo Estratégico']
    @dimensoes_risco = ['Estratégico', 'Operacional', 'Imagem', 'Conformidade', 'Sancionatório', 'Orçamentário', 'Integridade', 'Privacidade']
    @probabilidade = ['Muito Baixa', 'Baixa', 'Média', 'Alta', 'Muito Alta']
    @impacto = ['Muito Baixo', 'Baixo', 'Médio', 'Alto', 'Crítico']
    @resposta_sugerida_para_risco = ['Evitar', 'Eliminar', 'Reduzir', 'Compartilhar', 'Potencializar', 'Aceitar']
  end
end
