# frozen_string_literal: true

require 'rails_helper'

module Plug
  RSpec.describe SiteNotice, type: :model do
    describe 'validations' do
      it { is_expected.to validate_presence_of(:name).with_message('Site notice name is required') }
      it { is_expected.to validate_presence_of(:state).with_message('Site notice state is required') }

      # For some reason, shoulda-matchers can't validate uniqueness with message. :(
      it 'validates uniqueness' do
        create(:site_notice, name: 'Unique')
        duplicate_site_notice = build(:site_notice, name: 'Unique')
        duplicate_site_notice.valid?

        expect(duplicate_site_notice.errors.messages[:name].first).to eq 'Site notice name must be unique'
      end
    end

    describe 'states' do
      let(:site_notice) { build(:site_notice) }

      it 'has enabled value by default' do
        expect(site_notice.enabled?).to eq true
      end

      it 'transition from enabled to disabled on disable' do
        expect(site_notice).to transition_from(:enabled).to(:disabled).on_event(:disable)
      end

      it 'transition from disabled to enabled on enable' do
        expect(site_notice).to transition_from(:disabled).to(:enabled).on_event(:enable)
      end
    end

    describe 'callbacks' do
      it 'generates a slug' do
        site_notice = create(:site_notice, name: 'Most awesome site notice')

        expect(site_notice.slug).to eq 'most-awesome-site-notice'
      end
    end

    describe 'scopes' do
      it 'finds by slug or name' do
        site_notice = create(:site_notice, name: 'Session')

        expect(described_class.slug_and_name('Session').first).to eq site_notice
      end
    end
  end
end
