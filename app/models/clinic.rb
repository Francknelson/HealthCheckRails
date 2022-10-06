class Clinic < ApplicationRecord
  validates :corporate_name, presence: true
  validates :cnpj, presence: true
  validates :specialty_id, presence: true

  belongs_to :specialty

  has_many :clinic_addresses, dependent: :destroy
  has_many :appointments, dependent: :restrict_with_error
  has_many :professionals, dependent: :restrict_with_error
end
