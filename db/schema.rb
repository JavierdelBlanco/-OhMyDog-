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

ActiveRecord::Schema[7.1].define(version: 2023_11_27_140048) do
  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "cuidador_paseadors", force: :cascade do |t|
    t.binary "foto"
    t.string "apellido"
    t.string "nombre"
    t.string "email"
    t.integer "telefono"
    t.text "zona"
    t.text "dias_horarios"
    t.string "rol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "perritos", force: :cascade do |t|
    t.string "nombre"
    t.integer "dia"
    t.integer "mes"
    t.integer "año"
    t.text "caracteristicas"
    t.text "condiciones"
    t.string "raza"
    t.string "color"
    t.string "tamaño"
    t.boolean "fallecido"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_perritos_on_user_id"
  end

  create_table "perros_en_adopcions", force: :cascade do |t|
    t.string "nombre"
    t.binary "foto"
    t.date "fecha_de_publicacion"
    t.boolean "status"
    t.string "raza"
    t.string "sexo"
    t.integer "edad"
    t.string "tamano"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "descripcion"
    t.string "mail"
  end

  create_table "perros_encontrados", force: :cascade do |t|
    t.string "nombre"
    t.binary "foto"
    t.date "fecha_de_publicacion"
    t.string "status"
    t.string "mail"
    t.string "descripcion"
    t.string "nombre_dueno"
    t.string "apellido_dueno"
    t.string "direccion_dueno"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "numero_dueno"
    t.string "raza"
    t.integer "edad_aproximada"
    t.string "tamano"
    t.string "lugar_zona_donde_se_encontro"
  end

  create_table "perros_perdidos", force: :cascade do |t|
    t.string "nombre"
    t.binary "foto"
    t.date "fecha_de_publicacion"
    t.string "status"
    t.string "mail"
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "raza"
    t.integer "edad_aproximada"
    t.string "tamano"
    t.string "lugar_zona_donde_se_encontro"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nombre"
    t.string "apellido"
    t.string "direccion"
    t.integer "nro"
    t.string "tipo_usuario"
    t.integer "telefono"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vet_de_guardia", force: :cascade do |t|
    t.binary "foto"
    t.date "dia"
    t.integer "telefono"
    t.string "mail"
    t.string "direccion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "perritos", "users"
end
