class AddClientToAppointment < ActiveRecord::Migration[7.0]
  def up
    add_column :appointments, :client_id, :bigint, null: false

    add_foreign_key :appointments,
                    :clients,
                    column: :client_id,
                    name: "appointments_client_id_fkey"
  end

  def down
    remove_column :appointments, :client_id
  end
end
