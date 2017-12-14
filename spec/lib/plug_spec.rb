require 'rails_helper'

RSpec.describe Plug do
  describe '.enabled?' do
    let!(:feature) { create(:feature, name: 'Map') }

    context 'enabled' do
      it 'returns true by slug' do
        expect(Plug.enabled?('map')).to eq true
      end

      it 'returns true by name' do
        expect(Plug.enabled?('Map')).to eq true
      end

      it 'returns true by symbol' do
        expect(Plug.enabled?(:map)).to eq true
      end
    end

    context 'disabled' do
      before { feature.disable! }

      it 'returns false by slug' do
        expect(Plug.enabled?('map')).to eq false
      end

      it 'returns false by name' do
        expect(Plug.enabled?('Map')).to eq false
      end

      it 'returns false by symbol' do
        expect(Plug.enabled?(:map)).to eq false
      end
    end
  end
end
