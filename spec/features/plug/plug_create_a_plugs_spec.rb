require 'rails_helper'

RSpec.feature 'create a plug', type: :feature, js: true do
  before do
    visit root_path
  end

  scenario 'displays create a plug button' do
    expect(page).to have_link 'Create a plug'
  end

  scenario 'valid plug' do
    click_link 'Create a plug'
    fill_in('Name', with: 'Awesome feature')
    click_button 'Save'
    visit root_path
    expect(page).to have_content 'Awesome feature'
  end

  scenario 'invalid plug' do

  end
end
