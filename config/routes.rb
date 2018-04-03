Plug::Engine.routes.draw do
  root to: 'features#index'

  resources :features, except: :show
  resources :site_notices, except: :show

  post '/task', to: 'features#task_execution', as: :task_execution
end
