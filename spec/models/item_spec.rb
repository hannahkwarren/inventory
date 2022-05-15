# spec/models/item_spec.rb
require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should have_many(:warehouse_items) }
    it { should have_many(:warehouses).through(:warehouse_items)}
  end
end
