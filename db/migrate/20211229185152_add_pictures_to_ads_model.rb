class AddPicturesToAdsModel < ActiveRecord::Migration[7.0]
  def change
    add_column :ads, :pictures, :string, array: true
  end
end
