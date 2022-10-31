class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :cpf, null: false
      t.string :rg
      t.date :birth_date
      t.bigint :user_id, null: false

      t.timestamps null: false
    end

    add_foreign_key :clients,
                    :users,
                    column: :user_id,
                    name: "clients_user_id_fkey"
  end
end
