Alliesweb::Application.routes.draw do
  get "room_status/create"
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users
  root 'articles#home'
  get 'articles' => 'articles#index'
  post 'status' => 'room_statuses#create'
end
