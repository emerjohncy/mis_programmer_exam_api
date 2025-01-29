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

ActiveRecord::Schema[7.2].define(version: 2025_01_15_050901) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "company_name"
    t.string "company_email"
    t.string "company_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_companies", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_employee_companies_on_company_id"
    t.index ["employee_id"], name: "index_employee_companies_on_employee_id"
  end

  create_table "employees", force: :cascade do |t|
    t.integer "employee_number"
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "position_id"
    t.index ["position_id"], name: "index_employees_on_position_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "position_title"
    t.decimal "salary", precision: 12, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "employee_companies", "companies"
  add_foreign_key "employee_companies", "employees"
  add_foreign_key "employees", "positions"
end
