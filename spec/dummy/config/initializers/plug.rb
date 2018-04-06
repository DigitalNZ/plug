# /config/initializers/plug.rb

Plug.configure do |config|
  # config.auth_user = 'admin'
  # config.auth_password = 'password'
  config.allow_delete = true
  config.api_path = 'http://localhost:3000/plug/api'
end
