# spec/items/edit_spec.rb
require 'rails_helper'

RSpec.describe 'Item edit view', type: :feature do
  it 'can edit an existing item and save changes' do
    item1 = Item.create(name: 'Converse Sneakers', weight_lbs: 1.5, description:'Black and white classics.')

    visit edit_item_path(item1)

    fill_in :name, with: 'Converse - Chucks!'
    click_button 'Save Changes'

    expect(current_path).to eq(item_path(item1))

    expect(page).to have_content('Item: Converse - Chucks!')
  end
end
