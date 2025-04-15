class ControlesController < ApplicationController
  before_action :set_risco, only: [:new, :create]
  before_action :set_controle, only: [:show, :edit, :update, :destroy]
  before_action :set_dropboxes_values_form, only: [:new, :edit]

  def index
    @controles = Controle.all
  end

  def show
    @risco = @controle.risco
  end

  def new
    @controle = Controle.new
  end

  def create
    @controle = @risco.controles.build(controle_params)
    if @controle.save
      redirect_to controle_path(@controle), notice: 'Controle cadastrado com sucesso'
    else
      render :new, alert: 'Erro ao cadastrar controle', status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @controle.update(controle_params)
      redirect_to controle_path(@controle), notice: 'Controle atualizado com sucesso'
    else
      render :edit, notice: 'Erro ao atualizar controle', status: :unprocessable_entity
    end
  end

  def destroy
    @risco = @controle.risco
    if @controle.destroy
      redirect_to risco_path(@risco), notice: 'Controle excluído com sucesso'
    else
      redirect_to @controle, alert: 'Erro ao excluir controle', status: :unprocessable_entity
    end
  end

  private

  def controle_params
    params.require(:controle).permit(:nome, :novo_ou_modificado, :tipo_do_controle,
                                    :natureza_do_controle, :relacao_com_o_risco,
                                    :responsavel_pela_acao, :data_prevista_de_inicio,
                                    :data_prevista_de_conclusao, :data_real_de_conclusao,
                                    :orgaos_setores_envolvidos, :analise_EGR)
  end

  def set_risco
    @risco = Risco.find(params[:risco_id])
  end

  def set_controle
    @controle = Controle.find(params[:id])
  end

  def set_dropboxes_values_form
    @novo_ou_modificado = ["Novo", "Modificado"]
    @tipo_do_controle = ["Preventivo", "Corretivo"]
    @natureza_do_controle = ["Manual", "Automatizado", "Híbrido"]
    @relacao_com_o_risco = ["Direto", "Indireto"]
  end
end
