class Post < ApplicationRecord
  mount_uploader :thumbnail, ThumbnailUploader
  belongs_to :user
  def created
    created_at.strftime('%d %b %Y')
  end
end
