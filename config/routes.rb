Rails.application.routes.draw do
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get to: 'page#show'
  
  namespace :api, defaults: { format: 'json' } do
  end

  root to: "page#index"
end
