require 'rails_helper'

module Plug
  RSpec.describe SiteNoticesController, type: :routing do
    routes { Plug::Engine.routes }

    describe 'routing' do
      it 'routes to #index' do
        expect(get: '/site_notices').to route_to('plug/site_notices#index')
      end

      it 'does not route to #show' do
        expect(get: '/site_notices/my-slug').to_not be_routable
      end

      it 'routes to #new' do
        expect(get: '/site_notices/new').to route_to('plug/site_notices#new')
      end

      it 'routes to #edit' do
        expect(get: '/site_notices/1/edit').to route_to('plug/site_notices#edit', id: '1')
      end

      it 'routes to #create' do
        expect(post: '/site_notices').to route_to('plug/site_notices#create')
      end

      it 'routes to #update via PUT' do
        expect(put: '/site_notices/1').to route_to('plug/site_notices#update', id: '1')
      end

      it 'routes to #update via PATCH' do
        expect(patch: '/site_notices/1').to route_to('plug/site_notices#update', id: '1')
      end

      it 'routes to #destroy' do
        expect(delete: '/site_notices/1').to route_to('plug/site_notices#destroy', id: '1')
      end
    end
  end
end
