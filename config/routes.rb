Rails.application.routes.draw do
  resources :questions, only: [:create, :show, :new] do
    resources :answers, only: [:create]
  end

  get 'tags', to: 'page#index', as: :tag, constraints: { tag: %r{/[^\/]+/ }}

  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get to: 'page#show'

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :users, only: [:index, :show]
      resources :questions, only: [:index]

      devise_scope :user do
        match '/sessions' => 'sessions#create', via: :post
        match '/sessions' => 'sessions#destroy', via: :delete
      end
    end
  end

  root to: "page#index"
end
