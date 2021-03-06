Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "welcome/say_hello" => "welcome#say"
  get "welcome" => "welcome#index"
  root :to => "welcome#index"
  resources :posts do
    resources :comments
  end

  resources :urls 

  namespace :admin do
    resources :posts do
      post 'publish'
    end
  end

  namespace :api do
    resources :regions, :provinces, :districts, :municipalities, :barangays, only: :index, defaults: { format: :json }
    # resources :provinces, only: :index, defaults: { format: :json }
    # resources :districts, only: :index, defaults: { format: :json }
    # resources :municipalities, only: :index, defaults: { format: :json}
  end

end
