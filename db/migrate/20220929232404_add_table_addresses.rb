class AddTableAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :zipcode, null: false
      t.string :street, null: false
      t.string :number, null: false
      t.string :complement
      t.string :neighborhood, null: false
      t.string :city, null: false
      t.string :state, null: false

      t.timestamps null: false
    end
  end
end
