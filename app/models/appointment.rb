class Appointment < ApplicationRecord
  validates :appointment_date,
            :return,
            :status,
            :professional_id,
            :clinic_id,
            presence: true

  belongs_to :professional
  belongs_to :clinic
end
