require 'rails_helper'

module Plug
  module Api
    RSpec.describe FeaturesController, type: :controller do
      routes { Plug::Engine.routes }

      # This should return the minimal set of attributes required to create a valid
      # feature. As you add validations to Site Notice, be sure to
      # adjust the attributes here as well.
      let(:valid_attributes) { attributes_for(:feature) }
      let(:invalid_attributes) { attributes_for(:feature, :invalid) }
      let!(:feature) { create(:feature) }

      describe 'GET #index' do
        before { get :index, params: {} }

        it 'returns a success response' do
          expect(response).to be_successful
        end

        it 'returns response json format' do
          expect(response.header['Content-Type']).to include 'application/json'
        end
      end

      describe 'GET #show' do
        before { get :show, params: { slug: feature.slug } }

        it 'returns a success response' do
          expect(response).to be_successful
        end

        it 'returns response json format' do
          expect(response.header['Content-Type']).to include 'application/json'
        end
      end
    end
  end
end
