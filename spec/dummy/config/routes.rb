Rails.application.routes.draw do
  mount Plug::Engine => "/plug"
end
