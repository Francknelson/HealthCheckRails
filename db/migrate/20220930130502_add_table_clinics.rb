class AddTableClinics < ActiveRecord::Migration[7.0]
  def change
    create_table :clinics do |t|
      t.date :corporate_name, null: false
      t.boolean :cnpj, null: false
      t.string :health_insurance, null: false
      t.bigint :professional_id, null: false
      t.bigint :specialty_id, null: false

      t.timestamps null: false
    end

    add_foreign_key :clinics,
                    :professionals,
                    column: :professional_id,
                    name: "clinics_professional_id_fkey"

    add_foreign_key :clinics,
                    :specialties,
                    column: :specialty_id,
                    name: "clinics_specialty_id_fkey"
  end
end
