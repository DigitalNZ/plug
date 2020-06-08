module Plug
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    content_security_policy false

    if Plug.auth_user.present? && Plug.auth_password.present?
      http_basic_authenticate_with name: Plug.auth_user, password: Plug.auth_password
    end
  end
end
