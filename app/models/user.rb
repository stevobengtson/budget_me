class User < ApplicationRecord
  attr_accessor :remember_token

  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }

  before_save { email.downcase! }

  def remember
    self.remember_token = Security.new_token
    update_attribute(:remember_digest, Security.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
