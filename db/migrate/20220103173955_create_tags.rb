class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :tag
      t.timestamps
    end
    remove_column :ads, :type
    add_reference :ads, :tags, foreign_key: true
  end
end
