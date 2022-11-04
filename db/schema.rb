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

ActiveRecord::Schema[7.0].define(version: 2022_11_03_225139) do
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
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "appointments", force: :cascade do |t|
    t.date "appointment_date", null: false
    t.boolean "return", null: false
    t.string "status", null: false
    t.bigint "professional_id", null: false
    t.bigint "clinic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "client_id", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "cpf", null: false
    t.string "rg"
    t.date "birth_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clinic_specialties", force: :cascade do |t|
    t.bigint "clinic_id", null: false
    t.bigint "specialty_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clinics", force: :cascade do |t|
    t.string "corporate_name", null: false
    t.string "cnpj", null: false
    t.string "health_insurance"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professional_specialties", force: :cascade do |t|
    t.bigint "professional_id", null: false
    t.bigint "specialty_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professionals", force: :cascade do |t|
    t.string "cnpj"
    t.string "professional_record", null: false
    t.bigint "clinic_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specialties", force: :cascade do |t|
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "last_name"
    t.string "email", null: false
    t.string "password_hash", null: false
    t.string "password_salt", null: false
    t.string "phone"
    t.string "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "users", name: "addresses_person_id_fkey"
  add_foreign_key "appointments", "clients", name: "appointments_client_id_fkey"
  add_foreign_key "appointments", "clinics", name: "appointments_clinic_id_fkey"
  add_foreign_key "appointments", "professionals", name: "appointments_professional_id_fkey"
  add_foreign_key "clients", "users", name: "clients_user_id_fkey"
  add_foreign_key "clinic_specialties", "clinics", name: "clinic_specialties_clinic_id_fkey"
  add_foreign_key "clinic_specialties", "specialties", name: "clinic_specialties_specialty_id_fkey"
  add_foreign_key "clinics", "users", name: "clinics_user_id_fkey"
  add_foreign_key "professional_specialties", "professionals", name: "professional_specialties_professional_id_fkey"
  add_foreign_key "professional_specialties", "specialties", name: "professional_specialties_specialty_id_fkey"
  add_foreign_key "professionals", "clinics", name: "professionals_clinic_id_fkey"
  add_foreign_key "professionals", "users", name: "professionals_user_id_fkey"
end
