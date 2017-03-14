class User < ApplicationRecord
  has_many :posts
  validates :name, :photo, presence: true
  validates :name, uniqueness: true
end
