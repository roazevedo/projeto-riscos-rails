class Processo < ApplicationRecord
  has_many :riscos, dependent: :destroy
  has_many :controles, through: :riscos

  validates :nome, :orgao, :setor, presence: true
end
