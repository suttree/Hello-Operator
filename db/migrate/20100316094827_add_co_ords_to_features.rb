class AddCoOrdsToFeatures < ActiveRecord::Migration
  def self.up
    add_column :features, :x, :integer, :null => false
    add_column :features, :y, :integer, :null => false
  end

  def self.down
    remove_column :features, :x
    remove_column :features, :y
  end
end
