require 'rails_helper'

RSpec.describe Plug::Plug, type: :model do
  context 'validations' do
    it { should validate_presence_of :name }
  end
end
