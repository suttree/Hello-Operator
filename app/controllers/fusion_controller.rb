class FusionController < ApplicationController
  skip_before_filter :setup_launching_soon_page
  layout 'operator'

  def next
    render :partial => "page_#{params[:page]}"
  end

  def parallax
  end
end
