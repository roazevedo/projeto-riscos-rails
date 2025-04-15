class ChangeImpactoToBeStringInRiscos < ActiveRecord::Migration[7.2]
  def change
    change_column :riscos, :impacto, :string
  end
end
