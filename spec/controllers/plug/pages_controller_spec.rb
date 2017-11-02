require 'rails_helper'

RSpec.describe Plug::PagesController, type: :controller do
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

    it 'assigns plugs to @plugs' do
      get :home
      expect(assigns(:plugs)).to all(be_a(::Plug::Plug))
    end
  end
end
