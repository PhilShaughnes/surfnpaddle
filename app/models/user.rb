class User < ApplicationRecord
  has_many :posts
  validates :title, :body, presence: true
end
