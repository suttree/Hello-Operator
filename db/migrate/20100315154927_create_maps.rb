class CreateMaps < ActiveRecord::Migration
  def self.up
    create_table :maps do |t|
      t.string :name, :null => false
      t.string :description
      t.timestamps
    end
  end

  def self.down
    drop_table :maps
  end
end
