class Post < ApplicationRecord
  belongs_to :user, counter_cache: true
  validates :name, presence: true

end
