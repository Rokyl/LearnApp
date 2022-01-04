class Ad < ApplicationRecord
  mount_uploaders :pictures, PictureUploader
  belongs_to :user
  belongs_to :tag, optional: true
  validates :user_id, presence: true
  default_scope -> { order(created_at: :desc) }
  enum status: [:draft, :pending, :published, :declined, :archived], _default: :draft, _prefix: :ad

  def make_ad_archived
    Ad.all.each do |ad|
      if ad.status == "published"
        ad.status = "archived" if DateTime.now - ad.published_at >= 0
      end
    end
  end
end
