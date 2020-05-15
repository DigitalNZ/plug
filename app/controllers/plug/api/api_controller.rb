# frozen_string_literal: true

module Plug
  module Api
    class ApiController < ActionController::Base
      protect_from_forgery with: :exception
    end
  end
end
