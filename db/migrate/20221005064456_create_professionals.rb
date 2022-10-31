class CreateProfessionals < ActiveRecord::Migration[7.0]
  def change
    create_table :professionals do |t|
      t.string :cnpj
      t.string :professional_record, null: false
      t.bigint :clinic_id, null: false
      t.bigint :user_id, null: false

      t.timestamps null: false
    end

    add_foreign_key :professionals,
                    :clinics,
                    column: :clinic_id,
                    name: "professionals_clinic_id_fkey"

    add_foreign_key :professionals,
                    :users,
                    column: :user_id,
                    name: "professionals_user_id_fkey"

  end
end
