Alliesweb::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users
  root 'articles#home'
  get 'articles' => 'articles#index'
  post 'open' => 'room_statuses#open'
  post 'close' => 'room_statuses#close'
  get 'about' => 'static#about'
  get 'calendar' => 'static#calendar'
  get 'resources' => 'resources#index'
  get 'news' => 'news#index'
end
