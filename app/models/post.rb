class Post < ApplicationRecord
  belongs_to :user, counter_cache: true
  validates :title, :body, presence: true

  default_scope { order(created_at: :desc) }

  def self.except(post)
    where.not(id: post)
  end

end
