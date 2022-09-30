class DoctorsAppointment < ApplicationRecord
  validates :appointment_date,
            :return,
            presence: true

  has_one :person, dependent: :destroy
  has_one :clinic, dependent: :destroy
end
