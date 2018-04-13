Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :auth, only: %i[create]
      resources :users, only: [:create] do
        resources :contracts, only: [:create, :show, :destroy]
      end
    end
  end
end
