# spec/models/warehouse_spec.rb
require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe 'relationships' do
    it { should have_many(:warehouse_items) }
    it { should have_many(:items).through(:warehouse_items) }
  end
end
