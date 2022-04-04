class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: {maximum: 30}
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, length: {maximum:255}
  validates :password, presence: true, length: {minimum: 6}
end
