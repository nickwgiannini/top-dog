Rails.application.routes.draw do
  root 'static_pages#index'
  resources :breeds, to: 'static_pages#index'

  devise_for :users
end

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :breeds
    end
  end
end
