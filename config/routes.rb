Rails.application.routes.draw do
  resources :posts
  resources :users do
    resources :posts, only: [:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#show'
end
