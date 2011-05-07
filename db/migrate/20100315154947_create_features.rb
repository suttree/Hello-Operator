class CreateFeatures < ActiveRecord::Migration
  def self.up
    create_table :features do |t|
      t.integer :tile_id, :null => false
      t.string :description, :null => false
      t.string :image, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :features
  end
end
