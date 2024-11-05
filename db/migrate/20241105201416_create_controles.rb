class CreateControles < ActiveRecord::Migration[7.2]
  def change
    create_table :controles do |t|
      t.string :nome
      t.boolean :novo_ou_modificado
      t.string :tipo_do_controle
      t.string :natureza_do_controle
      t.string :relacao_com_o_risco
      t.string :responsavel_pela_acao
      t.date :data_prevista_de_inicio
      t.date :data_prevista_de_conclusao
      t.date :data_real_de_conclusao
      t.string :orgaos_setores_envolvidos
      t.text :analise_EGR
      t.references :risco, null: false, foreign_key: true

      t.timestamps
    end
  end
end
