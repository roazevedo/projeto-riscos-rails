class CreateRelatorios < ActiveRecord::Migration[7.2]
  def change
    create_table :relatorios do |t|
      t.timestamps
    end
  end
end
