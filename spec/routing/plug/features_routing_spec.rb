require 'rails_helper'

module Plug
  RSpec.describe FeaturesController, type: :routing do
    routes { Plug::Engine.routes }

    describe 'routing' do
      it 'routes to #index' do
        expect(get: '/features').to route_to('plug/features#index')
      end

      it 'routes to #new' do
        expect(get: '/features/new').to route_to('plug/features#new')
      end

      it 'routes to #show' do
        expect(get: '/features/1').to_not be_routable
      end

      it 'routes to #edit' do
        expect(get: '/features/1/edit').to route_to('plug/features#edit', id: '1')
      end

      it 'routes to #create' do
        expect(post: '/features').to route_to('plug/features#create')
      end

      it 'routes to #update via PUT' do
        expect(put: '/features/1').to route_to('plug/features#update', id: '1')
      end

      it 'routes to #update via PATCH' do
        expect(patch: '/features/1').to route_to('plug/features#update', id: '1')
      end

      it 'routes to #destroy' do
        expect(delete: '/features/1').to route_to('plug/features#destroy', id: '1')
      end

      it 'routes to #task_execution' do
        expect(post: '/task').to route_to('plug/features#task_execution')
      end
    end
  end
end
