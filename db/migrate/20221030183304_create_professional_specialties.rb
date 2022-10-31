class CreateProfessionalSpecialties < ActiveRecord::Migration[7.0]
  def change
    create_table :professional_specialties do |t|
      t.bigint :professional_id, null: false
      t.bigint :specialty_id, null: false

      t.timestamps null: false
    end

    add_foreign_key :professional_specialties,
                    :professionals,
                    column: :professional_id,
                    name: "professional_specialties_professional_id_fkey"

    add_foreign_key :professional_specialties,
                    :specialties,
                    column: :specialty_id,
                    name: "professional_specialties_specialty_id_fkey"
  end
end
