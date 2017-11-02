require 'rails_helper'

module Plug
  RSpec.describe PlugsController, type: :controller do
    routes { Engine.routes }

    describe 'routing' do
      it 'routes /plugs to plug#plugs' do
        expect(post: '/plugs').to be_routable
      end
    end

    describe 'POST #create' do
      let(:valid_attr) { attributes_for(:plug) }

      it 'returns http success' do
        post :create, params: { plug: valid_attr }, format: :js
        expect(response).to have_http_status(:success)
      end

      it 'assigns plugs to @plugs' do
        post :create, params: { plug: valid_attr }, format: :js
        expect(assigns(:plugs)).to all(be_a(::Plug::Plug))
      end
    end
  end
end
