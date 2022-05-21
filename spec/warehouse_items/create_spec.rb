# spec/warehouse_items/create_spec.rb
require 'rails_helper'

RSpec.describe 'Inventory (warehouse_items) create', type: :feature do
  it 'can add item inventory to a warehouse location' do
    item1 = Item.create(name: 'Logitech MX Anywhere Mouse', description: 'Powder Pink', weight_lbs: 0.2)
    warehouse1 = Warehouse.create(name: 'Smaller Zon Competitor',
                                  address: '123 Main Street',
                                  city: 'Syracuse',
                                  state: 'NY',
                                  zip: '13295')

    visit warehouse_path(warehouse1)
    click_link 'Add Inventory at Smaller Zon Competitor'

    page.select 'Logitech MX Anywhere Mouse, Powder Pink', from: 'warehouse_item_item_id'
    fill_in :quantity, with: 100
    fill_in :aisle, with: 1

    click_button 'Add Inventory to Warehouse'

    expect(current_path).to eq(inventory_path)
    expect(page).to have_content(warehouse1.name)
    expect(page).to have_content('Logitech MX Anywhere Mouse')
    expect(page).to have_content('100')
  end
end
