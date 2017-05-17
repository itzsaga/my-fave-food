class CreatePlaceItems < ActiveRecord::Migration[5.0]
  def change
    create_table :place_items do |t|
      t.integer :place_id
      t.integer :item_id

      t.timestamps
    end
  end
end
