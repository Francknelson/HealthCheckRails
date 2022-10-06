class Specialty < ApplicationRecord
  validates :description, presence: true, uniqueness: { case_sensitive: false }

  has_many :professional, dependent: :restrict_with_error
  has_many :clinic, dependent: :restrict_with_error
end
