class Clinic < ApplicationRecord
  validates :corporate_name, presence: true
  validates :cnpj, presence: true

  belongs_to :user

  has_many :addresses, through: :user
  has_many :appointments, dependent: :restrict_with_error
  has_many :professionals, dependent: :restrict_with_error
  has_many :clinic_specialties, inverse_of: :clinic, dependent: :destroy
  has_many :specialties, through: :clinic_specialties
  has_many :clients, dependent: :restrict_with_error

  def self.search(search)
    if search
      left_outer_joins(:user, :addresses, :specialties).where('corporate_name ILIKE :term OR cnpj ILIKE :term OR health_insurance ILIKE :term OR users.name ILIKE :term OR addresses.city ILIKE :term OR specialties.description ILIKE :term', term: "%#{search}%")
    else
      all
    end
  end
end
