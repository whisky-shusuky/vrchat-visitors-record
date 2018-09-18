class CreateVisitors < ActiveRecord::Migration[5.2]
  def change
    create_table :visitors do |t|
      t.string :world_id
      t.string :world_name
      t.integer :occupants
      t.string :world_image_url

      t.timestamps
    end
  end
end
