class AiController < ApplicationController
  before_filter :authenticate, :only => [:admin, :reply]
  skip_before_filter :setup_launching_soon_page
  layout 'operator'

  def index
    redirect_to '/' unless logged_in?
  end

  def widget
    render :layout => 'widget'
  end

  def ask
    if params[:message_id].empty?
      msg = current_user.messages_as_sender.create(:body => params[:q], :recipient => AI_USER)
    else
      parent = Message.find(params[:message_id])
      msg = current_user.messages_as_sender.create(:body => params[:q], :recipient => AI_USER, :parent => parent)
    end

    session[:last_id] = msg.id
    render :update do |page|
      page[:q].value = ''
      page[:q].focus
      page.insert_html :top, 'chat', "<i>&raquo; #{params[:q]}</i><br/>"
    end
  end

  def poll_for_responses
    @messages = current_user.messages_as_recipient.find(:all, :include => :sender, :conditions => ["id > ?", session[:last_id]])
    if @messages.any?
      render :update do |page|
        @messages.each do |msg|
          page[:message_id].value = msg.id
          page.insert_html :top, 'chat', "<b>#{msg.body}</b><br/>"
          page.replace_html 'audioPlayer', :partial => "audio_player", :locals => {:msg => msg}
        end
      end
      session[:last_id] = @messages.first.id
    else
      if !ai_online?
        render :update do |page|
          page.replace_html 'ai_status', :partial => 'shared/ai_status'
          page.replace_html 'ai_input', :partial => 'q_offline'
          page.replace_html 'ai_conditional', :partial => 'periodic_conditional', :locals => {:check_var => false}
        end
      else
        render :nothing => true
      end
    end
  end
  
  def poll_for_questions
    @messages = AI_USER.messages_as_recipient.find(:all, :include => :sender, :conditions => ["id > ?", session[:last_admin_id]])
    if @messages.any?
      render :update do |page|
        @messages.each do |msg|
          page.insert_html :top, 'msgs', :partial => "sound_effect"
          page.insert_html :top, 'msgs', :partial => "admin_msg", :locals => {:msg => msg}
          page.visual_effect :highlight, "msg_#{msg.id}", :duration => 2
        end
      end
      session[:last_admin_id] = @messages.first.id
    else
      render :nothing => true
    end
  end

  def admin
    @messages = AI_USER.messages_as_recipient.paginate(:per_page => 20, :page => params[:page], :include => [:parent, :sender])
    session[:last_admin_id] = @messages.first.id
  end

  def reply
    message = Message.find(params[:id])
    AI_USER.messages_as_sender.create(:body => params["q_#{message.id}"], :recipient => message.sender, :parent => message)
    render :update do |page|
      #page.replace_html "reply_to_#{message.id}", "<small><i>&raquo; #{message.reply.body}</i></small>"
      page.replace_html "msg_#{message.id}", :partial => "admin_msg", :locals => {:msg => message}
    end
  end

  protected
  def authenticate
    if logged_out?
      flash[:notice] = 'Login required'
      redirect_to '/'
    else
      authenticate_or_request_with_http_basic('Time flies like a banana?') do |username, password|
        username == 'fusion' && password == '3n3my0fcha0s'
      end
    end
  end
end
