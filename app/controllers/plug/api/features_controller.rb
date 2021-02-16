require_dependency 'plug/application_controller'

module Plug
  module Api
    class FeaturesController < ApiController
      # GET /features.json
      def index
        @features = Feature.all

        render json: @features
      end

      # GET /features/slug.json
      def show
        @feature = Feature.slug_and_name(params[:slug]).first

        render json: @feature
      end
    end
  end
end
