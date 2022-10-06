class Person < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  attr_accessor :password
  validates_confirmation_of :password

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  validates :password,
            :password_confirmation,
            presence: true, length: { minimum: 6 }

  validates :user,
            :cpf,
            presence: true, uniqueness: { case_sensitive: false }

  validates :name,
            :last_name,
            presence: true

  before_save { self.email = email.downcase }
  before_save :encrypt_password

  has_many :professional, dependent: :destroy

  has_many :person_addresses, dependent: :destroy

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
  end

  def self.authenticate(email, password)
    user = Person.find_by(email: email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
