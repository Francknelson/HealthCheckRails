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

ActiveRecord::Schema[7.0].define(version: 2022_09_30_131739) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "zipcode", null: false
    t.string "street", null: false
    t.string "number", null: false
    t.string "complement"
    t.string "neighborhood", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "clinics", force: :cascade do |t|
    t.date "corporate_name", null: false
    t.boolean "cnpj", null: false
    t.string "health_insurance", null: false
    t.bigint "professional_id", null: false
    t.bigint "specialty_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doctors_appointments", force: :cascade do |t|
    t.date "appointment_date", null: false
    t.boolean "return", null: false
    t.string "status", null: false
    t.bigint "professional_id", null: false
    t.bigint "clinic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name", null: false
    t.string "last_name", null: false
    t.string "cpf", null: false
    t.string "rg"
    t.string "email", null: false
    t.string "phone"
    t.string "user", null: false
    t.string "password", null: false
    t.date "birth_date"
    t.bigint "address_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professionals", force: :cascade do |t|
    t.string "cnpj"
    t.string "professional_record", null: false
    t.bigint "person_id", null: false
    t.bigint "specialty_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specialties", force: :cascade do |t|
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "clinics", "professionals", name: "clinics_professional_id_fkey"
  add_foreign_key "clinics", "specialties", name: "clinics_specialty_id_fkey"
  add_foreign_key "doctors_appointments", "clinics", name: "doctors_appointments_clinic_id_fkey"
  add_foreign_key "doctors_appointments", "professionals", name: "doctors_appointments_professional_id_fkey"
  add_foreign_key "people", "addresses", name: "people_address_id_fkey"
  add_foreign_key "professionals", "people", name: "professionals_person_id_fkey"
  add_foreign_key "professionals", "specialties", name: "professionals_specialty_id_fkey"
end
