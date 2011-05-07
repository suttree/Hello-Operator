class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  skip_before_filter :setup_launching_soon_page

  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    @user_session.save do |result|
      if result
        flash[:notice] = "Login successful"
        redirect_back_or_default root_url
      else
        render :action => :new
      end
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful"
    redirect_to '/'
  end
end