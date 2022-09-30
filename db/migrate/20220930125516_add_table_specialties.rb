class AddTableSpecialties < ActiveRecord::Migration[7.0]
  def change
    create_table :specialties do |t|
      t.string :description, null: false

      t.timestamps null: false
    end
  end
end
