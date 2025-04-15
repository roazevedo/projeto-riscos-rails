class ChangeRiscoInerenteToBeStringInRiscos < ActiveRecord::Migration[7.2]
  def change
    change_column :riscos, :risco_inerente, :string
  end
end
