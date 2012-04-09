class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  skip_before_filter :setup_launching_soon_page
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    @user.save do |result|
      if result
        # Connect twitter/facebook details
        session[:oauth_request_class] = nil # stop authlogic_oauth from registering with twitter a 2nd time
        @user.twitter_connect
        flash[:notice] = "Account registered!"
      else
        unless @user.oauth_token.nil? || @user.oauth_token.blank?
          @user = User.find_by_oauth_token(@user.oauth_token)
          unless @user.nil?
            UserSession.create(@user)
            flash[:notice] = "Welcome back!"
          end
        end
      end
      #@user.twitter_connect
      #@user.save
logger.info @user.inspect
logger.info '----2'
      @user.connection.update("UPDATE users set last_request_at = '#{Time.now.utc.to_s(:db)}' WHERE id = #{@user.id}")
      redirect_to '/'
    end
  end
    
  def show
    @user = @current_user
  end
 
  def edit
    @user = @current_user
  end
  
  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to '/'
    else
      render :action => :edit
    end
  end
end
