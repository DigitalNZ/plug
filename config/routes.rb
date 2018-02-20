Plug::Engine.routes.draw do
  root to: 'features#index'

  post '/task', action: :task_execution, controller: :features, as: :task_execution
  resources :features, except: :show
end
