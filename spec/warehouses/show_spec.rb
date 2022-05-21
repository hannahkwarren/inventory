# spec/warehouses/show_spec.rb
require 'rails_helper'

RSpec.describe 'Warehouse show view', type: :feature do
  it 'shows warehouse details' do
    warehouse1 = Warehouse.create(name: '5-Star Fulfillment',
                                  address: '123 Mail Ct',
                                  city: 'New York',
                                  state: 'NY',
                                  zip: '15037')

    warehouse2 = Warehouse.create(name: '4-Star Fulfillment',
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
end
