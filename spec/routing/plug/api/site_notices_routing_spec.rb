require 'rails_helper'

module Plug
  module Api
    RSpec.describe SiteNoticesController, type: :routing do
      routes { Plug::Engine.routes }

      describe 'routing' do
        it 'routes to #index' do
          expect(get: '/api/site_notices').to route_to('plug/api/site_notices#index', format: :json)
        end

        it 'routes to #show' do
          expect(get: '/api/site_notices/my-slug').to route_to('plug/api/site_notices#show', slug: 'my-slug', format: :json)
        end
        
        it 'does not route to #new' do
          expect(get: '/api/site_notices/new').to_not route_to('plug/api/site_notices#new', format: :json)
        end

        it 'does not route to #edit' do
          expect(get: '/api/site_notices/1/edit').to_not be_routable
        end

        it 'does not route to #create' do
          expect(post: '/api/site_notices').to_not be_routable
        end

        it 'does not route to #update via PUT' do
          expect(put: '/api/site_notices/1').to_not be_routable
        end

        it 'does not route to #update via PATCH' do
          expect(patch: '/api/site_notices/1').to_not be_routable
        end

        it 'does not route to #destroy' do
          expect(delete: '/api/site_notices/1').to_not be_routable
        end
      end
    end
  end
end
