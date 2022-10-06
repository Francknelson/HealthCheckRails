class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.date :appointment_date, null: false
      t.boolean :return, null: false
      t.string :status, null: false
      t.bigint :professional_id, null: false
      t.bigint :clinic_id, null: false

      t.timestamps null: false
    end

    add_foreign_key :appointments,
                    :professionals,
                    column: :professional_id,
                    name: "appointments_professional_id_fkey"

    add_foreign_key :appointments,
                    :clinics,
                    column: :clinic_id,
                    name: "appointments_clinic_id_fkey"
  end
end
