# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_24_012425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cidades", force: :cascade do |t|
    t.string "nome"
    t.bigint "estado_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estado_id"], name: "index_cidades_on_estado_id"
  end

  create_table "contas", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.integer "usuario_id"
  end

  create_table "enderecos", force: :cascade do |t|
    t.string "lote"
    t.string "bairro"
    t.string "logradouro"
    t.string "cep"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "usuario_id"
    t.string "complemento"
    t.integer "cidade_id"
  end

  create_table "estados", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sigla"
  end

  create_table "franquias", force: :cascade do |t|
    t.string "nome"
    t.bigint "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_franquias_on_usuario_id"
  end

  create_table "instalacoes", force: :cascade do |t|
    t.bigint "veiculo_id"
    t.bigint "oficina_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["oficina_id"], name: "index_instalacoes_on_oficina_id"
    t.index ["veiculo_id"], name: "index_instalacoes_on_veiculo_id"
  end

  create_table "oficinas", force: :cascade do |t|
    t.string "nome"
    t.bigint "usuario_id"
    t.bigint "endereco_id"
    t.bigint "franquia_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["endereco_id"], name: "index_oficinas_on_endereco_id"
    t.index ["franquia_id"], name: "index_oficinas_on_franquia_id"
    t.index ["usuario_id"], name: "index_oficinas_on_usuario_id"
  end

  create_table "useres", force: :cascade do |t|
    t.string "login"
    t.bigint "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["login"], name: "index_useres_on_login"
    t.index ["usuario_id"], name: "index_useres_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.string "rg"
    t.string "cpf_cnpj"
    t.string "email"
    t.integer "endereco_id"
    t.string "telefone"
    t.string "telefone_2"
    t.integer "cobranca"
    t.integer "tipo_usuario"
    t.boolean "associado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "indicacao"
    t.integer "franquia_id"
  end

  create_table "veiculos", force: :cascade do |t|
    t.string "placa"
    t.string "chassi"
    t.integer "renavan"
    t.string "ano"
    t.string "modelo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "usuario_id"
    t.integer "oficina_id"
    t.float "valor_instalacao"
    t.float "mensalidade"
  end

  add_foreign_key "cidades", "estados"
  add_foreign_key "contas", "usuarios"
  add_foreign_key "enderecos", "cidades"
  add_foreign_key "enderecos", "usuarios"
  add_foreign_key "franquias", "usuarios"
  add_foreign_key "instalacoes", "oficinas"
  add_foreign_key "instalacoes", "veiculos"
  add_foreign_key "oficinas", "enderecos"
  add_foreign_key "oficinas", "franquias"
  add_foreign_key "oficinas", "usuarios"
  add_foreign_key "useres", "usuarios"
  add_foreign_key "usuarios", "franquias"
  add_foreign_key "veiculos", "oficinas"
  add_foreign_key "veiculos", "usuarios"
end
