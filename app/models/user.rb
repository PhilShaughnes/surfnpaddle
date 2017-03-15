class User < ApplicationRecord
  has_many :posts
  has_secure_password

  validates :name, :photo, :email, presence: true
  validates :name, uniqueness: true
end
