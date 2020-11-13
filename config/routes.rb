Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :toilets, only: [:show, :index, :create, :update]
      resources :reviews, only: [:show, :index, :create, :destroy]
      get 'near_user', action: :toilets_near_user, controller: 'toilets'
    end
  end
end
