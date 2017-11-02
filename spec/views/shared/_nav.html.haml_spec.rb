require 'rails_helper'

RSpec.describe 'shared/_nav.html.haml', type: :view do
  it 'displays logo' do
    render
    expect(rendered).to match(/Plug/)
  end
end
