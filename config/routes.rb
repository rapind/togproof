Grokphoto::Application.routes.draw do

  resources :gallery_photos

  resources :portfolio_photos

  resources :galleries

  resources :portfolios

  root :to => "home#index"
  match 'timestamp' => 'home#timestamp' # used to keep passenger spooled up in prod
  resources :sitemap

  resources :galleries do
    resources :gallery_photos
  end
  resources :portfolios do
    resources :portfolio_photos
  end
  resources :pages

  devise_for :photographers

  match 'photog' => 'photog/galleries#index'
  namespace :photog do
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
