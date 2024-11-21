class RiscosController < ApplicationController
  before_action :set_processo, only: [:new, :create]
  before_action :set_risco, only: [:show, :edit, :update, :destroy]
  before_action :set_dropboxes_values_form, only: [:new, :edit]

  def index
    @riscos = Risco.all
  end

  def show; end

  def new
    @risco = Risco.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @risco = @processo.riscos.build(risco_params)
    if @risco.save
      redirect_to risco_path(@risco), notice: 'Risco cadastrado com sucesso'
    else
      render :new, alert: 'Erro ao cadastrar risco', status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @risco.update(risco_params)
      redirect_to risco_path(@risco), notice: 'Risco atualizado com sucesso'
    else
      render :edit, notice: 'Erro ao atualizar risco', status: :unprocessable_entity
    end
  end

  def destroy
    if @risco.destroy
      redirect_to riscos_path, notice: 'Risco excluído com sucesso'
    else
      redirect_to @risco, alert: 'Erro ao excluir risco', status: :unprocessable_entity
    end
  end

  private

  def risco_params
    params.require(:risco).permit(:nome, :data_identificacao, :tipo_de_risco, :associacao_risco, :causas, :consequencias, :dimensoes_risco, :probabilidade,
                                  :justificativa_pr, :impacto, :justificativa_imp, :risco_inerente, :existe_procedimento_de_controle, :descricao_do_controle_existente,
                                  :controle_eficaz, :controle_proporcional, :controle_razoavel, :controle_adequado, :fator_de_avaliacao_controles, :risco_residual,
                                  :resposta_sugerida_para_risco, :data_maxima_para_implantacao_dos_controles_propostos, :relacao_com_LGPD)
  end

  def set_processo
    @processo = Processo.find(params[:processo_id])
  end

  def set_risco
    @risco = Risco.find(params[:id])
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
