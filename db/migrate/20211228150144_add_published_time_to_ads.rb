class AddPublishedTimeToAds < ActiveRecord::Migration[7.0]
  def change
    add_column :ads, :published_at, :timestamp
  end
end
