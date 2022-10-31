class CreateClinicSpecialties < ActiveRecord::Migration[7.0]
  def change
    create_table :clinic_specialties do |t|
      t.bigint :clinic_id, null: false
      t.bigint :specialty_id, null: false

      t.timestamps null: false
    end

    add_foreign_key :clinic_specialties,
                    :clinics,
                    column: :clinic_id,
                    name: "clinic_specialties_clinic_id_fkey"

    add_foreign_key :clinic_specialties,
                    :specialties,
                    column: :specialty_id,
                    name: "clinic_specialties_specialty_id_fkey"
  end
end
