class TilesController < ApplicationController
  skip_before_filter :setup_launching_soon_page

  def new
    @map = Map.find(params[:map_id])
    @tile = @map.tiles.new
  end

  def create
    @map = Map.find(params[:map_id])
    @tile = @map.tiles.create(params[:tile])

    if @tile.save
      flash[:notice] = 'Tile created'
      #redirect_to "/maps/#{@map.id}?x=#{@tile.x}&y=#{@tile.y}"
      redirect_to "/maps/1"
    else
      flash[:notice] = 'Failed to create tile'
      render :action => :new, :layout => false
    end
  end

  def edit
    @map = Map.find(params[:map_id])
    @tile = @map.tiles.find(params[:id])
  end

  def update
    @map = Map.find(params[:map_id])
    @tile = @map.tiles.find(params[:id])
    @tile.update_attributes(params[:tile])
    if @tile.save
      #redirect_to "/maps/#{@map.id}?x=#{@tile.x}&y=#{@tile.y}"
      redirect_to "/maps/1"
    else
      flash[:notice] = 'Failed to update tile'
      render :action => :edit, :layout => false
    end
  end

  def destroy
    @map = Map.find(params[:map_id])
    @tile = @map.tiles.find(params[:id])
    @tile.destroy
  end
end
