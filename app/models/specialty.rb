class Specialty < ApplicationRecord
  validates :description, presence: true, uniqueness: { case_sensitive: false }

  has_many :clinic_specialties, inverse_of: :specialty, dependent: :destroy
  has_many :clinics, through: :clinic_specialties

  has_many :professional_specialties, inverse_of: :specialty, dependent: :destroy
  has_many :professionals, through: :professional_specialties

  def self.search(search)
    if search
      where('description ILIKE :term', term: "%#{search}%")
    else
      all
    end
  end
end
