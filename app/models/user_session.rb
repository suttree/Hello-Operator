class UserSession < Authlogic::Session::Base
  def self.oauth_consumer
    #OAuth::Consumer.new('GdD5vEz0en58Yu31mlfZjA', 'bH3VxO75lOmKtsH9YFBtWfsBnTwiRr3aArlTv0M41I',
    OAuth::Consumer.new('ZAiK3OVrNufvYbq13OBvw', '0crRMzF3KVdvceADiXqyv6BT13Gbp66kazzJSFMSU',
    { :site => "http://twitter.com",
      :authorize_url => "http://twitter.com/oauth/authenticate" })
  end
end
