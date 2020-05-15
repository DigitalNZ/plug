require "rails_helper"

module Plug
  RSpec.describe Feature, type: :model do
    context "validations" do
      it { should validate_presence_of(:name).with_message("Feature name is required") }
      it { should validate_presence_of(:state).with_message("Feature state is required") }

      # For some reason, shoulda-matchers can't validate uniqueness with message. :(
      it "validates uniqueness" do
        create(:feature, name: "Unique")
        duplicate_feature = build(:feature, name: "Unique")
        duplicate_feature.valid?

        expect(duplicate_feature.errors.messages[:name].first).to eq "Feature name must be unique"
      end
    end

    context "states" do
      let(:feature) { build(:feature) }

      it "has enabled value by default" do
        expect(feature.enabled?).to eq true
      end

      it "transition from enabled to disabled on disable" do
        expect(feature).to transition_from(:enabled).to(:disabled).on_event(:disable)
      end

      it "transition from disabled to enabled on enable" do
        expect(feature).to transition_from(:disabled).to(:enabled).on_event(:enable)
      end
    end

    context "callbacks" do
      it "generates a slug" do
        feature = create(:feature, name: "Most awesome feature")

        expect(feature.slug).to eq "most-awesome-feature"
      end
    end

    context "scopes" do
      it "finds by slug or name" do
        feature = create(:feature, name: "Session")

        expect(described_class.slug_and_name("session").first).to eq feature
        expect(described_class.slug_and_name("Session").first).to eq feature
      end
    end
  end
end
