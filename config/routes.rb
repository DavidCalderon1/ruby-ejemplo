Rails.application.routes.draw do
  resources :questions, only: [:create, :show, :new] do
    resources :answers, only: [:create]
  end

  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get to: 'page#show'
  
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :questions, only: [:index]
    end
  end

  root to: "page#index"
end
