Lauranovara::Application.routes.draw do

  # root
  match '/' => 'home#index'
  match '/config_error' => 'home#config_error', :as => :config_error
  match '/not_found' => 'home#not_found', :as => :not_found
  match '/timestamp' => 'home#timestamp', :as => :timestamp

  # sitemap
  resources :sitemap

  # galleries
  resources :galleries do
    member do
      get :slide
    end
  end

  # pages
  resources :pages

  # client area
  match '/client/error' => 'client/home#index', :as => :client_error
  match '/client' => 'client/bookings#index', :as => :client
  namespace :client do
    # client login / logout / password reset
      resource :client_session
      match '/login' => 'client_sessions#new', :as => :login
      match '/logout' => 'client_sessions#destroy', :as => :logout
      resources :client_password_resets
      resources :bookings
      resources :photos
  end

  # administration area
  match '/admin' => 'admin/galleries#index', :as => :admin
  namespace :admin do
    # session / login / logout
      resource :photographer_session
      match '/login' => 'photographer_sessions#new', :as => :login
      match '/logout' => 'photographer_sessions#destroy', :as => :logout
      resource :photographer
      resources :photographer_password_resets
      # old Rails2
      # admin.resources :clients, :member => { :invite => :get, :send_invite => :post } do |client|
      #   client.resources :bookings, :member => { :update_position => :put }
      # end
      resources :clients do
        member do
          get :invite
          post :send_invite
        end
        resources :bookings do
            member do
              put :update_position
            end
          end
      end
      # admin.resources :bookings do |booking|
      #   booking.resources :photos, :member => { :ajax_row => :get }, :collection => { :flash_upload => :post }
      #   booking.resources :photo_comments
      #  end
      resources :bookings do
        resources :photos do
          member do
            get :ajax_row
          end
          collection do
            post :flash_upload
          end
        end
        resources :photo_comments
      end

      resources :photo

      resources :galleries do
        resources :gallery_photos do
          collection do
            post :flash_upload
          end
          member do
            put :update_position
          end
        end
      end

      resources :pages do
    
        member do
    put :update_position
    end
    
    end
      resources :quotes do
    
        member do
    put :update_position
    end
    
    end
      resources :packages do
    
        member do
    put :update_position
    end
    
    end
      resources :products do
    
    
          resources :product_sizes do
      
            member do
      put :update_position
      end
      
      end
    end
  end

end


