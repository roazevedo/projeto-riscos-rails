class Controle < ApplicationRecord
  belongs_to :risco
  has_one :processo, through: :risco

  validates :nome, presence: true

  def formatar_novo_ou_modificado
    @controles = Controle.all
    if @controles.novo_ou_modificado == true
      'Novo'
    else
      'Modificado'
    end
  end
end
