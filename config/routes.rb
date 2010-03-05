ActionController::Routing::Routes.draw do |map|
  # root
  map.root :controller => 'home'
  map.config_error '/config_error', :controller => 'home', :action => 'config_error'
  map.not_found '/not_found', :controller => 'home', :action => 'not_found'
  
  # sitemap
  map.resources :sitemap
  
  # galleries
  map.resources :galleries, :member => { :slide => :get }, :has_many => :gallery_photos
  
  # pages
  map.resources :pages
  
  # client area
  map.client_error '/client/error', :controller => 'client/home'
  map.client '/client', :controller => 'client/bookings'
  map.namespace :client do |client|
    # client login / logout / password reset
    client.resource :client_session
    client.login '/login', :controller => "client_sessions", :action => "new"
    client.logout '/logout', :controller => "client_sessions", :action => "destroy"
    client.resources :client_password_resets
    client.resources :bookings, :has_many => [:photos, :photo_comments]
    client.resources :photos, :has_many => :photo_comments
  end
  
  # administration area
  map.admin '/admin', :controller => 'admin/galleries'
  map.namespace :admin do |admin|
    # session / login / logout
    admin.resource :photographer_session
    admin.login '/login', :controller => "photographer_sessions", :action => "new"
    admin.logout '/logout', :controller => "photographer_sessions", :action => "destroy"
    admin.resource :photographer
    admin.resources :photographer_password_resets
    admin.resources :clients, :member => { :invite => :get, :send_invite => :post } do |client|
      client.resources :bookings, :member => { :update_position => :put }
    end
    admin.resources :bookings do |booking|
      booking.resources :photos, :member => { :ajax_row => :get }, :collection => { :flash_upload => :post }
      booking.resources :photo_comments
    end
    admin.resources :photo, :has_many => :photo_comments
    admin.resources :galleries, :member => { :update_position => :put } do |gallery|
      gallery.resources :gallery_photos, :member => { :update_position => :put }, :collection => { :flash_upload => :post }
    end
    admin.resources :pages, :member => { :update_position => :put }
    admin.resources :quotes, :member => { :update_position => :put }
    admin.resources :packages, :member => { :update_position => :put }
    admin.resources :products, :member => { :update_position => :put } do |product|
      product.resources :product_sizes, :member => { :update_position => :put }
    end
  end
  
end
