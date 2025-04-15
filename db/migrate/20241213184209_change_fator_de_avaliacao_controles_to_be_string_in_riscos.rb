class ChangeFatorDeAvaliacaoControlesToBeStringInRiscos < ActiveRecord::Migration[7.2]
  def change
    change_column :riscos, :fator_de_avaliacao_controles, :string
  end
end
