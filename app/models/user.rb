class User < ActiveRecord::Base
  acts_as_authentic

  has_many :messages_as_sender, :foreign_key=> "recipient_id", :class_name => "Message", :order => 'created_at DESC'
  has_many :messages_as_recipient, :foreign_key=> "user_id", :class_name => "Message", :order  => "created_at DESC"

  def name
    (self.twitter_name? ? self.twitter_name : self.facebook_name)
  end

  def online?
    self.last_request_at > 5.minutes.ago
  end

  # Store this in the db on sign-in/sign-up?
  def twitter_profile_image
    #@profile_image ||= begin
    #  require 'open-uri'
    #  require 'json'
    #  buffer = open("http://twitter.com/users/show/#{self.login}.json").read
    #  result = JSON.parse(buffer)
    #  result['profile_image_url']
    #rescue
    #  '/images/ui/panel.png'
    #end
    "http://twitteravatar.appspot.com/users/avatar/#{self.login}"
  end

  # Move this to a twitter module
  def twitter_connect
    access_token = OAuth::AccessToken.new(UserSession.oauth_consumer, self.oauth_token, self.oauth_secret)
    user_info = JSON.parse(access_token.get("https://twitter.com/account/verify_credentials.json").body)

    self.login = user_info['screen_name']
    self.twitter_name = user_info['name']
    self.password = "5uttr33_#{self.login}"
    self.signup_source = 'twitter'
    self.save
  end
  
  # Move this to a facebook module
  def before_connect(facebook_session)
    self.login = facebook_session.user.name
    self.facebook_name = facebook_session.user.name
    self.password = "5uttr33_#{self.login}"
    self.signup_source = 'facebook'
    self.save
  end
end
