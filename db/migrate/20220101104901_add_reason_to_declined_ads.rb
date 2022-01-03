class AddReasonToDeclinedAds < ActiveRecord::Migration[7.0]
  def change
    add_column :ads, :reason, :string, default: ''
  end
end
