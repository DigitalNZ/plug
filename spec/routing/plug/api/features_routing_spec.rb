require 'rails_helper'

module Plug
  module Api
    RSpec.describe FeaturesController, type: :routing do
      routes { Plug::Engine.routes }

      describe 'routing' do
        it 'routes to #index' do
          expect(get: '/api/features').to route_to('plug/api/features#index', format: :json)
        end

        it 'routes to #show' do
          expect(get: '/api/features/my-slug').to route_to('plug/api/features#show', slug: 'my-slug', format: :json)
        end

        it 'does not route to #new' do
          expect(get: '/api/features/new').to_not route_to('plug/api/features#new', format: :json)
        end

        it 'does not route to #edit' do
          expect(get: '/api/features/1/edit').to_not be_routable
        end

        it 'does not route to #create' do
          expect(post: '/api/features').to_not be_routable
        end

        it 'does not route to #update via PUT' do
          expect(put: '/api/features/1').to_not be_routable
        end

        it 'does not route to #update via PATCH' do
          expect(patch: '/api/features/1').to_not be_routable
        end

        it 'does not route to #destroy' do
          expect(delete: '/api/features/1').to_not be_routable
        end
      end
    end
  end
end
