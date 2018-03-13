Rails.application.routes.draw do
  resources :breeds, to: 'static_pages#index'
  devise_for :users

end
