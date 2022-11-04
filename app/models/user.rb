class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  attr_accessor :password
  validates_confirmation_of :password

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  validates :password,
            :password_confirmation,
            presence: true, length: { minimum: 6 }

  validates :name,
            presence: true

  before_save { self.email = email.downcase }
  before_save :encrypt_password

  has_one :clinic, dependent: :restrict_with_error
  has_one :professional, dependent: :restrict_with_error
  has_one :client, dependent: :restrict_with_error

  has_many :addresses, dependent: :destroy
  has_many :specialties, dependent: :destroy

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def self.search(search)
    if search
      where('name ILIKE ? OR email ILIKE ? OR user_type ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end
