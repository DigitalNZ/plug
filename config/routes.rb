Plug::Engine.routes.draw do
  root to: 'features#index'

  # Features  
  resources :features, except: :show

  # Site notices  
  resources :site_notices, except: :show
  
  namespace :api, defaults: { format: :json } do
    get '/site_notices/:slug', to: 'site_notices#show'
    get '/site_notices', to: 'site_notices#index'
  end
  
  post '/task', to: 'features#task_execution', as: :task_execution
end
