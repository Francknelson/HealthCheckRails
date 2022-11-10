class Professional < ApplicationRecord
  validates :professional_record,
            :user_id,
            :clinic_id,
            :specialty_ids,
            presence: true

  belongs_to :user
  belongs_to :clinic

  has_many :addresses, through: :user
  has_many :appointments
  has_many :professional_specialties, inverse_of: :professional, dependent: :destroy
  has_many :specialties, through: :professional_specialties

  def self.search(search)
    if search
      left_outer_joins(:user, :addresses, :specialties).where('users.name ILIKE :term OR users.email ILIKE :term OR cnpj ILIKE :term OR addresses.city ILIKE :term OR specialties.description ILIKE :term', term: "%#{search}%")
    else
      all
    end
  end
end
