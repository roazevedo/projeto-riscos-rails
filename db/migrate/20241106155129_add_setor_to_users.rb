class AddSetorToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :setor, :string
  end
end
