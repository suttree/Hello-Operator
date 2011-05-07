class InitialMap < ActiveRecord::Migration
  def self.up
    Map.create(:name => "F.U.S.I.O.N")
  end

  def self.down
    Map.find_by_name("F.U.S.I.O.N").destroy
  end
end
