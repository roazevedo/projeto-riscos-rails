class Risco < ApplicationRecord
  belongs_to :processo
  has_many :controles, dependent: :destroy

  validates :nome, presence: true

  def valor_existe_procedimento_controle()
    self.existe_procedimento_de_controle ? "Sim" : "Não"
  end

  def valor_controle_eficaz()
    self.controle_eficaz ? "Sim" : "Não"
  end

  def valor_controle_proporcional()
    self.controle_proporcional ? "Sim" : "Não"
  end

  def valor_controle_proporcional()
    self.controle_proporcional ? "Sim" : "Não"
  end

  def valor_controle_razoavel()
    self.controle_razoavel ? "Sim" : "Não"
  end

  def valor_controle_adequado()
    self.controle_adequado ? "Sim" : "Não"
  end

  def valor_relacao_com_LGPD
    self.relacao_com_LGPD ? "Sim" : "Não"
  end

  # def formatar_data_identificacao
  #   self.data_identificacao.strftime("%d/%m/%Y")
  # end

  # def formatar_data_maxima_para_implantacao_dos_controles_propostos
  #   self.data_maxima_para_implantacao_dos_controles_propostos.strftime("%d/%m/%Y")
  # end
end
