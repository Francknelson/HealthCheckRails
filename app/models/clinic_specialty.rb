class ClinicSpecialty < ApplicationRecord
  belongs_to :clinic, inverse_of: :clinic_specialties, optional: false
  belongs_to :specialty, inverse_of: :clinic_specialties, optional: false
end
