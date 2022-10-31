class Clinic < ApplicationRecord
  validates :corporate_name, presence: true
  validates :cnpj, presence: true

  belongs_to :user

  has_many :addresses, through: :user
  has_many :appointments, dependent: :restrict_with_error
  has_many :professionals, dependent: :restrict_with_error
  has_many :clinic_specialties, inverse_of: :clinic, dependent: :destroy
  has_many :specialties, through: :clinic_specialties

  def self.search(search)
    if search
      where('corporate_name LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
