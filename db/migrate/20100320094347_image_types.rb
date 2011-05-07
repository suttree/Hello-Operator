class ImageTypes < ActiveRecord::Migration
  def self.up
    add_column :images, :category, :string
  end

  def self.down
    remove_column :images, :category
  end
end
