class LaunchingSoonController < ApplicationController
  skip_before_filter :setup_launching_soon_page

  def show
    render :action => :operator
  end
end
