# spec/items/show_spec.rb
require 'rails_helper'

RSpec.describe 'Items show page' do
  it 'has correct item details' do
    item1 = Item.create(name: 'Logitech MX Anywhere Mouse', description: 'Silver', weight_lbs: 0.2)
    item2 = Item.create(name: 'Apple Magic Mouse', description: 'White', weight_lbs: 0.1)

    visit "/items/#{item2.id}"

    expect(page).to have_content('Item: Apple Magic Mouse')
    expect(page).to have_content('Description: White')
    expect(page).to have_content('Weight: 0.1 lbs')

    expect(page).to_not have_content('Item: Logitech MX Anywhere Mouse')
    expect(page).to_not have_content('Description: Silver')
    expect(page).to_not have_content('Weight: 0.2 lbs')
  end

  

end
