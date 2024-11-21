class Controle < ApplicationRecord
  belongs_to :risco

  validates :nome, presence: true
end
