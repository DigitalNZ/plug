require_dependency 'plug/application_controller'

module Plug
  class SiteNoticeController < ApplicationController
    if Rails.version.to_i < 5
      before_filter only: [:index]
    else
      before_action only: [:index]
    end

    # GET /site_notice
    # GET /site_notice.json
    def index
      @site_notice = Plug::Feature.slug_and_name('site-notice').first

      respond_to do |format|
        format.html
        format.json { render json: @site_notice.to_json }
      end
    end
  end
end
