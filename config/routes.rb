Rails.application.routes.draw do
  resources :posts
  resources :users do
    resources :posts, only: [:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#show'

  get "/login" => 'sessions#new', as: :login
  post "/login" => 'sessions#create'
  delete "/logout" => 'sessions#destroy', as: :logout

  get "/share/:id" => 'share#new', as: :share
  post "/share/:id" => 'share#create'
end
