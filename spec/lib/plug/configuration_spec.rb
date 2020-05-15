require "rails_helper"

RSpec.describe Plug::Configuration do
  let(:buttons_config) { [{label: "Clear Cache", task: "tmp:cache:clear"}] }

  it "allows the addition of buttons to the configuration" do
    Plug.buttons = buttons_config
    expect(Plug.buttons).to eq buttons_config
  end
end
