class Tile < ActiveRecord::Base
  belongs_to :map
  belongs_to :image
  has_many :features, :dependent => :destroy

  validate :check_for_unique_x_and_y
  validates_presence_of :x, :y

  X_WINDOW_SIZE = 4
  Y_WINDOW_SIZE = 4

  def self.viewport_for(x=0, y=0)
    x = 0 if x.blank?
    y = 0 if y.blank?

    x = x.to_i
    y = y.to_i

    tiles = []
    max_x = x + X_WINDOW_SIZE
    max_y = y + Y_WINDOW_SIZE
    max_y.downto(y) do |y_ref|
      x.upto(max_x) do |x_ref|
        tiles << [x_ref, y_ref]        
      end
    end
    tiles
  end

  def next_up
    self.y + 1
  end

  def next_down
    (self.y <= 0 ? 0 : self.y - 1)
  end

  def next_left
    (self.x <= 0 ? 0 : self.x - 1)
  end

  def next_right
    self.x + 1
  end

  private
  def check_for_unique_x_and_y
    ! Tile.exists?(:x => self.x, :y => self.y)
  end
end
