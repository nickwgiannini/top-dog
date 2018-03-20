Rails.application.routes.draw do
  root 'static_pages#index'
  resources :breeds, to: 'static_pages#index'

  devise_for :users
  resources :users
end

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :reviews
      resources :votes
      resources :users
      resources :breeds do
        resources :reviews do
        end
      end
    end
  end
end
