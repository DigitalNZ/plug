# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Plug do
  describe '.enabled?' do
    let!(:feature) { create(:feature, name: 'Map') }

    context 'enabled' do
      it 'returns true by slug' do
        expect(described_class.enabled?('map')).to eq true
      end

      it 'returns true by name' do
        expect(described_class.enabled?('Map')).to eq true
      end

      it 'returns true by symbol' do
        expect(described_class.enabled?(:map)).to eq true
      end

      it 'returns true if feature not found' do
        expect(described_class.enabled?(:random)).to eq true
      end
    end

    context 'disabled' do
      before { feature.disable! }

      it 'returns false by slug' do
        expect(described_class.enabled?('map')).to eq false
      end

      it 'returns false by name' do
        expect(described_class.enabled?('Map')).to eq false
      end

      it 'returns false by symbol' do
        expect(described_class.enabled?(:map)).to eq false
      end
    end
  end

  describe '.notice' do
    let!(:feature) { create(:feature, name: 'Map', notice: 'The Map is not available') }

    context 'enabled feature' do
      it 'returns nil' do
        expect(described_class.notice('map')).to eq nil
      end
    end

    context 'disabled feature' do
      before do
        feature.disable!
      end

      it 'returns the notice' do
        expect(described_class.notice('map')).to eq 'The Map is not available'
      end

      it 'accepts custom HTML block' do
        map_notice = described_class.notice('map') do |notice|
          "<div class='alert'>#{notice}</div>"
        end

        expect(map_notice).to eq "<div class='alert'>The Map is not available</div>"
      end

      it 'returns nil if notice is not present' do
        feature.notice = nil
        feature.save

        map_notice = described_class.notice('map') do |notice|
          "<div class='alert'>#{notice}</div>"
        end

        expect(map_notice).to eq nil
      end
    end
  end
end
