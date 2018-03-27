Plug::Engine.routes.draw do
  root to: 'features#index'

  post '/task', to: 'features#task_execution', as: :task_execution
  resources :features, except: :show
  resources :site_notice
end
