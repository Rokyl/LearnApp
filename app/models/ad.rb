class Ad < ApplicationRecord
  mount_uploaders :pictures, PictureUploader
  belongs_to :user
  validates :user_id, presence: true
  default_scope -> { order(created_at: :desc) }
  enum state: {draft: 0, pending: 1, published: 2, declined: 3, archived: 4}
end
