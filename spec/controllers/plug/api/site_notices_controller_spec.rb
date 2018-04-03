require 'rails_helper'

module Plug
  module Api
    RSpec.describe SiteNoticesController, type: :controller do
      routes { Plug::Engine.routes }

      # This should return the minimal set of attributes required to create a valid
      # site_notice. As you add validations to Site Notice, be sure to
      # adjust the attributes here as well.
      let(:valid_attributes) { attributes_for(:site_notice) }
      let(:invalid_attributes) { attributes_for(:site_notice, :invalid) }
      let(:site_notice) { create(:site_notice) }

      describe 'GET #index' do
        it 'returns a success response' do
          get :index, params: {}
          expect(response).to be_success
        end
      end

      describe 'GET #show' do
        it 'returns a success response' do
          get :show, params: { slug: site_notice.slug }
          expect(response).to be_success
        end
      end
    end
  end
end
