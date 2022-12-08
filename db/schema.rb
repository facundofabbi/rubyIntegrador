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

ActiveRecord::Schema[7.0].define(version: 2022_12_08_043743) do
  create_table "comentarios", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "turno_id", null: false
    t.bigint "personal_id"
    t.string "texto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["personal_id"], name: "index_comentarios_on_personal_id"
    t.index ["turno_id"], name: "index_comentarios_on_turno_id"
  end

  create_table "horarios", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "dia", null: false
    t.time "hora_inicio"
    t.time "hora_fin"
    t.integer "sucursal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sucursals", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nombre", null: false
    t.string "direccion", null: false
    t.integer "telefono", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nombre"], name: "index_sucursals_on_nombre", unique: true
  end

  create_table "turnos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "sucursal_id", null: false
    t.bigint "cliente_id", null: false
    t.bigint "personal_id"
    t.date "fecha"
    t.time "hora"
    t.string "motivo"
    t.string "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_turnos_on_cliente_id"
    t.index ["personal_id"], name: "index_turnos_on_personal_id"
    t.index ["sucursal_id"], name: "index_turnos_on_sucursal_id"
  end

  create_table "usuarios", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nombre", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "email", default: "", null: false
    t.string "role", default: "Cliente", null: false
    t.bigint "sucursal_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["nombre"], name: "index_usuarios_on_nombre", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
    t.index ["sucursal_id"], name: "index_usuarios_on_sucursal_id"
  end

  add_foreign_key "comentarios", "turnos"
  add_foreign_key "comentarios", "usuarios", column: "personal_id"
  add_foreign_key "turnos", "sucursals"
  add_foreign_key "turnos", "usuarios", column: "cliente_id"
  add_foreign_key "turnos", "usuarios", column: "personal_id"
end
