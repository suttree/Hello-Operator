class HomeTileForFirstMap < ActiveRecord::Migration
  def self.up
    @map = Map.find_by_name("F.U.S.I.O.N")
    @map.tiles.create(:x => 0, :y => 0, :image => 'test')
  end

  def self.down
    @map = Map.find_by_name("F.U.S.I.O.N")
    @tile = @map.tiles.find_by_x_and_y(0, 0)
    @tile.destroy unless @tile.nil?
  end
end
