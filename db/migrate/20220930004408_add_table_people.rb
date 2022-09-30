class AddTablePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.string :last_name, null: false
      t.string :cpf, null: false
      t.string :rg
      t.string :email, null: false
      t.string :phone
      t.string :user, null: false
      t.string :password, null: false
      t.date :birth_date
      t.bigint :address_id, null: false

      t.timestamps null: false
    end

    add_foreign_key :people,
                    :addresses,
                    column: :address_id,
                    name: "people_address_id_fkey"
  end
end
