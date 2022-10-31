class ProfessionalSpecialty < ApplicationRecord
  belongs_to :professional, inverse_of: :professional_specialties, optional: false
  belongs_to :specialty, inverse_of: :professional_specialties, optional: false
end
