# spec/items/index_spec.rb
require 'rails_helper'

RSpec.describe 'Items index view', type: :feature do
  it 'shows all items regardless of warehouse location' do
    item1 = Item.create(name: 'Macbook Pro 15in', description: 'Space Gray', weight_lbs: 3.2)
    item2 = Item.create(name: 'Macbook Pro 13in', description: 'Silver', weight_lbs: 2.6)
    item3 = Item.create(name: 'iPhone 13', description: 'blue', weight_lbs: 0.8)

    visit items_path

    expect(page).to have_content('Macbook Pro 15in')
    expect(page).to have_content('Macbook Pro 13in')
    expect(page).to have_content('iPhone 13')

    within(".item-#{item3.id}") do
      expect(page).to have_content('Item Description: blue')
      expect(page).to have_content('Item Weight, Pounds: 0.8')
    end
  end

end
