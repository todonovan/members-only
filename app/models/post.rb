class Post < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true
  validates :user_id, presence: true

  default_scope -> { order(created_at: :desc) }
  belongs_to :user
end
