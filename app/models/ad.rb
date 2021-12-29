class Ad < ApplicationRecord
  has_many_attached :pictures
  belongs_to :user
  validates :user_id, presence: true
  default_scope -> { order(created_at: :desc) }
  validates :pictures, blob: { content_type: :image, size: { less_than: 100.megabytes , message: 'is not given between size' }}
  enum state: {draft: 0, onwatch: 1, published: 2, declined: 3, archived: 4}
end
