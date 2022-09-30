class AddTableProfessionals < ActiveRecord::Migration[7.0]
  def change
    create_table :professionals do |t|
      t.string :cnpj
      t.string :professional_record, null: false
      t.bigint :person_id, null: false
      t.bigint :specialty_id, null: false

      t.timestamps null: false
    end

    add_foreign_key :professionals,
                    :people,
                    column: :person_id,
                    name: "professionals_person_id_fkey"

    add_foreign_key :professionals,
                    :specialties,
                    column: :specialty_id,
                    name: "professionals_specialty_id_fkey"
  end
end
