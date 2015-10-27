Alliesweb::Application.routes.draw do
  namespace :admin do
    root 'pages#index'
    
    resources :updates, except: [:show]
    resources :pages, except: [:index, :show]
    resources :users, except: [:show, :new, :create]
  end

  devise_for :users
  root 'welcome#index'
  post 'open' => 'room_statuses#open'
  post 'midnight' => 'room_statuses#set_midnight'
  post 'room_status' => 'room_statuses#pi'
  
  resources :updates, only: [:index, :show]
  resources :pages, only: [:show]
end
