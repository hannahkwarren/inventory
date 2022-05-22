# spec/warehouses/show_spec.rb
require 'rails_helper'

RSpec.describe 'Warehouse show view', type: :feature do
  it 'shows warehouse details' do
    warehouse1 = Warehouse.create(name: '5-Star Fulfillment',
                                  address: '123 Mail Ct',
                                  city: 'New York',
                                  state: 'NY',
                                  zip: '15037')

    Warehouse.create(name: '4-Star Fulfillment',
                                    address: '456 Mail Ct',
                                    city: 'New York',
                                    state: 'NY',
                                    zip: '15037')

    visit warehouse_path(warehouse1)

    expect(page).to have_content('5-Star Fulfillment')
    expect(page).to have_content('123 Mail Ct New York, NY 15037')

    expect(page).to_not have_content('4-Star Fulfillment')
    expect(page).to_not have_content('456 Mail Ct New York, NY 15037')
  end

  it 'shows the inventory at this warehouse location' do
    warehouse1 = Warehouse.create(name: '5-Star Fulfillment',
      address: '123 Mail Ct',
      city: 'New York',
      state: 'NY',
      zip: '15037')

    item1 = Item.create(name: 'Monopoly', description: '100th anniversary edition', weight_lbs: 1)
    warehouse1.warehouse_items.create(item_id: item1.id, warehouse_id: warehouse1.id, quantity: 15, aisle: 1)

    warehouse2 = Warehouse.create(name: '4-Star Fulfillment',
      address: '456 Mail Ct',
      city: 'New York',
      state: 'NY',
      zip: '15037')

    item2 = Item.create(name: 'Taboo', description: '2022 Edition', weight_lbs: 1.5)
    warehouse2.warehouse_items.create(item_id: item2.id, warehouse_id: warehouse2.id, quantity: 20, aisle: 1)

    visit warehouse_path(warehouse2)

    expect(page).to have_content("Item No. #{item2.id}, Taboo, 2022 Edition")
    expect(page).to have_content('Per-Item Weight: 1.5 lbs')
    expect(page).to have_content('Item Quantity: 20')

    expect(page).to_not have_content("Item No. #{item1.id}")
    expect(page).to_not have_content('Per-Item Weight: 1 lbs')
    expect(page).to_not have_content('Item Quantity: 15')
  end
end
