Alliesweb::Application.routes.draw do
  root 'articles#home'
  get 'articles' => 'articles#index'
end
