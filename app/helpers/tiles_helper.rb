module TilesHelper
  def link_up(tile)
    x, y = x_and_y(tile)
    "/maps/#{@map.id}?x=#{x}&y=#{next_y(y)}"
  end

  def link_left(tile)
    x, y = x_and_y(tile)
    "/maps/#{@map.id}?x=#{previous_x(x)}&y=#{y}"
  end

  def link_right(tile)
    x, y = x_and_y(tile)
    "/maps/#{@map.id}?x=#{next_x(x)}&y=#{y}"
  end

  def link_down(tile)
    x, y = x_and_y(tile)
    "/maps/#{@map.id}?x=#{x}&y=#{previous_y(y)}"
  end

  private
  def x_and_y(tile)
    if tile.nil?
      x = params[:x].to_i
      y = params[:y].to_i
    else
      x = tile.x
      y = tile.y
    end
    return x, y
  end

  def next_y(y)
    y + 1
  end

  def previous_y(y)
    y <= 0 ? 0 : y - 1
  end

  def next_x(x)
    x + 1
  end

  def previous_x(x)
    x <= 0 ? 0 : x - 1
  end
end
