Www::Application.routes.draw do
  resources :galleries
  get '/books/search' => 'books#search', :as => 'search_books'
  resources :books
  resources :images
  resources :news_feeds
  resources :users
  get 'users/:id/:action' => 'users'
  resource :session
  get '/signup' => 'users#new', :as => 'signup'
  get '/login' => 'sessions#new', :as => 'login'
  get '/logout' => 'sessions#destroy', :as => 'logout'
  resources :articles
  resources :resources
  resources :room_statuses
  get '/open' => 'room_statuses#open', :as => 'open'
  get '/close' => 'room_statuses#close', :as => 'close'
  get '/:action' => 'static'
  root to: 'static#index'
end
