class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :first_name, length: { minimum: 3, maximum: 30 }
  validates :last_name, length: { minimum: 3, maximum: 30 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "email invalid", uniqueness: { case_sensitive: false } }
  validates :password, length: { in: 6..20 }
end