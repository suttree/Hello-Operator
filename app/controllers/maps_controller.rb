class MapsController < ApplicationController
  skip_before_filter :setup_launching_soon_page
  layout 'operator'

  def index
  end

  def show
    @x, @y = gridref_from_params
    @map = Map.find(params[:id])
    @tile = @map.tiles.first(:conditions => {:x => @x, :y => @y})
  end

  private
  def gridref_from_params
    if params[:x].nil? || params[:x].blank? || params[:x].empty?
      x = 0
    else
      x = params[:x]
    end

    if params[:y].nil? || params[:y].blank? || params[:y].empty?
      y = 0
    else
      y = params[:y]
    end
    return x, y
  end
end
