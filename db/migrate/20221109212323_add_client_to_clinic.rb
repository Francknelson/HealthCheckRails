class AddClientToClinic < ActiveRecord::Migration[7.0]
  def up
    add_column :clients, :clinic_id, :integer, null: false
  end

  def down
    remove_column :clients, :clinic_id
  end
end
