class SpotlightController < ApplicationController
  skip_before_filter :setup_launching_soon_page
  layout 'spotlight'

  def index
  end
end
