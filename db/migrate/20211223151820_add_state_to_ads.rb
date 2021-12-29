class AddStateToAds < ActiveRecord::Migration[7.0]
  def change
    add_column :ads, :state, :integer, default: 0, null: false
    add_column :ads, :type, :string
  end
end
