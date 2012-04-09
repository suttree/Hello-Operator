class TilesAndFeatures < ActiveRecord::Migration
  def self.up
    remove_column :tiles, :name
    add_column :features, :name, :string
  end

  def self.down
    add_column :tiles, :name, :string
    remove_column :features, :name
  end
end
