class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :zipcode, null: false
      t.string :street, null: false
      t.string :number, null: false
      t.string :complement
      t.string :neighborhood, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.bigint :user_id

      t.timestamps null: false
    end
    add_foreign_key :addresses,
                    :users,
                    column: :user_id,
                    name: "addresses_person_id_fkey"

  end
end
