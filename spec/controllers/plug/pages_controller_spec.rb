require 'rails_helper'

module Plug
  RSpec.describe PagesController, type: :controller do
    routes { Plug::Engine.routes }

    describe 'routing' do
      it 'routes / to pages#home' do
        expect(get: '/').to route_to('plug/pages#home')
      end
    end

    describe 'GET #home' do
      it 'returns http success' do
        get :home
        expect(response).to have_http_status(:success)
      end
    end
  end
end
