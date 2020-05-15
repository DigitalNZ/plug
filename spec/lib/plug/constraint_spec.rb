require "rails_helper"

module Plug
  RSpec.describe Constraint do
    describe "#matches?" do
      let(:request) { double }

      it "returns false" do
        create(:feature, name: "Map")

        expect(described_class.new("map").matches?(request)).to eq true
      end

      it "returns true" do
        feature = create(:feature, name: "Map")
        feature.disable!
        expect(described_class.new("map").matches?(request)).to eq false
      end
    end
  end
end
