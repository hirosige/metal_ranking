class User < ActiveRecord::Base
  before_save {self.email = email.downcase}

  # attr_accessible :email, :name, :password, :password__confirmation


  validates :name, presence: true,
            length: {maximum: 50}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, presence: true,
            length: {minimum: 6}

  validates :password_confirmation, presence: true,
            length: {minimum: 6}
end
