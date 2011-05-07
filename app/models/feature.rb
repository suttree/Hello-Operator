class Feature < ActiveRecord::Base
  belongs_to :tile
  belongs_to :image
end
