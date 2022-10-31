class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :last_name
      t.string :email, null: false
      t.string :password_hash, null: false
      t.string :password_salt, null: false
      t.string :phone

      t.boolean :admin, default: false
      t.boolean :client, default: false
      t.boolean :professional, default: false
      t.boolean :clinic, default: false

      t.timestamps null: false
    end
  end
end
