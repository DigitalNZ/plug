require_dependency 'plug/application_controller'

module Plug
  class PlugsController < ApplicationController
    def create
      @plug = ::Plug::Plug.new(plug_params)
      @plug.save
      @plugs = ::Plug::Plug.all
    end

    private

      def plug_params
        params.require(:plug).permit(:name, :description)
      end
  end
end
