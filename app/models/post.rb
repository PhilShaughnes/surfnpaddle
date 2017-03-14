class Post < ApplicationRecord
  paginates_per 10
  belongs_to :user, counter_cache: true
  validates :title, :body, :photo, presence: true
   validates :title, length: {minimum: 11, :too_short => lambda{ |x, t| " post is #{11 - t[:value].length} too short. Must be more than 10 characters!"}}

  default_scope { order(created_at: :desc) }

  def self.except(post)
    where.not(id: post)
  end

end
