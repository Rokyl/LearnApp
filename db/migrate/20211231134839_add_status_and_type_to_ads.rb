class AddStatusAndTypeToAds < ActiveRecord::Migration[7.0]
  def change
    add_column :ads, :status, :integer
    add_column :ads, :type, :string
  end
end
