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

ActiveRecord::Schema[7.2].define(version: 2025_05_08_174148) do
  create_table "csv_uploads", force: :cascade do |t|
    t.string "file_path"
    t.string "state"
    t.string "status"
    t.text "error_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "csv_uploads_deputies", force: :cascade do |t|
    t.integer "csv_upload_id", null: false
    t.integer "deputy_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["csv_upload_id"], name: "index_csv_uploads_deputies_on_csv_upload_id"
    t.index ["deputy_id"], name: "index_csv_uploads_deputies_on_deputy_id"
  end

  create_table "deputies", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.integer "external_id"
    t.string "party"
    t.string "state"
    t.integer "legislature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.integer "deputy_id", null: false
    t.string "document_number"
    t.date "issue_date"
    t.string "supplier"
    t.string "cnpj_cpf"
    t.integer "subquota_number"
    t.string "subquota_description"
    t.string "subquota_specification"
    t.decimal "value"
    t.decimal "value_glosa"
    t.decimal "value_net"
    t.string "document_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deputy_id"], name: "index_expenses_on_deputy_id"
  end

  add_foreign_key "csv_uploads_deputies", "csv_uploads"
  add_foreign_key "csv_uploads_deputies", "deputies"
  add_foreign_key "expenses", "deputies"
end
