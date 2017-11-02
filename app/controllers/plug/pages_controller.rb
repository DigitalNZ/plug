require_dependency 'plug/application_controller'

module Plug
  class PagesController < ApplicationController
    def home
      @plugs = ::Plug::Plug.all
    end
  end
end
