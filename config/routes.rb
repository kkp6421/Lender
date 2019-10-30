Rails.application.routes.draw do
  devise_for :owners
  root to: 'home#index'
  get 'home/about'
  get 'home/help'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  match '*path', to: 'application#error404', via: :all
end
