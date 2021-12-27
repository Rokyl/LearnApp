class AddIndexToAds < ActiveRecord::Migration[7.0]
  def change
    add_index :ads, [:user_id, :created_at]
  end
end
