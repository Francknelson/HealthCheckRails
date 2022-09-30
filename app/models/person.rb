class Person < ApplicationRecord
  validates :name,
            :last_name,
            :cpf,
            :email,
            :user,
            :password,
            presence: true

  has_many :addresses, dependent: :destroy
end
