class Professional < ApplicationRecord
  validates :professional_record,
            :person_id,
            :specialty_id,
            :clinic_id,
            presence: true

  belongs_to :person
  belongs_to :specialty
  belongs_to :clinic

  has_many :appointments

end
