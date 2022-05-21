# spec/items/new_spec.rb
require 'rails_helper'

RSpec.describe 'New Item form', type: :feature do
  it 'can create a new item' do
    visit new_item_path

    fill_in :name, with: 'LOreal Hair Dye'
    fill_in :description, with: 'Neon Pink'
    fill_in 'Weight (In Pounds):', with: 0.5

    click_button 'Create Item'

    expect(page).to have_content('Details:')
    expect(page).to have_content('LOreal Hair Dye')
    expect(page).to have_content('Description: Neon Pink')
    expect(page).to have_content('Weight: 0.5 lbs')
  end
end
