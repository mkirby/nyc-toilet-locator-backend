Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :toilets, only: [:show, :index, :create] 
      resources :reviews, only: [:show, :index, :create]
    end
  end
end
