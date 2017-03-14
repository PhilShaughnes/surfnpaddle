class User < ApplicationRecord
  has_many :posts
  has_secure_password

  validates :name, :photo, presence: true
  validates :name, uniqueness: true
end
