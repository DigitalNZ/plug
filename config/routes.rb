Plug::Engine.routes.draw do
  root to: 'pages#home'

  resources :plugs, only: :create
end
