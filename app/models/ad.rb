class Ad < ApplicationRecord
  has_many_attached :pictures
  belongs_to :user
  validates :user_id, presence: true
  default_scope -> { order(created_at: :desc) }
  validates :pictures, blob: { content_type: :image, size: { less_than: 100.megabytes , message: 'is not given between size' }}
end
