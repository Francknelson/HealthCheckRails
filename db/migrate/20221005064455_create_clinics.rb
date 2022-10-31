class CreateClinics < ActiveRecord::Migration[7.0]
  def change
    create_table :clinics do |t|
      t.string :corporate_name, null: false
      t.string :cnpj, null: false
      t.string :health_insurance
      t.bigint :user_id, null: false

      t.timestamps null: false
    end

    add_foreign_key :clinics,
                    :users,
                    column: :user_id,
                    name: "clinics_user_id_fkey"

  end
end
