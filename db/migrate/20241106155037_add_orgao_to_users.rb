class AddOrgaoToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :orgao, :string
  end
end
