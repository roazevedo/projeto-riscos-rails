class CreateRiscos < ActiveRecord::Migration[7.2]
  def change
    create_table :riscos do |t|
      t.string :nome
      t.date :data_identificacao
      t.string :tipo_de_risco
      t.string :associacao_risco
      t.text :causas
      t.text :consequencias
      t.string :dimensoes_risco
      t.integer :probabilidade
      t.text :justificativa_pr
      t.integer :impacto
      t.text :justificativa_imp
      t.integer :risco_inerente
      t.boolean :existe_procedimento_de_controle
      t.text :descricao_do_controle_existente
      t.boolean :controle_eficaz
      t.boolean :controle_proporcional
      t.boolean :controle_razoavel
      t.boolean :controle_adequado
      t.integer :fator_de_avaliacao_controles
      t.integer :risco_residual
      t.string :resposta_sugerida_para_risco
      t.date :data_maxima_para_implantacao_dos_controles_propostos
      t.boolean :relacao_com_LGPD
      t.references :processo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
