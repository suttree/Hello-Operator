class FeaturesController < ApplicationController
  skip_before_filter :setup_launching_soon_page

  def new
    @map = Map.find(params[:map_id])
    @tile = @map.tiles.find(params[:tile_id])
    @feature = @tile.features.new
  end

  def create
    @map = Map.find(params[:map_id])
    @tile = @map.tiles.find(params[:tile_id])
    @feature = @tile.features.create(params[:feature])

    if @feature.save
      flash[:notice] = 'Feature created'
      #redirect_to "/maps/#{@map.id}?x=#{@tile.x}&y=#{@tile.y}"
      redirect_to "/maps/1"
    else
      flash[:notice] = 'Failed to create feature'
      render :action => :new, :layout => false
    end
  end

  def details
    @map = Map.find(params[:map_id])
    @tile = @map.tiles.find(params[:tile_id])
    @feature = @tile.features.find(params[:id])
  end

  def update
    @tile = Tile.find(params[:id])
    @feature = @tile.features.find(params[:feature_id])
    @feature.update_attributes(params[:feature])

    if @feature.save
    else
    end
  end

  def destroy
    @tile = Tile.find(params[:id])
    @feature = @tile.features.find(params[:tile_id])
    @feature.destroy
  end
end
