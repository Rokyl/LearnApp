class AddTitleToAds < ActiveRecord::Migration[7.0]
  def change
    add_column :ads, :title, :string
  end
end
