# frozen_string_literal: true

require_dependency 'plug/application_controller'

module Plug
  module Api
    class SiteNoticesController < ApiController
      # GET /site_notices.json
      def index
        @site_notices = SiteNotice.all

        render json: @site_notices
      end

      # GET /site_notices/slug.json
      def show
        @site_notice = SiteNotice.slug_and_name(params[:slug]).first

        render json: @site_notice
      end
    end
  end
end
