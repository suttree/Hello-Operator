class Map < ActiveRecord::Base
  has_many :tiles, :dependent => :destroy
end
