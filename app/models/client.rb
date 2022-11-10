class Client < ApplicationRecord
  validates :cpf,
            :user_id,
            :clinic_id,
            presence: true

  belongs_to :user
  belongs_to :clinic

  has_many :addresses, through: :user
  has_many :appointments, dependent: :restrict_with_error

  def self.search(search)
    if search
      joins(:user).where('users.name ILIKE ? OR users.email ILIKE ? OR cpf ILIKE ? OR rg ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end
