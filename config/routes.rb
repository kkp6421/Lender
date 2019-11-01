Rails.application.routes.draw do
  devise_for :owners
  root to: 'home#index'
  get 'home/about'
  get 'home/help'
  post '/', to: 'home#index'
  get 'home/search_book'
  post 'home/search_book', to: 'home#search_book'
  get 'home/search_borrower'
  post 'home/search_borrower', to: 'home#search_borrower'
  resources :books
  get 'borrowers/lend/:id', to: 'borrowers#lend'
  post '/borrowers/lend/:id', to: 'borrowers#lend'
  resources :borrowers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #match '*path', to: 'application#error404', via: :all
end
