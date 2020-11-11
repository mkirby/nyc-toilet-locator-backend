Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :toilets, only: [:show, :index] 
      resources :reviews, only: [:show, :index, :create]
      get 'info', action: :info, controller: 'toilets'
    end
  end
end
