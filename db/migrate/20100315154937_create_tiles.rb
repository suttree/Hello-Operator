class CreateTiles < ActiveRecord::Migration
  def self.up
    create_table :tiles do |t|
      t.integer :map_id
      t.integer :x, :null => false
      t.integer :y, :null => false
      t.string :image, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :tiles
  end
end
