Alliesweb::Application.routes.draw do
  devise_for :users
  root 'articles#home'
  get 'articles' => 'articles#index'
end
