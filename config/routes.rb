Rails.application.routes.draw do
  # resources :reviews
  # resources :toilets, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :toilets, only: [:show, :index]
    end
  end
end
