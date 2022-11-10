class Appointment < ApplicationRecord
  validates :appointment_date,
            :return,
            :status,
            :professional_id,
            :clinic_id,
            presence: true

  belongs_to :professional
  belongs_to :clinic
  belongs_to :client

  def self.search(search)
    if search
      where('status ILIKE :term ', term: "%#{search}%")
    else
      all
    end
  end
end
