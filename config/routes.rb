Rails.application.routes.draw do
  root 'static_pages#index'
  resources :breeds, to: 'static_pages#index'
  devise_for :users

end
