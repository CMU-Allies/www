Rails.application.routes.draw do
  namespace :admin do
    root 'pages#index'

    resources :updates, except: [:show]
    resources :pages, except: [:index, :show]
    resources :users, except: [:show, :new, :create]
    resources :commissions, except: [:show]
    resources :exec_boards, except: [:show]
  end

  devise_for :users
  root 'welcome#index'
  post 'open' => 'room_statuses#open'
  post 'midnight' => 'room_statuses#set_midnight'
  post 'room_status' => 'room_statuses#pi'

  resources :updates, only: [:index, :show]
  resources :pages, only: [:show]
  resources :commissions, only: [:index]
  resources :exec_boards, only: [:index]
end
