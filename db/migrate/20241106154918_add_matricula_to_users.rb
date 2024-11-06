class AddMatriculaToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :matricula, :string
  end
end
