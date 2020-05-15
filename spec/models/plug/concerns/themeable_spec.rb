require 'rails_helper'

RSpec.describe Plug::Concerns::Themeable do
  class TestModel
    include Plug::Concerns::Themeable

    attr_accessor :theme

    def initialize
      @theme = 'background: orange; icon:flag'
    end
  end

  describe '#icon' do
    let(:model) { TestModel.new }

    it 'has returns flag' do
      expect(model.icon).to eq 'flag'
    end
  end
end
