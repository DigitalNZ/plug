# frozen_string_literal: true

require_dependency 'plug/application_controller'

module Plug
  class SiteNoticesController < ApplicationController
    if Rails.version.to_i < 5
      before_filter :set_site_notice, only: %i[edit update destroy]
    else
      before_action :set_site_notice, only: %i[edit update destroy]
    end

    # GET /site_notices
    def index
      @site_notices = SiteNotice.all
    end

    # GET /site_notices/1
    # def show; end

    # GET /site_notices/new
    def new
      @site_notice = SiteNotice.new
    end

    # GET /site_notices/1/edit
    def edit; end

    # POST /site_notices
    def create
      @site_notice = SiteNotice.new(site_notice_params)

      if @site_notice.save
        redirect_to site_notices_path, notice: 'Site Notice was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /site_notices/1
    def update
      if @site_notice.update_attributes(site_notice_params)
        redirect_to site_notices_path, notice: 'Site Notice was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /site_notices/1
    def destroy
      @site_notice.destroy
      redirect_to site_notices_url, notice: 'Site Notice was successfully destroyed.'
    end

    private

      # Use callbacks to share common setup or constraints between actions.
      def set_site_notice
        @site_notice = SiteNotice.find(params[:id])
      end

    # Only allow a trusted parameter "white list" through.
    # TODO: Strong params not available for older Rails
    def site_notice_params
      if Rails.version.to_i < 5
        ActiveSupport::HashWithIndifferentAccess.new(params[:site_notice])
      else
        params.require(:site_notice).permit(:name, :notice, :state, :theme)
      end
    end
  end
end
