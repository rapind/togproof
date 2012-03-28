Grokphoto::Application.routes.draw do

  root :to => "home#index"
  match 'timestamp' => 'home#timestamp' # used to keep passenger spooled up in prod

  resources :private_galleries, :only => :show
  resources :galleries, :only => :show
  resources :pages, :only => :show
  resources :contact_requests, :only => [:new, :create] do
    get :thanks, :on => :collection
  end

  devise_for :photographers

  match 'admin' => 'admin/events#index'
  namespace :admin do
    resource :events, :only => :index
    resource :photographer, :only => [:edit, :update]
    resources :pages
    resources :galleries do
      resources :photos
    end
    resources :private_galleries do
      get :invite, :on => :member
      put :send_invite, :on => :member
      resources :photos
    end
  end

end
