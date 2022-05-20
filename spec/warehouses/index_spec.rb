# spec/warehouses/index_spec.rb
require 'rails_helper'

RSpec.describe 'Warehouses index page', type: :feature do
  it 'has all warehouses' do
    warehouse1 = Warehouse.create(name:'Amazon Warehouse Zone 1',
                                  address: '123 Main Street',
                                  city: 'Syracuse',
                                  state: 'NY',
                                  zip: '13295')
    warehouse2 = Warehouse.create(name:'Amazon Zone 2',
                                  address: '123 Main Street',
                                  city: 'Syracuse',
                                  state: 'NY',
                                  zip: '13295')
    warehouse3 = Warehouse.create(name:'Smaller Zon Competitor',
                                  address: '123 Main Street',
                                  city: 'Syracuse',
                                  state: 'NY',
                                  zip: '13295')

    visit warehouses_path
    expect(page).to have_content('Amazon Warehouse Zone 1')
    expect(page).to have_content('Amazon Zone 2')
    expect(page).to have_content('Smaller Zon Competitor')
  end
end
