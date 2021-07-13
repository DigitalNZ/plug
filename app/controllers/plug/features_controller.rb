# frozen_string_literal: true

require_dependency 'plug/application_controller'

module Plug
  class FeaturesController < ApplicationController
    if Rails.version.to_i < 5
      before_filter :set_feature, only: %i[edit update destroy]
    else
      before_action :set_feature, only: %i[edit update destroy]
    end

    # GET /features
    def index
      @features = Feature.all
    end

    # GET /features/1
    # def show; end

    # GET /features/new
    def new
      @feature = Feature.new
    end

    # GET /features/1/edit
    def edit; end

    # POST /features
    def create
      @feature = Feature.new(feature_params)

      if @feature.save
        redirect_to features_path, notice: 'Feature was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /features/1
    def update
      if @feature.update_attributes(feature_params)
        redirect_to features_path, notice: 'Feature was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /features/1
    def destroy
      @feature.destroy
      redirect_to features_url, notice: 'Feature was successfully destroyed.'
    end

    # POST /task
    # TODO: Move this to a separate controller e.g. `tasks_controller.rb`
    def task_execution
      begin
        Plug::TaskExecutionService.new(name: params[:task]).call
      rescue StandardError => e
        flash[:alert] = e.message
      else
        flash[:notice] = "Task: #{params[:task]} has completed"
      end

      redirect_to root_path
    end

    private

      # Use callbacks to share common setup or constraints between actions.
      def set_feature
        @feature = Feature.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      # TODO: Strong params not available for older Rails
      def feature_params
        if Rails.version.to_i < 5
          ActiveSupport::HashWithIndifferentAccess.new(params[:feature])
        else
          params.require(:feature).permit(:name, :description, :state, :notice)
        end
      end
  end
end
