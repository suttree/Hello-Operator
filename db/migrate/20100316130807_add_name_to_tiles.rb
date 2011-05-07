class AddNameToTiles < ActiveRecord::Migration
  def self.up
    add_column :tiles, :name, :string, :null => false
    Tile.all.each do |tile|
      tile.name = '-'
      tile.save
    end
  end

  def self.down
    remove_column :tiles, :name
  end
end
