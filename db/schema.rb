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

ActiveRecord::Schema.define(version: 20161213044819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.integer  "producto_id"
    t.string   "archivo_file_name"
    t.string   "archivo_content_type"
    t.integer  "archivo_file_size"
    t.datetime "archivo_updated_at"
    t.string   "descripcion"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["producto_id"], name: "index_attachments_on_producto_id", using: :btree
  end

  create_table "empresas", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "municipio"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "nit"
    t.string   "pagina_web"
    t.string   "email"
    t.string   "twitter"
    t.string   "tipo_empresa"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "in_shopping_carts", force: :cascade do |t|
    t.integer  "producto_id"
    t.integer  "shopping_cart_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.index ["producto_id"], name: "index_in_shopping_carts_on_producto_id", using: :btree
    t.index ["shopping_cart_id"], name: "index_in_shopping_carts_on_shopping_cart_id", using: :btree
  end

  create_table "link_attachments", force: :cascade do |t|
    t.integer  "link_id"
    t.datetime "expiration_date"
    t.integer  "attachment_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["attachment_id"], name: "index_link_attachments_on_attachment_id", using: :btree
    t.index ["link_id"], name: "index_link_attachments_on_link_id", using: :btree
  end

  create_table "links", force: :cascade do |t|
    t.integer  "producto_id"
    t.datetime "expiration_date"
    t.integer  "downloads"
    t.integer  "downloads_limit"
    t.string   "custom_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
    t.index ["producto_id"], name: "index_links_on_producto_id", using: :btree
  end

  create_table "my_payments", force: :cascade do |t|
    t.string   "email"
    t.string   "ip"
    t.string   "estado"
    t.decimal  "fee",              precision: 6, scale: 2
    t.string   "paypal_id"
    t.decimal  "total",            precision: 8, scale: 2
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "shopping_cart_id"
    t.index ["shopping_cart_id"], name: "index_my_payments_on_shopping_cart_id", using: :btree
  end

  create_table "productos", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "precio"
    t.text     "descripcion"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "imagen_file_name"
    t.string   "imagen_content_type"
    t.integer  "imagen_file_size"
    t.datetime "imagen_updated_at"
    t.string   "imagen2_file_name"
    t.string   "imagen2_content_type"
    t.integer  "imagen2_file_size"
    t.datetime "imagen2_updated_at"
    t.string   "imagen3_file_name"
    t.string   "imagen3_content_type"
    t.integer  "imagen3_file_size"
    t.datetime "imagen3_updated_at"
    t.string   "imagen4_file_name"
    t.string   "imagen4_content_type"
    t.integer  "imagen4_file_size"
    t.datetime "imagen4_updated_at"
    t.index ["user_id"], name: "index_productos_on_user_id", using: :btree
  end

  create_table "registrosemails", force: :cascade do |t|
    t.string   "email"
    t.string   "ip"
    t.integer  "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.string   "estado"
    t.string   "ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "attachments", "productos"
  add_foreign_key "in_shopping_carts", "productos"
  add_foreign_key "in_shopping_carts", "shopping_carts"
  add_foreign_key "link_attachments", "attachments"
  add_foreign_key "link_attachments", "links"
  add_foreign_key "links", "productos"
  add_foreign_key "productos", "users"
end
