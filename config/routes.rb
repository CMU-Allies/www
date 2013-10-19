Alliesweb::Application.routes.draw do
  get "static/about"
  get "static/calendar"
  get "room_status/create"
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users
  root 'articles#home'
  get 'articles' => 'articles#index'
  post 'status' => 'room_statuses#create'
  get 'about' => 'static#about'
  get 'calendar' => 'static#calendar'
  get 'resources' => 'resources#index'
end
