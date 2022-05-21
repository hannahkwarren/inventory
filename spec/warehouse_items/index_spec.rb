# spec/warehouse_items/index_spec.rb
require 'rails_helper'

RSpec.describe 'Inventory (warehouse items) index', type: :feature do
  it 'shows existing inventory' do
    item1 = Item.create(name: 'Logitech MX Anywhere Mouse', description: 'Powder Pink', weight_lbs: 0.2)
    warehouse1 = Warehouse.create(name: 'Smaller Zon Competitor',
                                  address: '123 Main Street',
                                  city: 'Syracuse',
                                  state: 'NY',
                                  zip: '13295')

    inventory1 = WarehouseItem.create(warehouse_id: warehouse1.id, item_id: item1.id, quantity: 20, aisle: 2)

    visit inventory_path

    expect(page).to have_content('Item Name: Logitech MX Anywhere Mouse')
    expect(page).to have_content('Quantity: 20')
    expect(page).to have_content('Aisle No: 2')
  end
end
