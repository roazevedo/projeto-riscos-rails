class CreateProcessos < ActiveRecord::Migration[7.2]
  def change
    create_table :processos do |t|
      t.string :nome
      t.string :orgao
      t.string :setor
      t.string :gestor_processo
      t.string :servidor_responsavel
      t.string :objetivo_estrategico
      t.string :embasamento_legal
      t.string :sistemas_utilizados
      t.string :partes_interessadas

      t.timestamps
    end
  end
end
