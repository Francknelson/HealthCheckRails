class Clinic < ApplicationRecord
  validates :corporate_name, presence: true
  validates :cnpj, presence: true
  validates :address, presence: true
  validates :specialty, presence: true

  has_many :addresses, dependent: :destroy
  has_many :specialties, dependent: :destroy
end
