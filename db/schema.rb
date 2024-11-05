# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_11_05_211224) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "controles", force: :cascade do |t|
    t.string "nome"
    t.boolean "novo_ou_modificado"
    t.string "tipo_do_controle"
    t.string "natureza_do_controle"
    t.string "relacao_com_o_risco"
    t.string "responsavel_pela_acao"
    t.date "data_prevista_de_inicio"
    t.date "data_prevista_de_conclusao"
    t.date "data_real_de_conclusao"
    t.string "orgaos_setores_envolvidos"
    t.text "analise_EGR"
    t.bigint "risco_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["risco_id"], name: "index_controles_on_risco_id"
  end

  create_table "processos", force: :cascade do |t|
    t.string "nome"
    t.string "orgao"
    t.string "setor"
    t.string "gestor_processo"
    t.string "servidor_responsavel"
    t.string "objetivo_estrategico"
    t.string "embasamento_legal"
    t.string "sistemas_utilizados"
    t.string "partes_interessadas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "riscos", force: :cascade do |t|
    t.string "nome"
    t.date "data_identificacao"
    t.string "tipo_de_risco"
    t.string "associacao_risco"
    t.text "causas"
    t.text "consequencias"
    t.string "dimensoes_risco"
    t.integer "probabilidade"
    t.text "justificativa_pr"
    t.integer "impacto"
    t.text "justificativa_imp"
    t.integer "risco_inerente"
    t.boolean "existe_procedimento_de_controle"
    t.text "descricao_do_controle_existente"
    t.boolean "controle_eficaz"
    t.boolean "controle_proporcional"
    t.boolean "controle_razoavel"
    t.boolean "controle_adequado"
    t.integer "fator_de_avaliacao_controles"
    t.integer "risco_residual"
    t.string "resposta_sugerida_para_risco"
    t.date "data_maxima_para_implantacao_dos_controles_propostos"
    t.boolean "relacao_com_LGPD"
    t.bigint "processo_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["processo_id"], name: "index_riscos_on_processo_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "controles", "riscos"
  add_foreign_key "riscos", "processos"
end
