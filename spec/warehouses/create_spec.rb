# spec/warehouses/create_spec.rb
require 'rails_helper'

RSpec.describe 'Warehouse create functionality', type: :feature do
  it 'can create a new warehouse location' do
    visit new_warehouse_path

    expect(page).to have_content('Create a New Warehouse Facility')
    fill_in :name, with: 'Warehouse One'
    fill_in :address, with: '123 Main Street'
    fill_in :city, with: 'Syracuse'
    fill_in :state, with: 'NY'
    fill_in :zip, with: '12334'
    click_button 'Create Warehouse'

    expect(current_path).to eq('/warehouses')
    expect(page).to have_content('Warehouse One')
    expect(page).to have_content('123 Main Street Syracuse, NY 12334')
  end
end
