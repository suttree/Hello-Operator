class MapsVersionTwo < ActiveRecord::Migration
  def self.up
    remove_column :features, :image
    add_column :features, :image_id, :integer, :null => false

    remove_column :tiles, :image
    add_column :tiles, :image_id, :integer, :null => false

  end

  def self.down
    remove_column :features, :image_id
    add_column :features, :image, :string, :null => false

    remove_column :tiles, :image_id
    add_column :tiles, :image, :string, :null => false
  end
end
