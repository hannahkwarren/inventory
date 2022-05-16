# spec/items/delete_spec.rb
require 'rails_helper'

RSpec.describe 'Item Delete' do
  it 'can delete an item' do
    item1 = Item.create(name: 'Nalgene 24 oz', description: 'BPA-free plastic bottle, green', weight_lbs: 0.3)
    item2 = Item.create(name: 'Nalgene 24 oz', description: 'BPA-free plastic bottle, black', weight_lbs: 0.3)

    visit "/items/#{item1.id}"

    click_button 'Delete This Item'

    expect(current_path).to eq('/items')

    expect(page).to_not have_content(item1.description)
    expect(page).to have_content(item2.description)
  end

end
