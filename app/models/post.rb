class Post < ApplicationRecord
  paginates_per 10
  mount_uploader :img, PostImgUploader

  belongs_to :user, counter_cache: true

  validate :img_present
  validates :title, :body, presence: true
   validates :title, length: {minimum: 11, :too_short => lambda{ |x, t| " post is #{11 - t[:value].length} too short. Must be more than 10 characters!"}}

  default_scope { order(created_at: :desc) }

  def self.except(post)
    where.not(id: post)
  end

  def is_owner?(other_user)
    user == other_user
  end

  def pic(version = :standard)
    case
    when img? then img.versions[version].url
    when !photo.blank? then photo
    else "http://vignette3.wikia.nocookie.net/strangeanimals/images/3/34/Gh.jpg"
    end
  end

  def img_present
    unless img? || !photo.blank?
      errors.add(:img, "must exist if photo doesn't")
      errors.add(:photo, "must exist if img doesn't")
    end
  end

end
