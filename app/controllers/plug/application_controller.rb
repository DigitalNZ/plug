# frozen_string_literal: true

module Plug
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    content_security_policy false

    http_basic_authenticate_with name: Plug.auth_user, password: Plug.auth_password if Plug.auth_user.present? && Plug.auth_password.present?
  end
end
