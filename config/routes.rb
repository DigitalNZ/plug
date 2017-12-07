Plug::Engine.routes.draw do
  root to: 'features#index'

  resources :features
end
