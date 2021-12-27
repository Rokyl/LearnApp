class AddStateToAds < ActiveRecord::Migration[7.0]
  def change
    add_column :ads, :state, :string
    add_column :ads, :type, :string
  end
end
