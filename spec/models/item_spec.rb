# spec/models/item_spec.rb
require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should have_many(:warehouse_items) }
    it { should have_many(:warehouses).through(:warehouse_items) }
  end

  describe 'validations' do
    it { should validate_presence_of(:weight_lbs) }
    it { should validate_numericality_of(:weight_lbs) }
  end
end
