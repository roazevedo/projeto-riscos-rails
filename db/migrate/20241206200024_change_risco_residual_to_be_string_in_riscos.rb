class ChangeRiscoResidualToBeStringInRiscos < ActiveRecord::Migration[7.2]
  def change
    change_column :riscos, :risco_residual, :string
  end
end
