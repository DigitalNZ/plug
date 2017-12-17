module Plug
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    unless Rails.env.test?
      http_basic_authenticate_with name: Plug.auth_user, password: Plug.auth_password
    end
  end
end
