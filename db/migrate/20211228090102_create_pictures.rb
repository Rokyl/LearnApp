class CreatePictures < ActiveRecord::Migration[7.0]
  def change
    create_table :pictures do |t|
      t.integer :order_id
      t.string :picture

      t.timestamps
    end
  end
end
