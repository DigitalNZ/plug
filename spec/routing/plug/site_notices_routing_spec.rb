require 'rails_helper'

module Plug
  RSpec.describe SiteNoticesController, type: :routing do
    routes { Plug::Engine.routes }

    describe 'routing' do
      it 'routes to #index' do
        expect(get: '/site_notices').to route_to('plug/site_notices#index')
      end

      it 'does not route to #new' do
        expect(get: '/site_notices/new').to route_to('plug/site_notices#new')
      end

      it 'does not route to #show' do
        expect(get: '/site_notices/1').to_not be_routable
      end

      it 'does not route to #edit' do
        expect(get: '/site_notices/1/edit').to route_to('plug/site_notices#edit', id: '1')
      end

      it 'does not route to #create' do
        expect(post: '/site_notices').to route_to('plug/site_notices#create')
      end

      it 'does not route to #update via PUT' do
        expect(put: '/site_notices/1').to route_to('plug/site_notices#update', id: '1')
      end

      it 'does not route to #update via PATCH' do
        expect(patch: '/site_notices/1').to route_to('plug/site_notices#update', id: '1')
      end

      it 'does not route to #destroy' do
        expect(delete: '/site_notices/1').to route_to('plug/site_notices#destroy', id: '1')
      end
    end
  end
end
