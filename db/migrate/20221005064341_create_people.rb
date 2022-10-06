class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.string :last_name, null: false
      t.string :cpf, null: false
      t.string :rg
      t.string :email, null: false
      t.string :phone
      t.string :user, null: false
      t.string :password_hash, null: false
      t.string :password_salt, null: false
      t.date :birth_date

      t.timestamps null: false
    end
  end
end