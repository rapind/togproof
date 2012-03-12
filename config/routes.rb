Grokphoto::Application.routes.draw do

  root :to => "home#index"
  match 'timestamp' => 'home#timestamp' # used to keep passenger spooled up in prod

  resources :galleries

  devise_for :photographers

  match 'admin' => 'admin/galleries#index'
  namespace :admin do
    resource :photographer
    resources :galleries do
      get :invite, :on => :member
      put :send_invite, :on => :member
      resources :photos
    end
  end

end
