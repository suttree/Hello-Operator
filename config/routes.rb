ActionController::Routing::Routes.draw do |map|
  map.resources :news_letter_subscribers, :only => [:create]
  map.resources :launching_soon
  map.resources :ai, :collection => {:widget => :get, :ask => :post, :poll_for_questions => :post, :poll_for_responses => :post, :admin => :get, :reply => :post}
  map.resources :users
  map.resource :user_session
  map.resource :account, :controller => "users"
  map.connect '/fusion', :controller => 'fusion', :action => 'index'
  map.connect '/fusion/next', :controller => 'fusion', :action => 'next'
  map.connect '/fusion/parallax', :controller => 'fusion', :action => 'parallax'
  #map.connect '/map', :controller => 'map', :action => 'index' do |the_map|
  map.resources :maps do |the_map|
    the_map.resources :tiles do |tile|
      tile.resources :features, :member => {:details => :get}
    end
  end

  map.connect '/spotlight', :controller => 'spotlight', :action => 'index'

  map.root :launching_soon
end
