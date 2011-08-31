Grokphoto::Application.routes.draw do

  root :to => "portfolios#index"
  match 'timestamp' => 'home#timestamp' # used to keep passenger spooled up in prod
  resources :sitemap

  resources :galleries do
    resources :gallery_photos
  end
  resources :portfolios
  resources :pages

  devise_for :photographers

  match 'admin' => 'admin/galleries#index'
  namespace :admin do
    resource :photographer
    resources :portfolios do
      put :update_position, :on => :member
      resources :portfolio_photos do
        put :update_position, :on => :member
      end
    end
    resources :galleries do
      get :invite, :on => :member
      resources :gallery_photos
    end
    resources :pages do
      put :update_position, :on => :member
    end
  end

end
